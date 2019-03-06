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
    public class Business_JobSeeker_CarreInfo
    {
        DataTable objTable = new DataTable();
        private Data_JobSeeker_CarrerInfo objDataJobSeekerCarrerInfo = new Data_JobSeeker_CarrerInfo();

        public DataTable BusinessFillJobLevelDropDown()
        {
            objTable.Clear();
            objTable = objDataJobSeekerCarrerInfo.DataFillJobLevelDropDown();
            return objTable;
        }

        public DataTable BusinessFillJobNatureDropDown()
        {
            objTable.Clear();
            objTable = objDataJobSeekerCarrerInfo.DataFillJobNatureDropDown();
            return objTable;
        }

        public DataTable BusinessFillCarrerInformation(int Js_ID)
        {
            objTable.Clear();
            objTable = objDataJobSeekerCarrerInfo.DataFillCarrerInformationr(Js_ID);
            return objTable;
        }

        public string BusinessRegisterPersonalInformation(Entity_JobSeeker_CarrerInfo objEntityJobSeekerCarrerInfo)
        {
            string error_msg = "";

            SqlParameter[] objParams = new SqlParameter[6];

            objParams[0] = new SqlParameter("@Js_ID", SqlDbType.Int);
            objParams[0].Value = objEntityJobSeekerCarrerInfo.id;

            objParams[1] = new SqlParameter("@Js_Objective", SqlDbType.VarChar, 500);
            objParams[1].Value = objEntityJobSeekerCarrerInfo.objective;

            objParams[2] = new SqlParameter("@Js_Expatsal", SqlDbType.Int);
            objParams[2].Value = objEntityJobSeekerCarrerInfo.expsal;

            objParams[3] = new SqlParameter("@Js_JobLevel", SqlDbType.Int);
            objParams[3].Value = objEntityJobSeekerCarrerInfo.joblevel;

            objParams[4] = new SqlParameter("@Js_JobNature", SqlDbType.Int);
            objParams[4].Value = objEntityJobSeekerCarrerInfo.jobnature;

            objParams[5] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
            objParams[5].Direction = ParameterDirection.Output;

            error_msg = objDataJobSeekerCarrerInfo.DataRegisterCarrerInformation(objParams);
            return error_msg;
        }
    }
}
