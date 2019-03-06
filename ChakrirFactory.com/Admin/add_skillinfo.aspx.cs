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
    public partial class add_skillinfo : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SP_SkillInfo_SYS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", "SELECT");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvSkill.DataSource = ds;
                    gvSkill.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvSkill.DataSource = ds;
                    gvSkill.DataBind();
                    int columncount = gvSkill.Rows[0].Cells.Count;
                    gvSkill.Rows[0].Cells.Clear();
                    gvSkill.Rows[0].Cells.Add(new TableCell());
                    gvSkill.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvSkill.Rows[0].Cells[0].Text = "No Records Found";
                }

            }
        }
        protected void gvSkill_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtSkill = (TextBox)gvSkill.FooterRow.FindControl("txtSkillNameAdd");
                if (txtSkill.Text != "")
                {
                    crudoperations("INSERT", txtSkill.Text, 0);
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Skill Name Not Given!";
                }
            }
        }
        protected void gvSkill_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSkill.EditIndex = e.NewEditIndex;
            BindGridView();
        }
        protected void gvSkill_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSkill.EditIndex = -1;
            BindGridView();

        }
        protected void gvSkill_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSkill.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void gvSkill_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int SkillID = Convert.ToInt32(gvSkill.DataKeys[e.RowIndex].Values["Skill_ID"].ToString());
            crudoperations("DELETE", "", SkillID);

        }
        protected void gvSkill_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Skill_ID = Convert.ToInt32(gvSkill.DataKeys[e.RowIndex].Values["Skill_ID"].ToString());
            TextBox txtSkill = (TextBox)gvSkill.Rows[e.RowIndex].FindControl("txtSkillName");
            crudoperations("UPDATE", txtSkill.Text, Skill_ID);

        }
        protected void crudoperations(string status, string Skill_Name, int Skill_ID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_SkillInfo_SYS", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (status == "INSERT")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Skill_Name", Skill_Name.ToUpper());
                    }
                    else if (status == "UPDATE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Skill_Name", Skill_Name.ToUpper());
                        cmd.Parameters.AddWithValue("@Skill_ID", Skill_ID);
                    }
                    else if (status == "DELETE")
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@Skill_ID", Skill_ID);
                    }
                    cmd.ExecuteNonQuery();
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = Skill_Name + " details " + status.ToLower() + "d successfully";
                    gvSkill.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = Skill_Name + ", Already Exist";
            }
        }
    }
}