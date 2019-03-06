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
    public partial class add_city : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_CityName_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvCity.DataSource = ds;
                    gvCity.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvCity.DataSource = ds;
                    gvCity.DataBind();
                    int columncount = gvCity.Rows[0].Cells.Count;
                    gvCity.Rows[0].Cells.Clear();
                    gvCity.Rows[0].Cells.Add(new TableCell());
                    gvCity.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvCity.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }


        protected void gvCity_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlConIns = (DropDownList)e.Row.FindControl("ddlCountry");
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_CountryName_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@status", "SELECT");
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(ds);
                    ddlConIns.DataSource = ds.Tables[0];
                    ddlConIns.DataTextField = "Country_Name";
                    ddlConIns.DataValueField = "Country_ID";
                    ddlConIns.DataBind();
                    ddlConIns.Items.Insert(0, new ListItem("Select Country", "0"));
                    con.Close();
                }
            }
        }
        protected void gvCity_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            TextBox txtCity = (TextBox)gvCity.FooterRow.FindControl("txtCityNameAdd");
            DropDownList ddlCoun = (DropDownList)gvCity.FooterRow.FindControl("ddlCountry");
            int Country_ID = Int32.Parse(ddlCoun.SelectedItem.Value);
            if (e.CommandName.Equals("AddNew"))
            {
                if (txtCity.Text != "" || Country_ID ==0)
                {
                    crudoperations("INSERT", 0, txtCity.Text, Country_ID);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "City Name Not Given!";
                }
            }
        }
        protected void gvCity_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCity.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvCity_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCity.EditIndex = -1;
            BindGridView();
        }
        protected void gvCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCity.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvCity_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cityID = Convert.ToInt32(gvCity.DataKeys[e.RowIndex].Values["City_ID"].ToString());
            crudoperations("DELETE", cityID, "", 0);
        }
        protected void gvCity_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int City_ID = Convert.ToInt32(gvCity.DataKeys[e.RowIndex].Values["City_ID"].ToString());
                DropDownList ddl = (DropDownList)gvCity.Rows[e.RowIndex].FindControl("ddlCountryEdit");
                int Country_ID = Int32.Parse(ddl.SelectedItem.Value);
                TextBox txtCity = (TextBox)gvCity.Rows[e.RowIndex].FindControl("txtCityNameAdd");
                crudoperations("UPDATE", City_ID, txtCity.Text, Country_ID);
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = "Failed to update";
            }
        }
        protected void crudoperations(string status, int City_ID, string City_Name, int Country_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_CityName_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@City_Name", City_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@Country_ID", Country_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@City_ID", City_ID);
                        cmd.Parameters.AddWithValue("@Country_ID", Country_ID);
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@City_Name", City_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@Country_ID", Country_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = City_Name + " details " + status.ToLower() + "d successfully";
                    gvCity.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = City_Name + ", Already Exist or Not Given Country or City Name! ";
            }
        }
    }
}