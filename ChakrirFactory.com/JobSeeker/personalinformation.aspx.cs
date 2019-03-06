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
    public partial class personalinformation : System.Web.UI.Page
    {
        DataTable objGenderDataTable = new DataTable();
        DataTable objReligionDataTable = new DataTable();
        DataTable objMaritalStatusDataTable = new DataTable();
        DataTable objCurrentCityDataTable = new DataTable();
        DataTable objPersonalInfoDataTable = new DataTable();
        
        private Business_JobSeeker_PersonalInfo objBusinessJobSeekerPersonalInfo = new Business_JobSeeker_PersonalInfo();
        private Entity_JobSeeker_PersonalInfo objEntityJobSeekerPersonalInfo = new Entity_JobSeeker_PersonalInfo();

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

            objGenderDataTable = objBusinessJobSeekerPersonalInfo.BusinessFillGenderDropDown();

            foreach (DataRow row in objGenderDataTable.Rows)
            {
                ddlGender.Items.Add(new ListItem(row["Gender_Name"].ToString(), row["Gender_ID"].ToString()));
            }

            objReligionDataTable = objBusinessJobSeekerPersonalInfo.BusinessFillReligionDropDown();

            foreach (DataRow row in objReligionDataTable.Rows)
            {
                ddlReligion.Items.Add(new ListItem(row["Religion_Name"].ToString(), row["Religion_ID"].ToString()));
            }

            objMaritalStatusDataTable = objBusinessJobSeekerPersonalInfo.BusinessFillMaritalStatusDropDown();

            foreach (DataRow row in objMaritalStatusDataTable.Rows)
            {
                ddlMaritalStatus.Items.Add(new ListItem(row["MaritalStatus_Name"].ToString(), row["MaritalStatus_ID"].ToString()));
            }

            objCurrentCityDataTable = objBusinessJobSeekerPersonalInfo.BusinessFillCurrentCityDropDown();

            foreach (DataRow row in objCurrentCityDataTable.Rows)
            {
                ddlCurentCity.Items.Add(new ListItem(row["City_Name"].ToString(), row["City_ID"].ToString()));
            }

            objPersonalInfoDataTable = objBusinessJobSeekerPersonalInfo.BusinessFillPersonalInformation(Js_ID);

            foreach (DataRow row in objPersonalInfoDataTable.Rows)
            {
                if (!String.IsNullOrEmpty(row["Js_FatherName"].ToString()))
                {
                    txtFatherName.Text = row["Js_FatherName"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_MotherName"].ToString()))
                {
                    txtMotherName.Text = row["Js_MotherName"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_DOB"].ToString()))
                {
                    txtDob.Text = row["Js_DOB"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_NID"].ToString()))
                {
                    txtNidNumber.Text = row["Js_NID"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_PresentAddress"].ToString()))
                {
                    txtPresentAddress.Text = row["Js_PresentAddress"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_PermanentAddress"].ToString()))
                {
                    txtPermanentAddress.Text = row["Js_PermanentAddress"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_PhoneNumber_1"].ToString()))
                {
                    txtPhoneNum_1.Text = row["Js_PhoneNumber_1"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_PhoneNumber_2"].ToString()))
                {
                    txtPhoneNum_2.Text = row["Js_PhoneNumber_2"].ToString();
                }

                if (!String.IsNullOrEmpty(row["Js_Gender"].ToString()))
                {
                    ddlGender.Items.FindByValue(row["Js_Gender"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_Religion"].ToString()))
                {
                    ddlReligion.Items.FindByValue(row["Js_Religion"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_MaritalStatus"].ToString()))
                {
                    ddlMaritalStatus.Items.FindByValue(row["Js_MaritalStatus"].ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(row["Js_CurrentLocation"].ToString()))
                {
                    ddlCurentCity.Items.FindByValue(row["Js_CurrentLocation"].ToString()).Selected = true;
                }
            }
            
        }

        protected void btn_PersonalInfoSave_Click(object sender, EventArgs e)
        {
            string error_msg = "";
            int Js_ID = Convert.ToInt32(Session["Js_ID"]);

            objEntityJobSeekerPersonalInfo.id = Js_ID;
            objEntityJobSeekerPersonalInfo.fathername = txtFatherName.Text;
            objEntityJobSeekerPersonalInfo.mothername = txtMotherName.Text;
            objEntityJobSeekerPersonalInfo.dob = txtDob.Text;
            objEntityJobSeekerPersonalInfo.gender = Convert.ToInt16(ddlGender.SelectedValue);
            objEntityJobSeekerPersonalInfo.religion = Convert.ToInt16(ddlReligion.SelectedValue);
            objEntityJobSeekerPersonalInfo.maritalstatus = Convert.ToInt16(ddlMaritalStatus.SelectedValue);
            objEntityJobSeekerPersonalInfo.nid = Convert.ToInt64(txtNidNumber.Text);
            objEntityJobSeekerPersonalInfo.presentaddress = txtPresentAddress.Text;
            objEntityJobSeekerPersonalInfo.permanentaddress = txtPermanentAddress.Text;
            objEntityJobSeekerPersonalInfo.currentLocation = Convert.ToInt16(ddlCurentCity.SelectedValue);
            objEntityJobSeekerPersonalInfo.phnum_1 = Convert.ToInt32(txtPhoneNum_1.Text);
            objEntityJobSeekerPersonalInfo.phnum_2 = Convert.ToInt32(txtPhoneNum_2.Text);

            error_msg = objBusinessJobSeekerPersonalInfo.BusinessRegisterPersonalInformation(objEntityJobSeekerPersonalInfo);

            lblJobSeekerPersonalInfoErrorMsg.Visible = true;
            lblJobSeekerPersonalInfoErrorMsg.ForeColor = System.Drawing.Color.Green;
            lblJobSeekerPersonalInfoErrorMsg.Text = error_msg;
        }
    }
}