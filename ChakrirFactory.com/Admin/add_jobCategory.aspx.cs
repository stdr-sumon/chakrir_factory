using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace ChakrirFactory.com.Admin
{
    public partial class add_jobCategory : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["JobSeekerBasicInfo"] != null)
            {
                HttpCookie _JsCookie = Request.Cookies["JobSeekerBasicInfo"];

                Session["Js_ID"] = _JsCookie["Js_ID"].ToString();
                Session["Js_UserName"] = _JsCookie["Js_UserName"].ToString();
                Session["Js_Name"] = _JsCookie["Js_Name"].ToString();

                Response.Redirect("/JobSeeker/index.aspx");
            }

            if (Request.Cookies["CompanyBasicInfo"] != null)
            {
                HttpCookie _cmpCookie = Request.Cookies["CompanyBasicInfo"];

                Session["Cmp_ID"] = _cmpCookie["Cmp_ID"].ToString();
                Session["Cmp_UserName"] = _cmpCookie["Cmp_UserName"].ToString();
                Session["Cmp_Name"] = _cmpCookie["Cmp_Name"].ToString();

                Response.Redirect("/Company/index.aspx");
            }

            if (Request.Cookies["SystemBasicInfo"] != null)
            {
                HttpCookie _cmpCookie = Request.Cookies["SystemBasicInfo"];

                Session["System_ID"] = _cmpCookie["System_ID"].ToString();
                Session["System_UserName"] = _cmpCookie["System_UserName"].ToString();
            }

            if (Session["System_ID"] == null)
            {
                Response.Redirect("/index.aspx");
            }

            if (!IsPostBack)
            {
                BindGridView();
            }

        }
        public void BindGridView()
        {

            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SP_JobCategory_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvCategory.DataSource = ds;
                    gvCategory.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvCategory.DataSource = ds;
                    gvCategory.DataBind();
                    int columncount = gvCategory.Rows[0].Cells.Count;
                    gvCategory.Rows[0].Cells.Clear();
                    gvCategory.Rows[0].Cells.Add(new TableCell());
                    gvCategory.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvCategory.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtCategory = (TextBox)gvCategory.FooterRow.FindControl("txtJobCategoryNameAdd");
                if (txtCategory.Text != "")
                {
                    crudoperations("INSERT", txtCategory.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Category Name Not Given!";
                }
            }
        }
        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategory.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategory.EditIndex = -1;
            BindGridView();

        }
        protected void gvCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategory.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int CategoryID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values["JobCategory_ID"].ToString());
            crudoperations("DELETE", "", CategoryID);

        }
        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Category_ID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Values["JobCategory_ID"].ToString());
            TextBox txtCategory = (TextBox)gvCategory.Rows[e.RowIndex].FindControl("txtJobCategoryName");
            crudoperations("UPDATE", txtCategory.Text, Category_ID);

        }
        protected void crudoperations(string status, string Category_Name, int Category_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_JobCategory_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobCategory_Name", Category_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobCategory_Name", Category_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@JobCategory_ID", Category_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobCategory_ID", Category_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = Category_Name + " details " + status.ToLower() + "d successfully";
                    gvCategory.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = Category_Name + ", Already Exist";
            }
        }
    }
}