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
    public partial class Employee : System.Web.UI.Page
    {
        
        protected int autogen_id;
        protected string name;
        protected string dept;
        protected string phone;
        protected string loginid;
        protected int emp_id;
        private String conString = "Data Source=.\\sqlexpress;Initial Catalog=jgec;Integrated Security=True;Pooling=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                // no session variables
                Response.Redirect("Home.aspx");
            }
            else if ((Session["user_type"].ToString() != "employee"))
            {
                // not a valid user
                Response.Redirect("Home.aspx");
            }
            else 
            {
                
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter da = new SqlDataAdapter("select * from Employee", con);


                DataSet ds = new DataSet();
                da.Fill(ds, "Employee");

                DataTable dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    if (Session["valid_user"].ToString() == dr[0].ToString()) 
                    {
                        emp_id = int.Parse(Session["valid_user"].ToString());
                        name = dr[3].ToString();
                        dept = dr[4].ToString();
                        phone = dr[5].ToString();
                        loginid = dr[1].ToString();
                    }
                }

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(dt);

                //calling getdata
                getdata();
                BindData();
                

            }

        }

        protected void img_Actn_mnu_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Home.aspx"); 
        }



        private int Autogenrate()
        {

            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select max(Req_ID) from Requisition_Items", con);
            int count = Convert.ToInt16(cmd.ExecuteScalar()) + 1;
            return count;
            con.Close();

        }//end of the autogen function

        protected void req_form_submit_Click(object sender, EventArgs e)
        {
            if (Item_Name.Text == "")
            {
                //Text field blank
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('Fillup The Text Field Currectly')", true);
            }
            else{
                if (check_price_value(Item_Quantity.Text) == true)
                {
                    autogen_id = Autogenrate();
                    int quantity = int.Parse(Item_Quantity.Text);
                    SqlConnection con = new SqlConnection(conString);
                    SqlCommand cmd = new SqlCommand("Insert into Requisition_Items values(@var1,@var2,@var3,@var4,@var5,@var6)", con);
                    cmd.Parameters.AddWithValue("@var1", autogen_id);
                    cmd.Parameters.AddWithValue("@var6", Item_Name.Text);
                    cmd.Parameters.AddWithValue("@var2", quantity);
                    cmd.Parameters.AddWithValue("@var3", emp_id);
                    cmd.Parameters.AddWithValue("@var5", "Composed");
                    cmd.Parameters.AddWithValue("@var4", DateTime.Now.ToString());

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('Request SuccessFully Inserted');", true);
                    Item_Name.Text = "";
                    Item_Quantity.Text = "";
                    //setting up gridview
                    getdata();
                    BindData();
                }
                else 
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('Submit With A Valid Quantity');", true);
                    
                }
            }
        }//end of the submission
        
        private void getdata() //getting order status to the gridview
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Requisition_Items", con);

            DataSet ds = new DataSet();
            da.Fill(ds, "Requisition_Items");
            DataTable dt = ds.Tables[0];

            Session["da"] = da;
            Session["dt"] = dt;

        }
        private void BindData()//binding data to the gridview
        {
            GridView1.DataSource = (DataTable)Session["dt"];
            GridView1.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)//filtering data only for the current employee
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int req_id_row = int.Parse(((DataTable)Session["dt"]).Rows[e.Row.RowIndex][2].ToString());
                if (req_id_row == emp_id)
                {
                    e.Row.Visible = true;
                }
                else { e.Row.Visible = false; }
            }
        }//end of the rowbound function

        protected bool check_price_value(string prc) //check price for validation
        {
            bool result_price = true;
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
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('Enter a valid quantity');", true);
            }
            return result_price;
        }

        protected void requested_items_click(object sender, EventArgs e)
        {
            requisition_form.Style.Add("display", "none");
            requested_items.Style.Add("display", "block");
        }

        protected void requisition_form_click(object sender, EventArgs e)
        {
            requested_items.Style.Add("display", "none");
            requisition_form.Style.Add("display", "block");
        }
    }
}