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
    public partial class add_JobNature : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_JobNature_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvJobNature.DataSource = ds;
                    gvJobNature.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvJobNature.DataSource = ds;
                    gvJobNature.DataBind();
                    int columncount = gvJobNature.Rows[0].Cells.Count;
                    gvJobNature.Rows[0].Cells.Clear();
                    gvJobNature.Rows[0].Cells.Add(new TableCell());
                    gvJobNature.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvJobNature.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvJobNature_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtJobNature = (TextBox)gvJobNature.FooterRow.FindControl("txtJobNatureNameAdd");
                if (txtJobNature.Text != "")
                {
                    crudoperations("INSERT", txtJobNature.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Job Nature Name Not Given!";
                }
            }
        }
        protected void gvJobNature_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvJobNature.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvJobNature_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvJobNature.EditIndex = -1;
            BindGridView();

        }
        protected void gvJobNature_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJobNature.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvJobNature_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int jobNatureID = Convert.ToInt32(gvJobNature.DataKeys[e.RowIndex].Values["JobNature_ID"].ToString());
            crudoperations("DELETE", "", jobNatureID);

        }
        protected void gvJobNature_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int JobNature_ID = Convert.ToInt32(gvJobNature.DataKeys[e.RowIndex].Values["JobNature_ID"].ToString());
            TextBox txtJobNature = (TextBox)gvJobNature.Rows[e.RowIndex].FindControl("txtJobNatureName");
            crudoperations("UPDATE", txtJobNature.Text, JobNature_ID);

        }
        protected void crudoperations(string status, string jobNatureName, int JobNature_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_JobNature_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobNature_Name", jobNatureName.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobNature_Name", jobNatureName.ToUpper());
                        cmd.Parameters.AddWithValue("@JobNature_ID", JobNature_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@JobNature_ID", JobNature_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = jobNatureName + " details " + status.ToLower() + "d successfully";
                    gvJobNature.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = jobNatureName + ", Already Exist";
            }
        }
    }
}