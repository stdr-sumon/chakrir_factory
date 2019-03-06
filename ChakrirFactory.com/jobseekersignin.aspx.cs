using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LICT.DotNet.ChakrirFactory.com.BusinessLayer;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;

namespace ChakrirFactory.com
{
    public partial class JobSeekerSignIn : System.Web.UI.Page
    {
        private Business_All_SignIn objBusinessAllSignIn = new Business_All_SignIn();
        private Entity_All_Signin objEntityAllSignIn = new Entity_All_Signin();
        DataTable objJobSeekerSignInDataTable = new DataTable();

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

        protected void btn_JobSeeker_LogIn_Click(object sender, EventArgs e)
        {
            if (txtJobSeekeUsername.Text != null && txtJobSeekePassword.Text != null)
            {
                objEntityAllSignIn.username = txtJobSeekeUsername.Text;
                objEntityAllSignIn.userpassword = txtJobSeekePassword.Text;

                objJobSeekerSignInDataTable = objBusinessAllSignIn.businessJobSeekerSignIn(objEntityAllSignIn);

                if (objJobSeekerSignInDataTable.Rows.Count > 0)
                {
                    if (chkBox_JobSeeker.Checked == true)
                    {
                        HttpCookie _jobSeekerCookie = new HttpCookie("JobSeekerBasicInfo");
                        foreach (DataRow row in objJobSeekerSignInDataTable.Rows)
                        {
                            _jobSeekerCookie.Values.Add("Js_ID", row["Js_ID"].ToString());
                            _jobSeekerCookie.Values.Add("Js_UserName", row["Js_UserName"].ToString());
                            _jobSeekerCookie.Values.Add("Js_Name", row["Js_FirstName"].ToString() +" "+ row["Js_LastName"].ToString());
                            Response.Cookies.Add(_jobSeekerCookie);
                        }
                        DateTime dtNow = DateTime.Now;
                        TimeSpan tsMinute = new TimeSpan(0, 0, 3600 * 60, 0);
                        _jobSeekerCookie.Expires = dtNow + tsMinute;
                    }
                    foreach (DataRow row in objJobSeekerSignInDataTable.Rows)
                    {
                        Session["Js_ID"] = row["Js_ID"].ToString();
                        Session["Js_UserName"] = row["Js_UserName"].ToString();
                        Session["Js_Name"] = row["Js_FirstName"].ToString() + " "+ row["Js_LastName"].ToString();
                    }
                    Response.Redirect("~/JobSeeker/index.aspx");
                }
                else
                {
                    Response.Redirect("jobseekersignin.aspx");
                }
            }
        }
    }
}