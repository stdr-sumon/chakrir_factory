using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LICT.DotNet.ChakrirFactory.com.BusinessLayer;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;

namespace ChakrirFactory.com.Admin
{
    public partial class login : System.Web.UI.Page
    {
        private Business_All_SignIn objBusinessAllSignIn = new Business_All_SignIn();
        private Entity_All_Signin objEntityAllSignIn = new Entity_All_Signin();
        DataTable objAdminSignInDataTable = new DataTable();

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

        protected void btn_Admin_LogIn_Click(object sender, EventArgs e)
        {
            if (txtAdminUser.Text != null && txtAdminPassword.Text != null)
            {
                objEntityAllSignIn.username = txtAdminUser.Text;
                objEntityAllSignIn.userpassword = txtAdminPassword.Text;

                objAdminSignInDataTable = objBusinessAllSignIn.businessAdminSignIn(objEntityAllSignIn);

                if (objAdminSignInDataTable.Rows.Count > 0)
                {
                    if (chkBox_Admin.Checked == true)
                    {
                        HttpCookie _systemCookie = new HttpCookie("SystemBasicInfo");
                        foreach (DataRow row in objAdminSignInDataTable.Rows)
                        {
                            _systemCookie.Values.Add("System_ID", row["System_ID"].ToString());
                            _systemCookie.Values.Add("System_UserName", row["System_UserName"].ToString());
                            Response.Cookies.Add(_systemCookie);
                        }
                        DateTime dtNow = DateTime.Now;
                        TimeSpan tsMinute = new TimeSpan(0, 0, 3600 * 60, 0);
                        _systemCookie.Expires = dtNow + tsMinute;
                    }
                    foreach (DataRow row in objAdminSignInDataTable.Rows)
                    {
                        Session["System_ID"] = row["System_ID"].ToString();
                        Session["System_UserName"] = row["System_UserName"].ToString();
                    }
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Redirect("/Admin/login.aspx");
                }
            }
        }
    }
}