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
    public partial class Set_Item_Price : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("select * from Requested_Items", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Requested_Items");
            DataTable dt = ds.Tables[0];

            Session["da"] = da;
            Session["dt"] = dt;
        }

        private void BindData()
        {
            GridView_Buy.DataSource = (DataTable)Session["dt"];
            GridView_Buy.DataBind();

        }

        protected void GridView_Buy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "buy")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                
                if (check_budget_of_dept_by_hod_username(int.Parse(((DataTable)Session["dt"]).Rows[index][3].ToString()), get_quantity_by_reqid(int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString()))))
                {
                    // updating into requisition table
                    updating_status_into_requisition_table(int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString()), "Purchased");

                    //reducing budget of depertment
                    reduce_budget_of_dept_by_hod_username(int.Parse(((DataTable)Session["dt"]).Rows[index][3].ToString()), get_quantity_by_reqid(int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString())));

                    //inserting in order_purchased table
                    SqlConnection con_ins_op = new SqlConnection(conString);
                    SqlCommand cmd_ins_op = new SqlCommand("insert into Order_Purchased values (@var1,@var2,@var3,@var4,@var5,@var6,@var7)", con_ins_op);
                    cmd_ins_op.Parameters.AddWithValue("@var1", AutoGen());
                    cmd_ins_op.Parameters.AddWithValue("@var2", int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString()));
                    cmd_ins_op.Parameters.AddWithValue("@var3", get_empid_by_reqid(int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString())));
                    cmd_ins_op.Parameters.AddWithValue("@var4", ((DataTable)Session["dt"]).Rows[index][2].ToString());
                    cmd_ins_op.Parameters.AddWithValue("@var5", int.Parse(((DataTable)Session["dt"]).Rows[index][3].ToString()));
                    cmd_ins_op.Parameters.AddWithValue("@var6", get_quantity_by_reqid(int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString())));
                    cmd_ins_op.Parameters.AddWithValue("@var7", int.Parse(((DataTable)Session["dt"]).Rows[index][4].ToString()));
                    con_ins_op.Open();
                    cmd_ins_op.ExecuteNonQuery();
                    con_ins_op.Close();

                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('you have puchased the ITEM Successfully');", true);

                    // binding for requested table
                    GetData();
                    BindData();

                    Response.Redirect("Hod.aspx");

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('You dont have sufficient amount');", true);
                }
                

         
            }
            else if (e.CommandName == "buy_cancel")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());

                // updating into requisition table
                updating_status_into_requisition_table(int.Parse(((DataTable)Session["dt"]).Rows[index][1].ToString()), "Cancelled");

                // binding for requested table
                GetData();
                BindData();
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", "alert_box('The Item is Rejected !!');", true);

            }
            
        }

        private bool check_budget_of_dept_by_hod_username(int price, int quantity)
        {
            bool isInBudget = false;
            
            int budget = 0;
            SqlConnection con_1 = new SqlConnection(conString);
            SqlCommand cmd1 = new SqlCommand("select Budget from Employee where Login_ID=@var3 ", con_1);
            cmd1.Parameters.AddWithValue("@var3", Session["username"].ToString());
            con_1.Open();
            SqlDataReader rd1 = cmd1.ExecuteReader();
            while (rd1.Read())
            {
                budget = int.Parse(rd1[0].ToString());
            }
            con_1.Close();
            if ( (budget - (price * quantity)) >0)
            {
                isInBudget = true;
                
            }
            
            return isInBudget;
        }

        private void reduce_budget_of_dept_by_hod_username(int price,int quantity)
        {
            SqlConnection con_bgt = new SqlConnection(conString);
            SqlCommand cmd_bgt = new SqlCommand("update Employee set Budget =@var1 where Login_ID=@var2", con_bgt);
            cmd_bgt.Parameters.AddWithValue("@var1", set_budget(price ,quantity));
            cmd_bgt.Parameters.AddWithValue("@var2", Session["username"].ToString());
            con_bgt.Open();
            cmd_bgt.ExecuteNonQuery();
            con_bgt.Close();
        }

        private String set_budget(int price, int quantity)
        {
            int budget = 0;
            SqlConnection con_2 = new SqlConnection(conString);
            SqlCommand cmd2 = new SqlCommand("select Budget from Employee where Login_ID=@var3 ", con_2);
            cmd2.Parameters.AddWithValue("@var3", Session["username"].ToString());
            con_2.Open();
            SqlDataReader rd2 = cmd2.ExecuteReader();
            while (rd2.Read())
            {
                budget = int.Parse(rd2[0].ToString());
            }
            con_2.Close();
            budget = budget - (price * quantity);
            return budget.ToString();
        }

        protected void updating_status_into_requisition_table(int req_id,string status)
        {
            SqlConnection con_up = new SqlConnection(conString);

            SqlCommand cmd_up = new SqlCommand("update Requisition_Items set Status =@var1 where Req_ID =@var2", con_up);
            cmd_up.Parameters.AddWithValue("@var1", status);
            cmd_up.Parameters.AddWithValue("@var2", req_id);
            con_up.Open();
            cmd_up.ExecuteNonQuery();
            con_up.Close();
        }


        private int get_quantity_by_reqid(int req_id)
        {
            int quantity = 0;

            SqlConnection con_empid = new SqlConnection(conString);
            con_empid.Open();
            SqlCommand cm_a = new SqlCommand("select Quantity from Requisition_Items where Req_ID =@var1 ", con_empid);
            cm_a.Parameters.AddWithValue("@var1", req_id);
            quantity = Convert.ToInt32(cm_a.ExecuteScalar());
            con_empid.Close();

            return quantity;
        }

        protected int get_empid_by_reqid(int req_id)
        {
            int emp_id = 0;

            SqlConnection con_empid = new SqlConnection(conString);
            con_empid.Open();
            SqlCommand cm_a = new SqlCommand("select Emp_ID from Requisition_Items where Req_ID =@var1 ", con_empid);
            cm_a.Parameters.AddWithValue("@var1",req_id);
            emp_id = Convert.ToInt32(cm_a.ExecuteScalar());
            con_empid.Close();            

            return emp_id;
        }

        protected void GridView_Buy_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (!is_in_same_dep(int.Parse(((DataTable)Session["dt"]).Rows[e.Row.RowIndex][1].ToString())) || !is_status_processing(int.Parse(((DataTable)Session["dt"]).Rows[e.Row.RowIndex][1].ToString())))
                
                {
                    e.Row.Visible = false;

                }
            }
        }

        private bool is_status_processing(int req_id)
        {
            bool isStatPrcng = false;

            String status = "";
            SqlConnection con_stat = new SqlConnection(conString);
            con_stat.Open();
            SqlCommand cm_s = new SqlCommand("select Status from Requisition_Items where Req_ID =@var1 ", con_stat);
            cm_s.Parameters.AddWithValue("@var1", req_id);
            status = cm_s.ExecuteScalar().ToString();
            con_stat.Close();
            if (status == "Processing") { isStatPrcng = true; }

            return isStatPrcng;
        }

        private bool is_in_same_dep(int req_id)
        {
            bool isSameDep = false;
            int empId = get_empid_by_reqid(req_id);

            String emp_dep = "";
            String hod_dep = "";

            SqlConnection con_check = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select DEPT from Employee where Emp_ID=@var1 ", con_check);
            cmd.Parameters.AddWithValue("@var1", empId);
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

            if (hod_dep == emp_dep) { isSameDep = true; }

            return isSameDep;
        }

        protected int AutoGen()
        {
            SqlConnection con_autogen = new SqlConnection(conString);
            con_autogen.Open();

            SqlCommand cm_a = new SqlCommand("select max(O_ID) from Order_Purchased", con_autogen);
            int count = Convert.ToInt16(cm_a.ExecuteScalar()) + 1;
            con_autogen.Close();
            return count;
        }//End of the autogen function
    }
}