using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using LICT.DotNet.ChakrirFactory.com.EntityLayer;
using LICT.DotNet.ChakrirFactory.com.DataLayer;

namespace LICT.DotNet.ChakrirFactory.com.BusinessLayer
{
    public class Business_JobSeeker_SignUp
    {
        private Data_JobSeeker_SignUp objDataJobSeekerSignUp = new Data_JobSeeker_SignUp();

        public string businessRegisterJobSeeker(Entitty_JobSeeker_SignUp objEntittyJobSeekerSignUp)
        {
            string error_msg = "";

            SqlParameter[] objParams = new SqlParameter[6];

            objParams[0] = new SqlParameter("@Js_UserName", SqlDbType.VarChar, 40);
            objParams[0].Value = objEntittyJobSeekerSignUp.username;

            objParams[1] = new SqlParameter("@Js_Password", SqlDbType.VarChar, 60);
            objParams[1].Value = objEntittyJobSeekerSignUp.userpassword;

            objParams[2] = new SqlParameter("@Js_FirstName", SqlDbType.VarChar, 20);
            objParams[2].Value = objEntittyJobSeekerSignUp.firstname;

            objParams[3] = new SqlParameter("@Js_LastName", SqlDbType.VarChar, 20);
            objParams[3].Value = objEntittyJobSeekerSignUp.lastname;

            objParams[4] = new SqlParameter("@Js_Email", SqlDbType.VarChar, 50);
            objParams[4].Value = objEntittyJobSeekerSignUp.email;

            objParams[5] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
            objParams[5].Direction = ParameterDirection.Output;

            error_msg = objDataJobSeekerSignUp.dataRegisterJobSeeker(objParams);
            return error_msg;
        }
    }
}
