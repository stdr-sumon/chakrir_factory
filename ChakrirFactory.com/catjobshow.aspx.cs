using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace ChakrirFactory.com
{
    public partial class catjobshow : System.Web.UI.Page
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;
        SqlDataAdapter objAdapter = null;
        StringBuilder html = new StringBuilder();
        private DataTable objTable = new DataTable();
        string Cat_Name;

        protected void Page_Load(object sender, EventArgs e)
        {
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
            }

            if (Request.Cookies["SystemBasicInfo"] != null)
            {
                HttpCookie _cmpCookie = Request.Cookies["SystemBasicInfo"];

                Session["System_ID"] = _cmpCookie["System_ID"].ToString();
                Session["System_UserName"] = _cmpCookie["System_UserName"].ToString();
            }

            Cat_Name = Request.QueryString["jobCat_Name"].ToString();

            getAllJobInfo();

            if (!IsPostBack)
            {
                html.Append("<table id='jobs'>");
                html.Append("<th>");
                html.Append("Available Jobs ");
                html.Append("</th>");
                foreach (DataRow row in objTable.Rows)
                {
                    html.Append("<tr>");
                    html.Append("<td>");
                    html.Append("Application End Date: " + row["Job_Deadline"].ToString());
                    html.Append("</br>");
                    html.Append("Job Ttile: " + row["Job_Title"].ToString());
                    html.Append("</br>");
                    html.Append("Company Name: " + row["Cmp_Name"].ToString());
                    html.Append("</br>");
                    html.Append("Job Location: " + row["City_Name"].ToString());
                    html.Append("</br>");
                    html.Append("Salary Range: " + row["Job_SalRange"].ToString());
                    html.Append("</br>");
                    html.Append("Salary Range: " + row["JobNature_Name"].ToString());
                    html.Append("</br>");
                    html.Append("Job Category: " + row["JobCategory_Name"].ToString());
                    html.Append("</br>");
                    html.Append("<a href='singlejobshow.aspx?job_id=" + row["Job_ID"] + "' runat=\"server\">");
                    html.Append("See more");
                    html.Append("</a>");
                    html.Append("</td>");
                    html.Append("</tr>");
                }
                html.Append("</table>");

                placeholder.Controls.Add(new Literal { Text = html.ToString() });
            }
        }

        private void getAllJobInfo()
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_CatJobInfo", objConnection);
            objCommand.Parameters.AddWithValue("@Cat_Name", Cat_Name);
            objCommand.CommandType = CommandType.StoredProcedure;

            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);
        }
    }
}