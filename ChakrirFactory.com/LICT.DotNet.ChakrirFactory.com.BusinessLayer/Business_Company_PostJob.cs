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
    public class Business_Company_PostJob
    {
        DataTable objTable = new DataTable();
        private Data_Comapny_PostJob objDataComapnyPostJob = new Data_Comapny_PostJob();

        public DataTable BusinessFillCurrentCityDropDown()
        {
            objTable.Clear();
            objTable = objDataComapnyPostJob.DataFillCurrentCityDropDown();
            return objTable;
        }

        public DataTable BusinessFillJobCategoryDropDown()
        {
            objTable.Clear();
            objTable = objDataComapnyPostJob.DataFillJobCategoryDropDown();
            return objTable;
        }

        public DataTable BusinessFillJobNatureDropDown()
        {
            objTable.Clear();
            objTable = objDataComapnyPostJob.DataFillJobNatureDropDown();
            return objTable;
        }

        public string businessRegisterJobSeeker(Entity_Company_JobPost objEntityCompanyJobPost)
        {
            string error_msg = "";

            SqlParameter[] objParams = new SqlParameter[15];

            objParams[0] = new SqlParameter("@Cmp_ID", SqlDbType.Int);
            objParams[0].Value = objEntityCompanyJobPost.id;

            objParams[1] = new SqlParameter("@Job_Title", SqlDbType.VarChar, 60);
            objParams[1].Value = objEntityCompanyJobPost.title;

            objParams[2] = new SqlParameter("@Job_Category", SqlDbType.Int);
            objParams[2].Value = objEntityCompanyJobPost.category;

            objParams[3] = new SqlParameter("@Job_VacancyNo", SqlDbType.Int);
            objParams[3].Value = objEntityCompanyJobPost.vacancyno;

            objParams[4] = new SqlParameter("@Job_Gender", SqlDbType.VarChar, 30);
            objParams[4].Value = objEntityCompanyJobPost.gender;

            objParams[5] = new SqlParameter("@Job_Nature", SqlDbType.Int);
            objParams[5].Value = objEntityCompanyJobPost.nature;

            objParams[6] = new SqlParameter("@Job_Location", SqlDbType.Int);
            objParams[6].Value = objEntityCompanyJobPost.location;

            objParams[7] = new SqlParameter("@Job_SalRange", SqlDbType.VarChar, 150);
            objParams[7].Value = objEntityCompanyJobPost.salrange;

            objParams[8] = new SqlParameter("@Job_Decription ", SqlDbType.NVarChar, -1);
            objParams[8].Value = objEntityCompanyJobPost.description;

            objParams[9] = new SqlParameter("@Job_ExpReq", SqlDbType.NVarChar, -1);
            objParams[9].Value = objEntityCompanyJobPost.expreq;

            objParams[10] = new SqlParameter("@Job_EduRequirement", SqlDbType.NVarChar, -1);
            objParams[10].Value = objEntityCompanyJobPost.edureq;

            objParams[11] = new SqlParameter("@Job_Requirement", SqlDbType.NVarChar, -1);
            objParams[11].Value = objEntityCompanyJobPost.jobreq;

            objParams[12] = new SqlParameter("@Job_OtherBenifit", SqlDbType.NVarChar, -1);
            objParams[12].Value = objEntityCompanyJobPost.otherbenefit;

            objParams[13] = new SqlParameter("@Job_Deadline", SqlDbType.Date);
            objParams[13].Value = objEntityCompanyJobPost.deadline.Date;

            objParams[14] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
            objParams[14].Direction = ParameterDirection.Output;

            error_msg = objDataComapnyPostJob.dataRegisterJobPost(objParams);
            return error_msg;
        }
    }
}
