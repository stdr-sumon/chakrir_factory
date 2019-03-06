using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ChakrirFactory.com
{
    public partial class Index : System.Web.UI.Page
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;
        SqlDataAdapter objAdapter = null;
        StringBuilder html = new StringBuilder();
        private DataTable objTable = new DataTable();

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

            getAllCategory();
            if (!IsPostBack)
            {
                html.Append("<table id='jobs'>");
                html.Append("<th colspan=\"4\">");
                html.Append("Available Categories ");
                html.Append("</th>");

                int rowCount = objTable.Rows.Count;
                string[] arrayRow = new string[rowCount];

                rowCount = 0;
                foreach (DataRow row in objTable.Rows)
                {
                    arrayRow[rowCount] = row["JobCategory_Name"].ToString();
                    rowCount++;
                }

                int j = 0;
                for (int i = 0; i<=arrayRow.Length/4; i++)
                {
                    html.Append("<tr>");
                    if (j == arrayRow.Length)
                    {
                        break;
                    }              
                    html.Append("<td>");                   
                    html.Append("<a href='catjobshow.aspx?jobCat_Name=" + arrayRow[j] + "' runat=\"server\">");
                    html.Append(arrayRow[j]);
                    html.Append("</a>");
                    html.Append("</td>");
                    j++;
                    if (j == arrayRow.Length)
                    {
                        break;
                    }               
                    html.Append("<td>");
                    html.Append("<a href='catjobshow.aspx?jobCat_Name=" + arrayRow[j] + "' runat=\"server\">");
                    html.Append(arrayRow[j]);
                    html.Append("</a>");
                    html.Append("</td>");
                    j++;
                    if (j == arrayRow.Length)
                    {
                        break;
                    }
                    html.Append("<td>");
                    html.Append("<a href='catjobshow.aspx?jobCat_Name=" + arrayRow[j] + "' runat=\"server\">");
                    html.Append(arrayRow[j]);
                    html.Append("</a>");
                    html.Append("</td>");
                    j++;
                    if (j == arrayRow.Length)
                    {
                        break;
                    }      
                    html.Append("<td>");
                    html.Append("<a href='catjobshow.aspx?jobCat_Name=" + arrayRow[j] + "' runat=\"server\">");
                    html.Append(arrayRow[j]);
                    html.Append("</a>");
                    html.Append("</td>");
                    j++;
                    html.Append("</tr>");            
                }

                //html.Append("<tr>");
                //foreach (var item in arrayRow)
                //{                  
                //    html.Append("<td>");
                //    html.Append("<a href='catjobshow.aspx?jobCat_Name=" + row["JobCategory_ID"] + "' runat=\"server\">");
                //    html.Append(row["JobCategory_Name"]);
                //    html.Append("</a>");
                //    html.Append("</td>");              
                //}
                //html.Append("</tr>");
                html.Append("</table>");

                placeholder.Controls.Add(new Literal { Text = html.ToString() });
            }
        }


        private void getAllCategory()
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_JobCategory_SYS", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@status", "SELECT");
            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);
        }
    }
}