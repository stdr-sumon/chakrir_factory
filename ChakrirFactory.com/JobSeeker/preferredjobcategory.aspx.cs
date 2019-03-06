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
    public partial class preferredjobcategory : System.Web.UI.Page
    {
        DataTable objJobCategoryDataTable = new DataTable();
        DataTable objJobLocationDataTable = new DataTable();
        DataTable obPreferredJobandLocInfoDataTable = new DataTable();

        private Business_JobSeeker_PreferredJobCategory objBusinessJobSeekerPreferredJobCategory = new Business_JobSeeker_PreferredJobCategory();
        Entity_JobSeeker_PreferredJobCategory objEntityJobSeekerPreferredJobCategory = new Entity_JobSeeker_PreferredJobCategory();

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

            objJobCategoryDataTable = objBusinessJobSeekerPreferredJobCategory.BusinessFillJobCategory();

            foreach (DataRow row in objJobCategoryDataTable.Rows)
            {
                ddlJobCategory_1.Items.Add(new ListItem(row["JobCategory_Name"].ToString(), row["JobCategory_ID"].ToString()));
                ddlJobCategory_2.Items.Add(new ListItem(row["JobCategory_Name"].ToString(), row["JobCategory_ID"].ToString()));
                ddlJobCategory_3.Items.Add(new ListItem(row["JobCategory_Name"].ToString(), row["JobCategory_ID"].ToString()));
            }

            objJobLocationDataTable = objBusinessJobSeekerPreferredJobCategory.BusinessFillJobLocation();

            foreach (DataRow row in objJobLocationDataTable.Rows)
            {
                ddlJobLocation_1.Items.Add(new ListItem(row["City_Name"].ToString(), row["City_ID"].ToString()));
                ddlJobLocation_2.Items.Add(new ListItem(row["City_Name"].ToString(), row["City_ID"].ToString()));
                ddlJobLocation_3.Items.Add(new ListItem(row["City_Name"].ToString(), row["City_ID"].ToString()));
            }

            obPreferredJobandLocInfoDataTable = objBusinessJobSeekerPreferredJobCategory.BusinessFillPreferredJobCatandLocInformation(Js_ID);

            foreach (DataRow row in obPreferredJobandLocInfoDataTable.Rows)
            {
                if (!String.IsNullOrEmpty(row["Js_PrefJobCat_1"].ToString()))
                {
                    ddlJobCategory_1.Items.FindByValue(row["Js_PrefJobCat_1"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_PrefJobCat_2"].ToString()))
                {
                    ddlJobCategory_2.Items.FindByValue(row["Js_PrefJobCat_2"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_PrefJobCat_3"].ToString()))
                {
                    ddlJobCategory_3.Items.FindByValue(row["Js_PrefJobCat_3"].ToString()).Selected = true;
                }

                if (!String.IsNullOrEmpty(row["Js_PrefJobLoc_1"].ToString()))
                {
                    ddlJobLocation_1.Items.FindByValue(row["Js_PrefJobLoc_1"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_PrefJobLoc_2"].ToString()))
                {
                    ddlJobLocation_2.Items.FindByValue(row["Js_PrefJobLoc_2"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_PrefJobLoc_3"].ToString()))
                {
                    ddlJobLocation_3.Items.FindByValue(row["Js_PrefJobLoc_3"].ToString()).Selected = true;
                }
            }
        }

        protected void btn_JobCategorySave_Click(object sender, EventArgs e)
        {
            string error_msg = "";
            int Js_ID = Convert.ToInt32(Session["Js_ID"]);

            objEntityJobSeekerPreferredJobCategory.id = Js_ID;
            objEntityJobSeekerPreferredJobCategory.jobcat_1 = Convert.ToInt16(ddlJobCategory_1.SelectedValue);
            objEntityJobSeekerPreferredJobCategory.jobcat_2 = Convert.ToInt16(ddlJobCategory_2.SelectedValue);
            objEntityJobSeekerPreferredJobCategory.jobcat_3 = Convert.ToInt16(ddlJobCategory_3.SelectedValue);

            objEntityJobSeekerPreferredJobCategory.jobLoc_1 = Convert.ToInt16(ddlJobLocation_1.SelectedValue);
            objEntityJobSeekerPreferredJobCategory.jobLoc_2 = Convert.ToInt16(ddlJobLocation_2.SelectedValue);
            objEntityJobSeekerPreferredJobCategory.jobLoc_3 = Convert.ToInt16(ddlJobLocation_3.SelectedValue);

            error_msg = objBusinessJobSeekerPreferredJobCategory.BusinessRegisterPreferredJobCatandLocInformation(objEntityJobSeekerPreferredJobCategory);

            lblJobSeekerPreferredJobCatandLocErrorMsg.Visible = true;
            lblJobSeekerPreferredJobCatandLocErrorMsg.ForeColor = System.Drawing.Color.Green;
            lblJobSeekerPreferredJobCatandLocErrorMsg.Text = error_msg;
        }
    }
}