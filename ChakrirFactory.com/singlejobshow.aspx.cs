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
    public partial class singlejobshow : System.Web.UI.Page
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;
        SqlDataAdapter objAdapter = null;
        StringBuilder html = new StringBuilder();
        private DataTable objTable = new DataTable();

        int Job_ID;

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

            Job_ID = Convert.ToInt32(Request.QueryString[0]);

            if (!IsPostBack)
            {              
                getAllJobInfo();

                foreach (DataRow row in objTable.Rows)
                {
                    jobTtile.InnerHtml = row["Job_Title"].ToString();

                    job_vacancy.InnerHtml = row["Job_VacancyNo"].ToString();

                    job_gen.InnerHtml = row["Job_Gender"].ToString();

                    jobExpRequirement.InnerHtml = row["Job_ExpReq"].ToString();

                    job_sal.InnerHtml = row["Job_SalRange"].ToString();

                    jobDescription.InnerHtml = row["Job_Decription"].ToString();

                    eduRequirement.InnerHtml = row["Job_EduRequirement"].ToString();

                    jobJobRequirement.InnerHtml = row["Job_Requirement"].ToString();

                    job_pub.InnerHtml = row["Job_PostDate"].ToString();

                    job_dead.InnerHtml = row["Job_Deadline"].ToString();

                    job_city.InnerHtml = row["City_Name"].ToString();

                    job_cat.InnerHtml = row["JobCategory_Name"].ToString();

                    job_nature.InnerHtml = row["JobNature_Name"].ToString();

                    cmp_name.InnerHtml = row["Cmp_Name"].ToString();

                    cmp_add.InnerHtml = row["Cmp_Address"].ToString();

                    cmp_phone.InnerHtml = row["Cmp_PhoneNumber"].ToString();
                }
            }
        }

        private void getAllJobInfo()
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_SingleJobInfo", objConnection);
            objCommand.Parameters.AddWithValue("@Job_ID", Job_ID);
            objCommand.CommandType = CommandType.StoredProcedure;
            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);
        }

        protected void btn_ApplyOnline_Click(object sender, EventArgs e)
        {
            if (Session["Js_ID"] != null)
            {
                string error_msg = "";

                SqlParameter[] objParams = new SqlParameter[4];

                objParams[0] = new SqlParameter("@Job_ID", SqlDbType.Int);
                objParams[0].Value = Job_ID;

                objParams[1] = new SqlParameter("@Js_ID", SqlDbType.Int);
                objParams[1].Value = Convert.ToInt16(Session["Js_ID"]);

                objParams[2] = new SqlParameter("@status", SqlDbType.VarChar, 50);
                objParams[2].Value = "INSERT";

                objParams[3] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
                objParams[3].Direction = ParameterDirection.Output;

                using (objConnection)
                {
                    try
                    {
                        objCommand = new SqlCommand("SP_JobApply", objConnection);
                        objCommand.CommandType = CommandType.StoredProcedure;

                        objCommand.Parameters.AddRange(objParams);
                        objConnection.Open();

                        objCommand.ExecuteNonQuery();
                        objConnection.Close();
                        error_msg = (string)objCommand.Parameters["@ERROR"].Value;
                    }
                    catch (Exception ex)
                    {
                        error_msg = ex.Message;
                    }
                    finally
                    {
                        objConnection.Close();
                        objCommand.Dispose();
                    }
                }
                if (String.IsNullOrWhiteSpace(error_msg.ToString()))
                {
                    lblApplyOnlineMsg.Visible = true;
                    lblApplyOnlineMsg.ForeColor = System.Drawing.Color.Green;
                    lblApplyOnlineMsg.Text = "Applied Succesfully";
                }
                else
                {
                    lblApplyOnlineMsg.Visible = true;
                    lblApplyOnlineMsg.ForeColor = System.Drawing.Color.Red;
                    lblApplyOnlineMsg.Text = error_msg;
                }
            }
            else
            {
                lblApplyOnlineMsg.Visible = true;
                lblApplyOnlineMsg.ForeColor = System.Drawing.Color.Red;
                lblApplyOnlineMsg.Text = "You Have to log In as Job Seeker";
            }
        }
    }
}