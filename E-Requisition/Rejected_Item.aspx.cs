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
    public partial class Rejected_Item : System.Web.UI.Page
    {

        private String conString = "Data Source=.\\sqlexpress;Initial Catalog=jgec;Integrated Security=True;Pooling=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
                BindData();
            }
        }

        private void GetData()
        {
           
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter da = new SqlDataAdapter("select * from Requisition_Items", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "Requisition_Items");
                DataTable dt = ds.Tables[0];

                Session["da"] = da;
                Session["dt"] = dt;
            
        }

        private void BindData()
        {
            GridView_Cancel_List.DataSource = (DataTable)Session["dt"];
            GridView_Cancel_List.DataBind();

        }

        protected void GridView_Cancel_List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

         //checking for status cancelled if is in same dept
                if (((((DataTable)Session["dt"]).Rows[e.Row.RowIndex][4].ToString()) != "Cancelled") || (Check_for_same_dept_by_ID((((DataTable)Session["dt"]).Rows[e.Row.RowIndex][2].ToString())) == false))
                {
                    e.Row.Visible = false;
                }                
            }
        }

        protected bool Check_for_same_dept_by_ID(String Emp_ID)
        {
            bool isSameDep = false;
            String emp_dep = "";
            String hod_dep = "";

            SqlConnection con_check = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select DEPT from Employee where Emp_ID=@var1 ", con_check);
            cmd.Parameters.AddWithValue("@var1", Emp_ID);
            con_check.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                emp_dep = rd[0].ToString();
            }
            con_check.Close();


            SqlCommand cmd2 = new SqlCommand("select DEPT from Employee where Login_ID=@var2 ", con_check);
            cmd2.Parameters.AddWithValue("@var2", Session["username"].ToString());
            con_check.Open();
            SqlDataReader rd2 = cmd2.ExecuteReader();
            while (rd2.Read())
            {
                hod_dep = rd2[0].ToString();
            }
            con_check.Close();

            //Response.Write(hod_dep + "/" + emp_dep);
            if (hod_dep == emp_dep) { isSameDep = true; }

            return isSameDep;
        }

    }
}