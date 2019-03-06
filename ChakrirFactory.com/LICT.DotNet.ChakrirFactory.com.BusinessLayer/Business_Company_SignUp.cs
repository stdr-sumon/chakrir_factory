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
    public class Business_Company_SignUp
    {
        private Data_Company_SignUp objDataCompanySignUp = new Data_Company_SignUp();
        SqlDataAdapter objAdapter = null;
        DataTable objTable = new DataTable();

        public DataTable BusinessFillCurrentCityDropDown()
        {
            objTable.Clear();
            objTable = objDataCompanySignUp.DataFillCurrentCityDropDown();
            return objTable;
        }

        public string businessRegisterCompany(Entity_Company_SignUp objEntittyCompanySignUp)
        {
            string error_msg = "";

            SqlParameter[] objParams = new SqlParameter[11];

            objParams[0] = new SqlParameter("@Cmp_UserName", SqlDbType.VarChar, 40);
            objParams[0].Value = objEntittyCompanySignUp.username;

            objParams[1] = new SqlParameter("@Cmp_Password", SqlDbType.VarChar, 60);
            objParams[1].Value = objEntittyCompanySignUp.password;

            objParams[2] = new SqlParameter("@Cmp_Name", SqlDbType.VarChar, 120);
            objParams[2].Value = objEntittyCompanySignUp.name;

            objParams[3] = new SqlParameter("@Cmp_Description", SqlDbType.VarChar, 250);
            objParams[3].Value = objEntittyCompanySignUp.description;

            objParams[4] = new SqlParameter("@Cmp_Address", SqlDbType.VarChar, 120);
            objParams[4].Value = objEntittyCompanySignUp.address;

            objParams[5] = new SqlParameter("@Cmp_City", SqlDbType.Int);
            objParams[5].Value = objEntittyCompanySignUp.city;

            objParams[6] = new SqlParameter("@Cmp_PhoneNumber", SqlDbType.BigInt);
            objParams[6].Value = objEntittyCompanySignUp.cmpphnum;

            objParams[7] = new SqlParameter("@Cmp_PersName", SqlDbType.VarChar, 40);
            objParams[7].Value = objEntittyCompanySignUp.personname;

            objParams[8] = new SqlParameter("@Cmp_PersDesignation", SqlDbType.VarChar, 30);
            objParams[8].Value = objEntittyCompanySignUp.persondesg;

            objParams[9] = new SqlParameter("@Cmp_PersTelNum", SqlDbType.BigInt);
            objParams[9].Value = objEntittyCompanySignUp.perphnum;

            objParams[10] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
            objParams[10].Direction = ParameterDirection.Output;

            error_msg = objDataCompanySignUp.dataRegisterCompany(objParams);
            return error_msg;
        }
    }
}
