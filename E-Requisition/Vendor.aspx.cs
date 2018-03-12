using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace E_Requisition
{
   
    public partial class Vendor : System.Web.UI.Page
    {
        protected string name;
        protected string phone;
        protected string loginid;
        protected int vendor_id;
        protected int autogen_id;
        private String conString = "Data Source=.\\sqlexpress;Initial Catalog=jgec;Integrated Security=True;Pooling=False";
        protected int req_id;
        protected int quantity;
        protected String item_name;
        protected String req_date;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                // no session variables
                Response.Redirect("Home.aspx");
            }
            else if ((Session["user_type"].ToString() != "vendor")) 
            {
                // not a valid user
                Response.Redirect("Home.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter da = new SqlDataAdapter("select * from Vendor", con);


                DataSet ds = new DataSet();
                da.Fill(ds, "Vendor");

                DataTable dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    if (Session["valid_user"].ToString() == dr[0].ToString())
                    {
                        name = dr[3].ToString();
                        phone = dr[4].ToString();
                        loginid = dr[1].ToString();
                        vendor_id = int.Parse(Session["valid_user"].ToString());
                    }
                }

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(dt);
                //setting up essential sessions

                if (Session["load"] == null)
                {
                    Session["item_name"] = "";
                    Session["req_date"] = 0;
                    Session["quantity"] = 0;
                    Session["req_id_now"] = 0;
                }
                //loading gridview At loading 
                getdata_sold_list();
                setdata_sold_list();
                getdata_setPrice_list();
                binddata_setPrice_list();


            }
        }

        protected void img_Actn_mnu_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Home.aspx"); 
        }

        private void getdata_sold_list()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter da_sold = new SqlDataAdapter("select * from Order_Purchased", con);

            DataSet ds_sold = new DataSet();
            da_sold.Fill(ds_sold, "Requisition_Items");
            DataTable dt_sold = ds_sold.Tables[0];

            Session["da_sold"] = da_sold;
            Session["dt_sold"] = dt_sold;
         
        }

        private void setdata_sold_list()
        {
            GridView1.DataSource = (DataTable)Session["dt_sold"];
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e) //fitering ruesults only for loggedin vendor
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int vendor_id_row = int.Parse(((DataTable)Session["dt_sold"]).Rows[e.Row.RowIndex][6].ToString());

                if (vendor_id_row == vendor_id)
                {
                    e.Row.Visible = true;
                }
                else { e.Row.Visible = false; }
            }
        }

        private void getdata_setPrice_list()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Requisition_Items", con);

            DataSet ds = new DataSet();
            da.Fill(ds, "Requisition_Items");
            DataTable dt = ds.Tables[0];

            Session["da"] = da;
            Session["dt"] = dt;
        }
        protected void binddata_setPrice_list()
        {
            GridView2.DataSource = (DataTable)Session["dt"];
            GridView2.DataBind();
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Status_row = ((DataTable)Session["dt"]).Rows[e.Row.RowIndex][4].ToString();
                int req_id_row = int.Parse(((DataTable)Session["dt"]).Rows[e.Row.RowIndex][0].ToString());

                if (Status_row == "Processing" ) 
                {
                    if (check_vendor_item(req_id_row) == true)
                    {
                        e.Row.Visible = true;
                    }
                    else { e.Row.Visible = false; }
                }
                else { e.Row.Visible = false; }
            }
        }

        protected bool check_vendor_item(int req_id_given)
        {
                bool Editable=false;

                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter da = new SqlDataAdapter("select * from Requested_Items", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "Requested_Items");

                DataTable dt = ds.Tables[0];
                
                foreach (DataRow dr in dt.Rows)
                {
                    if (int.Parse(dr[1].ToString()) == req_id_given)
                    {
                        if (int.Parse(dr[4].ToString()) == vendor_id)
                        {
                            //this vendor has already set a price for this item
                            Editable= false;
                            break;
                        }
                        else
                        {
                            //other vendors have set their prices for the request_ID
                            Editable= true;
                        }
                    }
                    else
                    {
                        //no price set for the request
                        Editable= true;
                    }
                }

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(dt);

                return Editable;
       }


        private int Autogenrate()
        {

            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select max(V_R_ID) from Requested_Items", con);
            int count = Convert.ToInt16(cmd.ExecuteScalar()) + 1;
            return count;

        }//end of the autogen function

        protected void Submit_price_Data_Click(object sender, EventArgs e)//submit button clicked
        {
            if (check_price_value(Item_price.Text)==false)  //price text field cannot be blank
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('Set A Valid Price');", true);
            }
            else if (int.Parse(Item_price.Text)<0)//price cannot be negetive
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('You can not set negetive Price');", true);
            }
            else
            {
            autogen_id = Autogenrate();//auto generated id
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("Insert into Requested_Items values(@var1,@var2,@var3,@var4,@var5)", con);
            cmd.Parameters.AddWithValue("@var1", autogen_id);
            cmd.Parameters.AddWithValue("@var2", int.Parse(Session["req_id_now"].ToString()));
            cmd.Parameters.AddWithValue("@var3", Session["item_name"].ToString());
            cmd.Parameters.AddWithValue("@var4", int.Parse(Item_price.Text));
            cmd.Parameters.AddWithValue("@var5", vendor_id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box(' Price set for '" + Session["item_name"].ToString() + "'');", true);
            Item_price.Text = "";
            
            //loading gridview At loading 
            getdata_sold_list();
            setdata_sold_list();//for sold items
            getdata_setPrice_list();
            binddata_setPrice_list();//for refresh the set price list

            Set_items_Prices.Style.Add("display", "none");
            Set_price_form.Style.Add("display", "block");
            Sold_items.Style.Add("display", "none");
            }
            
        

        }

        protected bool check_price_value(string prc) //check price for validation
        {
            bool result_price=true;
            Regex reg = new Regex(@"^[0-9]+$");
            try
            {
                if (String.IsNullOrWhiteSpace(prc))
                {
                    result_price = false;
                }
                if (!reg.IsMatch(prc))
                {
                    result_price = false;
                }
            }
            catch (Exception e) 
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('Enter a valid price');", true);
            }
            return result_price;
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "set_price")  //set price button clicked
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());

                req_id=int.Parse(((DataTable)Session["dt"]).Rows[index][0].ToString());
                quantity = int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString());
                req_date = ((DataTable)Session["dt"]).Rows[index][3].ToString();
                item_name = ((DataTable)Session["dt"]).Rows[index][5].ToString();
                //storing datas in session
                Session["load"] = "set";
                Session["item_name"] = item_name;
                Session["req_date"] = req_date;
                Session["quantity"] = quantity;
                Session["req_id_now"] = req_id;

                Set_items_Prices.Style.Add("display", "block");
                Set_price_form.Style.Add("display", "none");
                Sold_items.Style.Add("display", "none");

            }
        }// End of the button click function

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Set_items_Prices.Style.Add("display", "none");
            Set_price_form.Style.Add("display", "block");
            Sold_items.Style.Add("display", "none");
        }

        protected void btn_sold_list_Click(object sender, EventArgs e)
        {
            Set_items_Prices.Style.Add("display", "none");
            Set_price_form.Style.Add("display", "none");
            Sold_items.Style.Add("display", "block");
        }//end of the button click function
    }
}