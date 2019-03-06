using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using LICT.DotNet.ChakrirFactory.com.BusinessLayer;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;

namespace ChakrirFactory.com
{
    public partial class companysignup : System.Web.UI.Page
    {
        private Entity_Company_SignUp objEntityCompanySignUp = new Entity_Company_SignUp();
        private Business_Company_SignUp objBusinessCompanySignUp = new Business_Company_SignUp();
        DataTable objCurrentCityDataTable = new DataTable();

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
        }
        private void fillAll()
        {
            int Js_ID = Convert.ToInt32(Session["Js_ID"]);

            objCurrentCityDataTable = objBusinessCompanySignUp.BusinessFillCurrentCityDropDown();

            foreach (DataRow row in objCurrentCityDataTable.Rows)
            {
                ddlCompanyCity.Items.Add(new ListItem(row["City_Name"].ToString(), row["City_ID"].ToString()));
            }
        }
        protected void btn_CompanyRegistration_Click(object sender, EventArgs e)
        {
            string error_msg = "";

            objEntityCompanySignUp.username = txtCompanyUserName.Text;
            objEntityCompanySignUp.password = txtCompanyPassword.Text;
            objEntityCompanySignUp.name = txtCompanyName.Text;
            objEntityCompanySignUp.description = txtCompanyDescription.Text;
            objEntityCompanySignUp.address = txtCompanyAddress.Text;
            objEntityCompanySignUp.city = Convert.ToInt16(ddlCompanyCity.Text);
            objEntityCompanySignUp.cmpphnum = Convert.ToInt32(txtCompanyPhoneNum.Text);
            objEntityCompanySignUp.personname = txtCompanyName.Text;
            objEntityCompanySignUp.persondesg = txtCompanyPersionDesignation.Text;
            objEntityCompanySignUp.perphnum = Convert.ToInt32(txtContactPersonPhone.Text);

            error_msg = objBusinessCompanySignUp.businessRegisterCompany(objEntityCompanySignUp);

            if (String.IsNullOrWhiteSpace(error_msg.ToString()))
            {
                lblComapanyErrorMsg.Visible = true;
                lblComapanyErrorMsg.ForeColor = System.Drawing.Color.Green;
                lblComapanyErrorMsg.Text = "* " + objEntityCompanySignUp.name + " Registered Successfully";
            }
            else
            {
                lblComapanyErrorMsg.Visible = true;
                lblComapanyErrorMsg.ForeColor = System.Drawing.Color.Red;
                lblComapanyErrorMsg.Text = error_msg.ToString();
            }
            clearFields();
        }

        private void clearFields()
        {
            txtCompanyUserName.Text = "";
            txtCompanyPassword.Text = "";
            txtCompanyName.Text = "";
            txtCompanyDescription.Text = "";
            txtCompanyAddress.Text = "";
            txtCompanyPhoneNum.Text = "";
            txtCompanyName.Text = "";
            txtCompanyPersionDesignation.Text = "";
            txtContactPersonPhone.Text = "";
        }
    }
}