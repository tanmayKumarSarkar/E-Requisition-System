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
    public partial class Home : System.Web.UI.Page
    {

        private String user;
        private String conString = "Data Source=.\\sqlexpress;Initial Catalog=jgec;Integrated Security=True;Pooling=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            
                check_Login_Status();
           
        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            Session["user_type"] = hidden_val.Value;
            if (Session["user_type"].ToString() == "vendor") { vendor_login(); }
            else 
            {
                employee_login();
            }
        }

        protected void check_Login_Status() 
        {
            if (Session["valid_user"] != null) 
            {
                if (Session["user_type"].ToString() == "vendor")
                {
                    Response.Redirect("Vendor.aspx");
                }
                else
                {
                    user = Session["user"].ToString();
                    check_user();
                }
            }
        }

        protected void vendor_login() 
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Vendor", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Vendor");

            DataTable dt = ds.Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                if (dr[1].ToString() == User_name.Text)
                {
                    if (dr[2].ToString() == User_password.Text)
                    {
                        //login success
                        Session["valid_user"] = dr[0].ToString();
                        Session["username"] = dr[1].ToString();                        
                        Response.Redirect("Vendor.aspx");
                        
                       
                    }
                    else
                    {
                        //wrong password
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('password incorrect for vendor')", true);
                    }
                }
                else
                {
                      //username or password worng
                      ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('login faild vendor')", true);
                }
            }

            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            da.Update(dt);
     }

        protected void check_user() 
        {
            if (user == "hod")
            {
                //redirect to hod.aspx
                Response.Redirect("Hod.aspx");
            }
            else 
            {
                //redirect to employee.aspx
                Response.Redirect("Employee.aspx");
            }
        }

        protected void employee_login()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Employee", con);
            

            DataSet ds = new DataSet();
            da.Fill(ds, "Employee");

            DataTable dt = ds.Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
               if(dr[1].ToString()==User_name.Text)
               {
                   if (dr[2].ToString() == User_password.Text)
                    {
                        //login success
                        Session["valid_user"] = dr[0].ToString();
                        Session["username"] = dr[1].ToString();
                        user = dr[6].ToString();
                        Session["user"] = user;
                        Session["user_type"] = user;
                        check_user();
                    }
                    else
                    {
                        //wrong password
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('wrong password for employee')", true);
                    }
               }
               else
               {
                    //username or password worng
                   ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('login failed for employee')", true);
               }
            }

            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            da.Update(dt);



        }
    }
}