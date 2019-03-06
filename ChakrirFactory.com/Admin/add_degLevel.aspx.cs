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
    public partial class add_degLevel : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_DegreeLevel_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvDegLevel.DataSource = ds;
                    gvDegLevel.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvDegLevel.DataSource = ds;
                    gvDegLevel.DataBind();
                    int columncount = gvDegLevel.Rows[0].Cells.Count;
                    gvDegLevel.Rows[0].Cells.Clear();
                    gvDegLevel.Rows[0].Cells.Add(new TableCell());
                    gvDegLevel.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvDegLevel.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }


        protected void gvDegLevel_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlConIns = (DropDownList)e.Row.FindControl("ddlEduLevel");
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_EducationLevel_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@status", "SELECT");
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(ds);
                    ddlConIns.DataSource = ds.Tables[0];
                    ddlConIns.DataTextField = "EduLevel_Name";
                    ddlConIns.DataValueField = "EduLevel_ID";
                    ddlConIns.DataBind();
                    ddlConIns.Items.Insert(0, new ListItem("Select EduLevel", "0"));
                    con.Close();
                }
            }
        }
        protected void gvDegLevel_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            TextBox txtDegLevel = (TextBox)gvDegLevel.FooterRow.FindControl("txtDegLevelNameAdd");
            DropDownList ddlEdu = (DropDownList)gvDegLevel.FooterRow.FindControl("ddlEduLevel");
            int EduLevel_ID = Int32.Parse(ddlEdu.SelectedItem.Value);
            if (e.CommandName.Equals("AddNew"))
            {
                if (txtDegLevel.Text != "" || EduLevel_ID == 0)
                {
                    crudoperations("INSERT", 0, txtDegLevel.Text, EduLevel_ID);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "DegLevel Name Not Given!";
                }
            }
        }
        protected void gvDegLevel_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDegLevel.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvDegLevel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDegLevel.EditIndex = -1;
            BindGridView();
        }
        protected void gvDegLevel_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDegLevel.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvDegLevel_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int DegLevelID = Convert.ToInt32(gvDegLevel.DataKeys[e.RowIndex].Values["DegLevel_ID"].ToString());
            crudoperations("DELETE", DegLevelID, "", 0);
        }
        protected void gvDegLevel_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int DegLevel_ID = Convert.ToInt32(gvDegLevel.DataKeys[e.RowIndex].Values["DegLevel_ID"].ToString());
                DropDownList ddl = (DropDownList)gvDegLevel.Rows[e.RowIndex].FindControl("ddlEduLevelEdit");
                int EduLevel_ID = Int32.Parse(ddl.SelectedItem.Value);
                TextBox txtDegLevel = (TextBox)gvDegLevel.Rows[e.RowIndex].FindControl("txtDegLevelNameAdd");
                crudoperations("UPDATE", DegLevel_ID, txtDegLevel.Text, EduLevel_ID);
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = "Failed to update";
            }
        }
        protected void crudoperations(string status, int DegLevel_ID, string DegLevel_Name, int EduLevel_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_DegreeLevel_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@DegLevel_ID", DegLevel_ID);
                        cmd.Parameters.AddWithValue("@DegLevel_Name", DegLevel_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@EduLevel_ID", EduLevel_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@DegLevel_ID", DegLevel_ID);
                        cmd.Parameters.AddWithValue("@EduLevel_ID", EduLevel_ID);
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@DegLevel_Name", DegLevel_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@EduLevel_ID", EduLevel_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = DegLevel_Name + " details " + status.ToLower() + "d successfully";
                    gvDegLevel.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = DegLevel_Name + ", Already Exist or Not Given EduLevel or DegLevel Name! ";
            }
        }
    }
}