using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using LICT.DotNet.ChakrirFactory.com.BusinessLayer;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;

namespace ChakrirFactory.com.JobSeeker
{
    public partial class carrerinformation : System.Web.UI.Page
    {
        DataTable objJobLevelDataTable = new DataTable();
        DataTable objJobNatureDataTable = new DataTable();
        DataTable objCarrerInfoDataTable = new DataTable();

        private Entity_JobSeeker_CarrerInfo objEntityJobSeekerCarrerInfo = new Entity_JobSeeker_CarrerInfo();
        private Business_JobSeeker_CarreInfo objBusinessJobSeekerCarrerInfo = new Business_JobSeeker_CarreInfo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAll();
            }

            if (Request.Cookies["JobSeekerBasicInfo"] != null)
            {
                HttpCookie _JsCookie = Request.Cookies["JobSeekerBasicInfo"];

                Session["Js_ID"] = _JsCookie["Js_ID"].ToString();
                Session["Js_UserName"] = _JsCookie["Js_UserName"].ToString();
                Session["Js_Name"] = _JsCookie["Js_Name"].ToString();
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

                Response.Redirect("/Admin/index.aspx");
            }

            if (Session["Js_ID"] == null)
            {
                Response.Redirect("/index.aspx");
            }
        }

        private void fillAll()
        {
            int Js_ID = Convert.ToInt32(Session["Js_ID"]);

            objJobLevelDataTable = objBusinessJobSeekerCarrerInfo.BusinessFillJobLevelDropDown();

            foreach (DataRow row in objJobLevelDataTable.Rows)
            {
                ddlJobLevel.Items.Add(new ListItem(row["JobLevel_Name"].ToString(), row["JobLevel_ID"].ToString()));
            }

            objJobNatureDataTable = objBusinessJobSeekerCarrerInfo.BusinessFillJobNatureDropDown();

            foreach (DataRow row in objJobNatureDataTable.Rows)
            {
                ddlJobNature.Items.Add(new ListItem(row["JobNature_Name"].ToString(), row["JobNature_ID"].ToString()));
            }

            objCarrerInfoDataTable = objBusinessJobSeekerCarrerInfo.BusinessFillCarrerInformation(Js_ID);

            foreach (DataRow row in objCarrerInfoDataTable.Rows)
            {
                if (!String.IsNullOrEmpty(row["Js_Objective"].ToString()))
                {
                    txtCarrerObjective.Text = row["Js_Objective"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_Expatsal"].ToString()))
                {
                    txtExpSal.Text = row["Js_Expatsal"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_JobLevel"].ToString()))
                {
                    ddlJobLevel.Items.FindByValue(row["Js_JobLevel"].ToString()).Selected = true;
                }

                if (!String.IsNullOrEmpty(row["Js_JobNature"].ToString()))
                {
                    ddlJobNature.Items.FindByValue(row["Js_JobNature"].ToString()).Selected = true;
                }
            }
        }

        protected void btn_CarrerInfoSave_Click(object sender, EventArgs e)
        {
            string error_msg = "";
            int Js_ID = Convert.ToInt32(Session["Js_ID"]);

            objEntityJobSeekerCarrerInfo.id = Js_ID;
            objEntityJobSeekerCarrerInfo.objective = txtCarrerObjective.Text;
            objEntityJobSeekerCarrerInfo.expsal = Convert.ToInt32(txtExpSal.Text);
            objEntityJobSeekerCarrerInfo.joblevel = Convert.ToInt16(ddlJobLevel.SelectedValue);
            objEntityJobSeekerCarrerInfo.jobnature = Convert.ToInt16(ddlJobNature.SelectedValue);

            error_msg = objBusinessJobSeekerCarrerInfo.BusinessRegisterPersonalInformation(objEntityJobSeekerCarrerInfo);

            lblJobSeekerCarrerInfoErrorMsg.Visible = true;
            lblJobSeekerCarrerInfoErrorMsg.ForeColor = System.Drawing.Color.Green;
            lblJobSeekerCarrerInfoErrorMsg.Text = error_msg;
        }
    }
}