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
    public class Business_JobSeeker_PersonalInfo
    {
        DataTable objTable = new DataTable();
        private Data_JobSeeker_PersonalInfo objDataJobSeekerPersonalInfo = new Data_JobSeeker_PersonalInfo();

        public DataTable BusinessFillGenderDropDown()
        {
            objTable.Clear();
            objTable = objDataJobSeekerPersonalInfo.DataFillGenderDropDown();
            return objTable;
        }

        public DataTable BusinessFillReligionDropDown()
        {
            objTable.Clear();
            objTable = objDataJobSeekerPersonalInfo.DataFillReligionDropDown();
            return objTable;
        }

        public DataTable BusinessFillMaritalStatusDropDown()
        {
            objTable.Clear();
            objTable = objDataJobSeekerPersonalInfo.DataFillMaritalStatusDropDown();
            return objTable;
        }

        public DataTable BusinessFillCurrentCityDropDown()
        {
            objTable.Clear();
            objTable = objDataJobSeekerPersonalInfo.DataFillCurrentCityDropDown();
            return objTable;
        }

        public DataTable BusinessFillPersonalInformation(int Js_ID)
        {
            objTable.Clear();
            objTable = objDataJobSeekerPersonalInfo.DataFillPersonalInformationr(Js_ID);
            return objTable;
        }

        public string BusinessRegisterPersonalInformation(Entity_JobSeeker_PersonalInfo objEntityJobSeekerPersonalInfo)
        {
            string error_msg = "";

            SqlParameter[] objParams = new SqlParameter[14];

            objParams[0] = new SqlParameter("@Js_ID", SqlDbType.Int);
            objParams[0].Value = objEntityJobSeekerPersonalInfo.id;

            objParams[1] = new SqlParameter("@Js_FatherName", SqlDbType.VarChar, 40);
            objParams[1].Value = objEntityJobSeekerPersonalInfo.fathername;

            objParams[2] = new SqlParameter("@Js_MotherName", SqlDbType.VarChar, 40);
            objParams[2].Value = objEntityJobSeekerPersonalInfo.mothername;

            objParams[3] = new SqlParameter("@Js_DOB", SqlDbType.VarChar, 40);
            objParams[3].Value = objEntityJobSeekerPersonalInfo.dob;

            objParams[4] = new SqlParameter("@Js_Gender", SqlDbType.Int);
            objParams[4].Value = objEntityJobSeekerPersonalInfo.gender;

            objParams[5] = new SqlParameter("@Js_Religion", SqlDbType.Int);
            objParams[5].Value = objEntityJobSeekerPersonalInfo.religion;

            objParams[6] = new SqlParameter("@Js_MaritalStatus", SqlDbType.Int);
            objParams[6].Value = objEntityJobSeekerPersonalInfo.maritalstatus;

            objParams[7] = new SqlParameter("@Js_NID", SqlDbType.BigInt);
            objParams[7].Value = objEntityJobSeekerPersonalInfo.nid;

            objParams[8] = new SqlParameter("@Js_PresentAddress", SqlDbType.VarChar, 250);
            objParams[8].Value = objEntityJobSeekerPersonalInfo.presentaddress;

            objParams[9] = new SqlParameter("@Js_PermanentAddress", SqlDbType.VarChar, 250);
            objParams[9].Value = objEntityJobSeekerPersonalInfo.permanentaddress;

            objParams[10] = new SqlParameter("@Js_CurrentLocation", SqlDbType.Int);
            objParams[10].Value = objEntityJobSeekerPersonalInfo.currentLocation;

            objParams[11] = new SqlParameter("@Js_PhoneNumber_1", SqlDbType.BigInt);
            objParams[11].Value = objEntityJobSeekerPersonalInfo.phnum_1;

            objParams[12] = new SqlParameter("@Js_PhoneNumber_2", SqlDbType.BigInt);
            objParams[12].Value = objEntityJobSeekerPersonalInfo.phnum_2;

            objParams[13] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
            objParams[13].Direction = ParameterDirection.Output;

            error_msg = objDataJobSeekerPersonalInfo.DataRegisterPersonalInformation(objParams);
            return error_msg;
        }
    }
}