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
    public partial class add_languageProficiency : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_LanguageProficiency_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvLangProf.DataSource = ds;
                    gvLangProf.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvLangProf.DataSource = ds;
                    gvLangProf.DataBind();
                    int columncount = gvLangProf.Rows[0].Cells.Count;
                    gvLangProf.Rows[0].Cells.Clear();
                    gvLangProf.Rows[0].Cells.Add(new TableCell());
                    gvLangProf.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvLangProf.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvLangProf_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtLangProf = (TextBox)gvLangProf.FooterRow.FindControl("txtLangProfNameAdd");
                if (txtLangProf.Text != "")
                {
                    crudoperations("INSERT", txtLangProf.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "LangProf Name Not Given!";
                }
            }
        }
        protected void gvLangProf_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLangProf.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvLangProf_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLangProf.EditIndex = -1;
            BindGridView();

        }
        protected void gvLangProf_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLangProf.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvLangProf_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int LangProfID = Convert.ToInt32(gvLangProf.DataKeys[e.RowIndex].Values["LangProf_ID"].ToString());
            crudoperations("DELETE", "", LangProfID);

        }
        protected void gvLangProf_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int LangProf_ID = Convert.ToInt32(gvLangProf.DataKeys[e.RowIndex].Values["LangProf_ID"].ToString());
            TextBox txtLangProf = (TextBox)gvLangProf.Rows[e.RowIndex].FindControl("txtLangProfName");
            crudoperations("UPDATE", txtLangProf.Text, LangProf_ID);

        }
        protected void crudoperations(string status, string LangProf_Name, int LangProf_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_LanguageProficiency_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@LangProf_Name", LangProf_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@LangProf_Name", LangProf_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@LangProf_ID", LangProf_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@LangProf_ID", LangProf_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = LangProf_Name + " details " + status.ToLower() + "d successfully";
                    gvLangProf.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = LangProf_Name + ", Already Exist";
            }
        }
    }
}