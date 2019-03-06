using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LICT.DotNet.ChakrirFactory.com.DataLayer
{
    public class Data_JobSeeker_CarrerInfo
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;
        SqlDataAdapter objAdapter = null;
        DataTable objTable = new DataTable();

        public DataTable DataFillJobLevelDropDown()
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_JobLevel_SYS", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@status", "SELECT");

            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);

            return objTable;
        }

        public DataTable DataFillJobNatureDropDown()
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_JobNature_SYS", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@status", "SELECT");

            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);

            return objTable;
        }

        public DataTable DataFillCarrerInformationr(int Js_ID)
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_JobSeekerCarrerInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@Js_ID", Js_ID);

            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);

            return objTable;
        }

        public string DataRegisterCarrerInformation(SqlParameter[] objParams)
        {
            string error_msg = "";
            using (objConnection)
            {
                try
                {
                    objCommand = new SqlCommand("SP_RegisterationCareerInfoJS", objConnection);
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
                return error_msg;
            }
        }
    }
}
