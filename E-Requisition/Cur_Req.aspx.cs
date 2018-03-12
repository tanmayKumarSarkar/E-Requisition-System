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
    public partial class Cur_Req : System.Web.UI.Page
    {

        private String conString = "Data Source=.\\sqlexpress;Initial Catalog=jgec;Integrated Security=True;Pooling=False";
        
        
        public void Do_Logout() 
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
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
            GridView_Cur_Req.DataSource = (DataTable)Session["dt"];
            GridView_Cur_Req.DataBind();

        }






        protected void GridView_Cur_Req_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView_Cur_Req_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Proceed")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString()); 

                //GridViewRow gr = GridView_Cur_Req.Rows[index];


                ((DataTable)Session["dt"]).Rows[index][4] = "Processing";
                SqlCommandBuilder cb = new SqlCommandBuilder((SqlDataAdapter)Session["da"]);
                ((SqlDataAdapter)Session["da"]).Update((DataTable)Session["dt"]);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('The Item is now visible to all vendors !!');", true);
                GetData();
                BindData();
                //Response.Redirect("hod.aspx");
            }
            else if (e.CommandName == "req_cancel")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString()); 

                ((DataTable)Session["dt"]).Rows[index][4] = "Cancelled";
                SqlCommandBuilder cb = new SqlCommandBuilder((SqlDataAdapter)Session["da"]);
                ((SqlDataAdapter)Session["da"]).Update((DataTable)Session["dt"]);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('The Item is Rejected !!');", true);
                GetData();
                BindData();
                //Response.Redirect("hod.aspx");
                
            }
            
        }

        protected void GridView_Cur_Req_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (((((DataTable)Session["dt"]).Rows[e.Row.RowIndex][4].ToString()) != "Composed") || (Check_for_same_dept_by_ID((((DataTable)Session["dt"]).Rows[e.Row.RowIndex][2].ToString())) == false))
                {
                     e.Row.Visible = false;
                    
                }
                
                //Response.Write(((DataTable)Session["dt"]).Rows[e.Row.RowIndex][4].ToString());
            }
        }

        protected bool Check_for_same_dept_by_ID(String Emp_ID) 
        { 
            bool isSameDep=false;
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