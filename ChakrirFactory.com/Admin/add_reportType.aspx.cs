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
    public partial class add_reportType : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_JobReportType_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if(ds.Tables[0].Rows.Count > 0)
                {
                    gvReportType.DataSource = ds;
                    gvReportType.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvReportType.DataSource = ds;
                    gvReportType.DataBind();
                    int columncount = gvReportType.Rows[0].Cells.Count;
                    gvReportType.Rows[0].Cells.Clear();
                    gvReportType.Rows[0].Cells.Add(new TableCell());
                    gvReportType.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvReportType.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvReportType_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew")) {
                TextBox txtReportType = (TextBox)gvReportType.FooterRow.FindControl("txtReportTypeNameAdd");
                if (txtReportType.Text != "")
                {
                    crudoperations("INSERT", txtReportType.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "ReportType Name Not Given!";
                }
            }
        }
        protected void gvReportType_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvReportType.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvReportType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvReportType.EditIndex = -1;
            BindGridView();

        }
        protected void gvReportType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReportType.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvReportType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ReportTypeID = Convert.ToInt32(gvReportType.DataKeys[e.RowIndex].Values["ReportType_ID"].ToString());
            crudoperations("DELETE", "", ReportTypeID);

        }
        protected void gvReportType_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ReportType_ID = Convert.ToInt32(gvReportType.DataKeys[e.RowIndex].Values["ReportType_ID"].ToString());
            TextBox txtReportType = (TextBox)gvReportType.Rows[e.RowIndex].FindControl("txtReportTypeName");
            crudoperations("UPDATE", txtReportType.Text, ReportType_ID);

        }
        protected void crudoperations(string status, string ReportType_Name, int ReportType_ID)
        {
            try {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_JobReportType_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@ReportType_Name", ReportType_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@ReportType_Name", ReportType_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@ReportType_ID", ReportType_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@ReportType_ID", ReportType_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = ReportType_Name + " details " + status.ToLower() + "d successfully";
                    gvReportType.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = ReportType_Name +  ", Already Exist";
            }
        }
    }
}