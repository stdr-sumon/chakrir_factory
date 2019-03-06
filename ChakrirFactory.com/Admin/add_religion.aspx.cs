﻿using System;
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
    public partial class add_religion : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_Religion_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvReligionType.DataSource = ds;
                    gvReligionType.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvReligionType.DataSource = ds;
                    gvReligionType.DataBind();
                    int columncount = gvReligionType.Rows[0].Cells.Count;
                    gvReligionType.Rows[0].Cells.Clear();
                    gvReligionType.Rows[0].Cells.Add(new TableCell());
                    gvReligionType.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvReligionType.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvReligionType_RowInsert(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtReligionType = (TextBox)gvReligionType.FooterRow.FindControl("txtReligionNameAdd");
                if (txtReligionType.Text != "")
                {
                    crudoperations("UPDARE ", txtReligionType.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Religion Name Not Given!";
                }
            }
        }
        protected void gvReligionType_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvReligionType.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvReligionType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvReligionType.EditIndex = -1;
            BindGridView();

        }
        protected void gvReligionType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int religionID = Convert.ToInt32(gvReligionType.DataKeys[e.RowIndex].Values["Religion_ID"].ToString());
            crudoperations("DELETE", "", religionID);

        }
        protected void gvReligionType_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Religion_ID = Convert.ToInt32(gvReligionType.DataKeys[e.RowIndex].Values["Religion_ID"].ToString());
            TextBox txtRel = (TextBox)gvReligionType.Rows[e.RowIndex].FindControl("txtReligionName");
            crudoperations("UPDATE", txtRel.Text, Religion_ID);

        }
        protected void crudoperations(string status, string Religion_Name, int Religion_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_Religion_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Religion_Name", Religion_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Religion_Name", Religion_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@Religion_ID", Religion_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Religion_ID", Religion_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = Religion_Name + " details " + status.ToLower() + "d successfully";
                    gvReligionType.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = Religion_Name + ", Already Exist";
            }
        }

        protected void gvReligionType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReligionType.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        }
}