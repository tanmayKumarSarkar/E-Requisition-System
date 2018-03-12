using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace E_Requisition
{
    public partial class Hod : System.Web.UI.Page
    {
        private String conString = "Data Source=.\\sqlexpress;Initial Catalog=jgec;Integrated Security=True;Pooling=False";
        protected string name;
        protected string dept;
        protected string phone;
        protected string loginid;
        protected int emp_id;
        protected String budget;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0) 
            {
                Response.Redirect("Home.aspx");
            }
            else if ((Session["user_type"].ToString() != "hod"))
            {
                // not a valid user
                Response.Redirect("Home.aspx");
            }
            else
            {
                
                SqlConnection con_load = new SqlConnection(conString);
                SqlDataAdapter da_load = new SqlDataAdapter("select * from Employee", con_load);


                DataSet ds_load = new DataSet();
                da_load.Fill(ds_load, "Employee");

                DataTable dt_load = ds_load.Tables[0];

                foreach (DataRow dr in dt_load.Rows)
                {
                    if (Session["valid_user"].ToString() == dr[0].ToString())
                    {
                        emp_id = int.Parse(Session["valid_user"].ToString());
                        name = dr[3].ToString();
                        dept = dr[4].ToString();
                        phone = dr[5].ToString();
                        loginid = dr[1].ToString();
                        budget = dr[7].ToString();
                    }
                }

                SqlCommandBuilder cb_load = new SqlCommandBuilder(da_load);
                da_load.Update(dt_load);
            }
        }

        protected void img_Actn_mnu_Click(object sender, ImageClickEventArgs e)
        {
           // Do_Logout
            
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void btn_current_req_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Cur_Req.aspx");
        }

        protected void btn_purchased_list_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Purchased_Item.aspx");
        }

        protected void btn_price_list_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Buy_From_Item_Price.aspx");
        }

        protected void btn_rejected_list_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Rejected_Item.aspx");
        }
    }
}