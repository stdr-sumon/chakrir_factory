using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using LICT.DotNet.ChakrirFactory.com.DataLayer;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;

namespace LICT.DotNet.ChakrirFactory.com.BusinessLayer
{
    public class Business_All_SignIn
    {
        private Data_All_SignIn objDataAllSignIn = new Data_All_SignIn();
        DataTable objSignInDataTable = new DataTable();

        public DataTable businessJobSeekerSignIn(Entity_All_Signin objEntityAllSignIn)
        {
            SqlParameter[] objParams = new SqlParameter[2];

            objParams[0] = new SqlParameter("@Js_UserName", SqlDbType.VarChar, 40);
            objParams[0].Value = objEntityAllSignIn.username;

            objParams[1] = new SqlParameter("@Js_Password", SqlDbType.VarChar, 60);
            objParams[1].Value = objEntityAllSignIn.userpassword;

            objSignInDataTable = objDataAllSignIn.dataJobSeekerSignIn(objParams);
            return objSignInDataTable;
        }

        public DataTable businessCompanySignIn(Entity_All_Signin objEntityAllSignIn)
        {
            SqlParameter[] objParams = new SqlParameter[2];

            objParams[0] = new SqlParameter("@Cmp_UserName", SqlDbType.VarChar, 40);
            objParams[0].Value = objEntityAllSignIn.username;

            objParams[1] = new SqlParameter("@Cmp_Password", SqlDbType.VarChar, 60);
            objParams[1].Value = objEntityAllSignIn.userpassword;

            objSignInDataTable = objDataAllSignIn.dataCompanySignIn(objParams);
            return objSignInDataTable;
        }

        public DataTable businessAdminSignIn(Entity_All_Signin objEntityAllSignIn)
        {
            SqlParameter[] objParams = new SqlParameter[2];

            objParams[0] = new SqlParameter("@System_UserName", SqlDbType.VarChar, 40);
            objParams[0].Value = objEntityAllSignIn.username;

            objParams[1] = new SqlParameter("@System_Password", SqlDbType.VarChar, 60);
            objParams[1].Value = objEntityAllSignIn.userpassword;

            objSignInDataTable = objDataAllSignIn.dataAdminSignIn(objParams);
            return objSignInDataTable;
        }
    }
}
