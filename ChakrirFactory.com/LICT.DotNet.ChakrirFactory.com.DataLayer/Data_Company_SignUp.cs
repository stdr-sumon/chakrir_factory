using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LICT.DotNet.ChakrirFactory.com.DataLayer
{
    public class Data_Company_SignUp
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;
        SqlDataAdapter objAdapter = null;
        DataTable objTable = new DataTable();

        public DataTable DataFillCurrentCityDropDown()
        {
            objTable.Clear();
            objCommand = new SqlCommand("SP_CityName_SYS", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@status", "SELECT");

            objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objTable);

            return objTable;
        }

        public string dataRegisterCompany(SqlParameter[] objParams)
        {
            string error_msg = "";
            using (objConnection)
            {
                try
                {
                    objCommand = new SqlCommand("SP_RegisterationCMP", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                    objCommand.Parameters.AddRange(objParams);
                    objConnection.Open();

                    objCommand.ExecuteNonQuery();
                    objConnection.Close();
                    error_msg = (string)objCommand.Parameters["@ERROR"].Value;
                }
                catch (Exception ex)
                {

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
