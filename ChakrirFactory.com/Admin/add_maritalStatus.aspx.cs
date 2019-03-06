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
    public partial class add_maritalStatus : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_MaritalStatus_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvMarital.DataSource = ds;
                    gvMarital.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvMarital.DataSource = ds;
                    gvMarital.DataBind();
                    int columncount = gvMarital.Rows[0].Cells.Count;
                    gvMarital.Rows[0].Cells.Clear();
                    gvMarital.Rows[0].Cells.Add(new TableCell());
                    gvMarital.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvMarital.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvMarital_RowInsert(object sender, GridViewCommandEventArgs e)
        {
            TextBox txtMarital = (TextBox)gvMarital.FooterRow.FindControl("txtMaritalNameAdd");
            if (e.CommandName.Equals("AddNew"))
            {
                if (txtMarital.Text != "")
                {
                    crudoperations("INSERT", txtMarital.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Marital Status Name Not Given!";
                }
            }
        }
        protected void gvMarital_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMarital.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvMarital_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMarital.EditIndex = -1;
            BindGridView();

        }
        protected void gvMarital_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMarital.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvMarital_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int maritalID = Convert.ToInt32(gvMarital.DataKeys[e.RowIndex].Values["MaritalStatus_ID"].ToString());
            crudoperations("DELETE", "", maritalID);

        }
        protected void gvMarital_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int MaritalStatus_ID = Convert.ToInt32(gvMarital.DataKeys[e.RowIndex].Values["MaritalStatus_ID"].ToString());
            TextBox txtMarital = (TextBox)gvMarital.Rows[e.RowIndex].FindControl("txtMaritalName");
            crudoperations("UPDATE", txtMarital.Text, MaritalStatus_ID);

        }
        protected void crudoperations(string status, string MaritalStatus_Name, int MaritalStatus_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_MaritalStatus_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@MaritalStatus_Name", MaritalStatus_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@MaritalStatus_Name", MaritalStatus_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@MaritalStatus_ID", MaritalStatus_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@MaritalStatus_ID", MaritalStatus_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = MaritalStatus_Name + " details " + status.ToLower() + "d successfully";
                    gvMarital.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = MaritalStatus_Name + ", Already Exist";
            }
        }
    }
}