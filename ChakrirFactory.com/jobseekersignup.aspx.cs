using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LICT.DotNet.ChakrirFactory.com.BusinessLayer;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;

namespace ChakrirFactory.com
{
    public partial class jobseekersignup : System.Web.UI.Page
    {
        private Entitty_JobSeeker_SignUp objEntittyJobSeekerSignUp = new Entitty_JobSeeker_SignUp();
        private Business_JobSeeker_SignUp objBusinessJobSeekerSignUp = new Business_JobSeeker_SignUp();

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

                Response.Redirect("/Admin/index.aspx");
            }
        }

        protected void btn_JobSeekerRegistration_Click(object sender, EventArgs e)
        {
            string error_msg = "";

            objEntittyJobSeekerSignUp.username = txtJobSeekerUserName.Text;
            objEntittyJobSeekerSignUp.userpassword = txtJobSeekerPassword.Text;
            objEntittyJobSeekerSignUp.firstname = txtJobSeekerFirstName.Text;
            objEntittyJobSeekerSignUp.lastname = txtJobSeekerLastName.Text;
            objEntittyJobSeekerSignUp.email = txtJobSeekerEmail.Text;

            error_msg = objBusinessJobSeekerSignUp.businessRegisterJobSeeker(objEntittyJobSeekerSignUp);

            if(String.IsNullOrWhiteSpace(error_msg.ToString()))
            {              
                lblJobSeekerErrorMsg.Visible = true;
                lblJobSeekerErrorMsg.ForeColor = System.Drawing.Color.Green;
                lblJobSeekerErrorMsg.Text = "* " + objEntittyJobSeekerSignUp.firstname + " " + objEntittyJobSeekerSignUp.firstname + " Registered Successfully";
            }
            else
            {
                lblJobSeekerErrorMsg.Visible = true;
                lblJobSeekerErrorMsg.ForeColor = System.Drawing.Color.Red;
                lblJobSeekerErrorMsg.Text = error_msg.ToString();
            }
            clearFields();
        }

        private void clearFields()
        {
            txtJobSeekerUserName.Text = "";
            txtJobSeekerPassword.Text = "";
            txtJobSeekerConfirmPassword.Text = "";
            txtJobSeekerFirstName.Text = "";
            txtJobSeekerLastName.Text = "";
            txtJobSeekerEmail.Text = "";           
        }
    }
}