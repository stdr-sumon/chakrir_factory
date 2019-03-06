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
    public partial class AddCountry : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_CountryName_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if(ds.Tables[0].Rows.Count > 0)
                {
                    gvCountry.DataSource = ds;
                    gvCountry.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvCountry.DataSource = ds;
                    gvCountry.DataBind();
                    int columncount = gvCountry.Rows[0].Cells.Count;
                    gvCountry.Rows[0].Cells.Clear();
                    gvCountry.Rows[0].Cells.Add(new TableCell());
                    gvCountry.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvCountry.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvCountry_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew")) {
                TextBox txtCountry = (TextBox)gvCountry.FooterRow.FindControl("txtCountryNameAdd");
                if (txtCountry.Text != "")
                {
                    crudoperations("INSERT", txtCountry.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Country Name Not Given!";
                }
            }
        }
        protected void gvCountry_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCountry.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvCountry_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCountry.EditIndex = -1;
            BindGridView();

        }
        protected void gvCountry_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCountry.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvCountry_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int countryID = Convert.ToInt32(gvCountry.DataKeys[e.RowIndex].Values["Country_ID"].ToString());
            crudoperations("DELETE", "", countryID);

        }
        protected void gvCountry_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Country_ID = Convert.ToInt32(gvCountry.DataKeys[e.RowIndex].Values["Country_ID"].ToString());
            TextBox txtCountry = (TextBox)gvCountry.Rows[e.RowIndex].FindControl("txtCountryName");
            crudoperations("UPDATE", txtCountry.Text, Country_ID);

        }
        protected void crudoperations(string status, string Country_Name, int Country_ID)
        {
            try {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_CountryName_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Country_Name", Country_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Country_Name", Country_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@Country_ID", Country_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Country_ID", Country_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = Country_Name + " details " + status.ToLower() + "d successfully";
                    gvCountry.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = Country_Name +  ", Already Exist";
            }
        }
    }
}