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
    public partial class add_indutryType : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_IndustryType_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvIndustryType.DataSource = ds;
                    gvIndustryType.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvIndustryType.DataSource = ds;
                    gvIndustryType.DataBind();
                    int columncount = gvIndustryType.Rows[0].Cells.Count;
                    gvIndustryType.Rows[0].Cells.Clear();
                    gvIndustryType.Rows[0].Cells.Add(new TableCell());
                    gvIndustryType.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvIndustryType.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvIndustryType_RowInsert(object sender, GridViewCommandEventArgs e)
        {
            TextBox txtInType = (TextBox)gvIndustryType.FooterRow.FindControl("txtIndustryTypeNameAdd");
            if (e.CommandName.Equals("AddNew") && txtInType.Text != "")
            {
                crudoperations("INSERT", txtInType.Text, 0);
            }
            else
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = "Industry Type Not Given!";
            }
        }
        protected void gvIndustryType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvIndustryType.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvIndustryType_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvIndustryType.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvIndustryType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvIndustryType.EditIndex = -1;
            BindGridView();

        }
        protected void gvIndustryType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int countryID = Convert.ToInt32(gvIndustryType.DataKeys[e.RowIndex].Values["IndustryType_ID"].ToString());
            crudoperations("DELETE", "", countryID);

        }
        protected void gvIndustryType_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int IndustryType_ID = Convert.ToInt32(gvIndustryType.DataKeys[e.RowIndex].Values["IndustryType_ID"].ToString());
            TextBox txtIndustryType = (TextBox)gvIndustryType.Rows[e.RowIndex].FindControl("txtIndustryTypeName");
            crudoperations("UPDATE", txtIndustryType.Text, IndustryType_ID);
        }


        protected void crudoperations(string status, string IndustryType_Name, int IndustryType_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_IndustryType_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@IndustryType_Name", IndustryType_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@IndustryType_Name", IndustryType_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@IndustryType_ID", IndustryType_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@IndustryType_ID", IndustryType_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = IndustryType_Name + " details " + status.ToLower() + "d successfully";
                    gvIndustryType.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = IndustryType_Name + ", Already Exist";
            }
        }
    }
}