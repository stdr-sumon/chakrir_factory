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
using System.Globalization;

namespace ChakrirFactory.com.Company
{
    public partial class postjob : System.Web.UI.Page
    {
        DataTable objCurrentCityDataTable = new DataTable();
        DataTable objJobCategoryDataTable = new DataTable();
        DataTable objJobCNatureDataTable = new DataTable();

        private Business_Company_PostJob objBusinessCompanyPostJob = new Business_Company_PostJob();
        private Entity_Company_JobPost objEntityCompanyJobPost = new Entity_Company_JobPost();

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

                Response.Redirect("/JobSeeker/index.aspx");
            }

            if (Request.Cookies["CompanyBasicInfo"] != null)
            {
                HttpCookie _cmpCookie = Request.Cookies["CompanyBasicInfo"];

                Session["Cmp_ID"] = _cmpCookie["Cmp_ID"].ToString();
                Session["Cmp_UserName"] = _cmpCookie["Cmp_UserName"].ToString();
            }

            if (Request.Cookies["SystemBasicInfo"] != null)
            {
                HttpCookie _cmpCookie = Request.Cookies["SystemBasicInfo"];

                Session["System_ID"] = _cmpCookie["System_ID"].ToString();
                Session["System_UserName"] = _cmpCookie["System_UserName"].ToString();

                Response.Redirect("/Admin/index.aspx");
            }

            if (Session["Cmp_ID"] == null)
            {
                Response.Redirect("/index.aspx");
            }
        }

        private void fillAll()
        {
            int Js_ID = Convert.ToInt32(Session["Js_ID"]);

            objCurrentCityDataTable = objBusinessCompanyPostJob.BusinessFillCurrentCityDropDown();

            foreach (DataRow row in objCurrentCityDataTable.Rows)
            {
                ddlJobLocation.Items.Add(new ListItem(row["City_Name"].ToString(), row["City_ID"].ToString()));
            }

            objJobCategoryDataTable = objBusinessCompanyPostJob.BusinessFillJobCategoryDropDown();

            foreach (DataRow row in objJobCategoryDataTable.Rows)
            {
                ddlJobCategory.Items.Add(new ListItem(row["JobCategory_Name"].ToString(), row["JobCategory_ID"].ToString()));
            }

            objJobCNatureDataTable = objBusinessCompanyPostJob.BusinessFillJobNatureDropDown();

            foreach (DataRow row in objJobCNatureDataTable.Rows)
            {
                ddlJobNature.Items.Add(new ListItem(row["JobNature_Name"].ToString(), row["JobNature_ID"].ToString()));
            }
        }

        protected void btn_JobPost_Click(object sender, EventArgs e)
        {
            string error_msg = "";
            int Cmp_ID = Convert.ToInt32(Session["Cmp_ID"]);

            objEntityCompanyJobPost.id = Cmp_ID;
            objEntityCompanyJobPost.title = txtJobTitle.Text;
            objEntityCompanyJobPost.category = Convert.ToInt16(ddlJobCategory.SelectedValue);
            objEntityCompanyJobPost.vacancyno = Convert.ToInt16(txtJobVacancyNo.Text);
            objEntityCompanyJobPost.gender = ddlGender.SelectedItem.Text;
            objEntityCompanyJobPost.nature = Convert.ToInt16(ddlJobNature.SelectedValue);
            objEntityCompanyJobPost.location = Convert.ToInt16(ddlJobLocation.SelectedValue);
            objEntityCompanyJobPost.salrange = txtSalRange.Text;
            objEntityCompanyJobPost.description = txtJobDescription.Text;
            objEntityCompanyJobPost.expreq = txtJobExpReq.Text;
            objEntityCompanyJobPost.edureq = txtJobEduReq.Text;
            objEntityCompanyJobPost.jobreq = txtJobExpReq.Text;
            objEntityCompanyJobPost.otherbenefit = txtOtherBenifit.Text;
            DateTime date = DateTime.Parse(txtPostDeadDate.Text);
            objEntityCompanyJobPost.deadline = date;
            error_msg = objBusinessCompanyPostJob.businessRegisterJobSeeker(objEntityCompanyJobPost);

            lblJobPostErrorMsg.Visible = true;
            lblJobPostErrorMsg.ForeColor = System.Drawing.Color.Green;
            lblJobPostErrorMsg.Text = error_msg;

        }
    }
}