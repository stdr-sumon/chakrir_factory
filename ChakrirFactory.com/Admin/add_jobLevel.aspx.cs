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
    public partial class add_jobLevel : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_JobLevel_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvJobLevel.DataSource = ds;
                    gvJobLevel.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvJobLevel.DataSource = ds;
                    gvJobLevel.DataBind();
                    int columncount = gvJobLevel.Rows[0].Cells.Count;
                    gvJobLevel.Rows[0].Cells.Clear();
                    gvJobLevel.Rows[0].Cells.Add(new TableCell());
                    gvJobLevel.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvJobLevel.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvJobLevel_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtJobLevel = (TextBox)gvJobLevel.FooterRow.FindControl("txtJobLevelNameAdd");
                if (txtJobLevel.Text != "")
                {
                    crudoperations("INSERT", txtJobLevel.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Job Level Name Not Given!";
                }
            }
        }
        protected void gvJobLevel_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvJobLevel.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvJobLevel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvJobLevel.EditIndex = -1;
            BindGridView();

        }
        protected void gvJobLevel_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJobLevel.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvJobLevel_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int jobLevel_ID = Convert.ToInt32(gvJobLevel.DataKeys[e.RowIndex].Values["JobLevel_ID"].ToString());
            crudoperations("DELETE", "", jobLevel_ID);

        }
        protected void gvJobLevel_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int JobLevel_ID = Convert.ToInt32(gvJobLevel.DataKeys[e.RowIndex].Values["JobLevel_ID"].ToString());
            TextBox txtJobLevel = (TextBox)gvJobLevel.Rows[e.RowIndex].FindControl("txtJobLevelName");
            crudoperations("UPDATE", txtJobLevel.Text, JobLevel_ID);

        }
        protected void crudoperations(string status, string jobLevelName, int JobLevel_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_JobLevel_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobLevel_Name", jobLevelName.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobLevel_Name", jobLevelName.ToUpper());
                        cmd.Parameters.AddWithValue("@JobLevel_ID", JobLevel_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobLevel_ID", JobLevel_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = jobLevelName + " details " + status.ToLower() + "d successfully";
                    gvJobLevel.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = jobLevelName + ", Already Exist";
            }
        }
    }
}