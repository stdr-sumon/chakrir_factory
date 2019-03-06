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
    public partial class add_eduLevel : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_EducationLevel_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvEduLevel.DataSource = ds;
                    gvEduLevel.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvEduLevel.DataSource = ds;
                    gvEduLevel.DataBind();
                    int columncount = gvEduLevel.Rows[0].Cells.Count;
                    gvEduLevel.Rows[0].Cells.Clear();
                    gvEduLevel.Rows[0].Cells.Add(new TableCell());
                    gvEduLevel.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvEduLevel.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvEduLevel_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtEduLevel = (TextBox)gvEduLevel.FooterRow.FindControl("txtEduLevelNameAdd");
                if (txtEduLevel.Text != "")
                {
                    crudoperations("INSERT", txtEduLevel.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "EduLevel Name Not Given!";
                }
            }
        }
        protected void gvEduLevel_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEduLevel.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvEduLevel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEduLevel.EditIndex = -1;
            BindGridView();

        }
        protected void gvEduLevel_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEduLevel.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvEduLevel_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int EduLevelID = Convert.ToInt32(gvEduLevel.DataKeys[e.RowIndex].Values["EduLevel_ID"].ToString());
            crudoperations("DELETE", "", EduLevelID);

        }
        protected void gvEduLevel_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int EduLevel_ID = Convert.ToInt32(gvEduLevel.DataKeys[e.RowIndex].Values["EduLevel_ID"].ToString());
            TextBox txtEduLevel = (TextBox)gvEduLevel.Rows[e.RowIndex].FindControl("txtEduLevelName");
            crudoperations("UPDATE", txtEduLevel.Text, EduLevel_ID);

        }
        protected void crudoperations(string status, string EduLevel_Name, int EduLevel_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_EducationLevel_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@EduLevel_Name", EduLevel_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@EduLevel_Name", EduLevel_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@EduLevel_ID", EduLevel_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@EduLevel_ID", EduLevel_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = EduLevel_Name + " details " + status.ToLower() + "d successfully";
                    gvEduLevel.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = EduLevel_Name + ", Already Exist";
            }
        }
    }
}