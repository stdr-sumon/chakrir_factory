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
    public class Data_All_SignIn
    {
        static string strConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        SqlConnection objConnection = new SqlConnection(strConnectionString);
        SqlCommand objCommand = null;
        DataTable objSignInDataTable = new DataTable();
        SqlDataAdapter objAdapter = null;

        public DataTable dataJobSeekerSignIn(SqlParameter[] objParams)
        {
            using (objConnection)
            {
                try
                {         
                    objCommand = new SqlCommand("SP_LoginJobSeeker", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                    objCommand.Parameters.AddRange(objParams);

                    objAdapter = new SqlDataAdapter(objCommand);
                    objAdapter.Fill(objSignInDataTable);
                }
                catch(Exception ex)
                {

                }
                finally
                {
                    objConnection.Close();
                    objCommand.Dispose();
                }
                return objSignInDataTable;
            }
        }

        public DataTable dataCompanySignIn(SqlParameter[] objParams)
        {
            using (objConnection)
            {
                try
                {
                    objCommand = new SqlCommand("SP_LoginCompany", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                    objCommand.Parameters.AddRange(objParams);

                    objAdapter = new SqlDataAdapter(objCommand);
                    objAdapter.Fill(objSignInDataTable);
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    objConnection.Close();
                    objCommand.Dispose();
                }
                return objSignInDataTable;
            }
        }

        public DataTable dataAdminSignIn(SqlParameter[] objParams)
        {
            using (objConnection)
            {
                try
                {
                    objCommand = new SqlCommand("SP_LoginSystem", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                    objCommand.Parameters.AddRange(objParams);

                    objAdapter = new SqlDataAdapter(objCommand);
                    objAdapter.Fill(objSignInDataTable);
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    objConnection.Close();
                    objCommand.Dispose();
                }
                return objSignInDataTable;
            }
        }
    }
}
