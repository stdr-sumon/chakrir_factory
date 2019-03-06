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
    public class Data_JobSeeker_SignUp
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;

        public string dataRegisterJobSeeker(SqlParameter[] objParams)
        {
            string error_msg = "";
            using (objConnection)
            {
                try
                {
                    objCommand = new SqlCommand("SP_RegisterationJS", objConnection);
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
