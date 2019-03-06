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
    public class Business_JobSeeker_PreferredJobCategory
    {
        DataTable objTable = new DataTable();
        private Data_JobSeeker_PreferredJobCategory objDataJobSeekerPreferredJobCategory = new Data_JobSeeker_PreferredJobCategory();

        public DataTable BusinessFillJobCategory()
        {
            objTable.Clear();
            objTable = objDataJobSeekerPreferredJobCategory.DataFillJobCategoryDropDown();
            return objTable;
        }

        public DataTable BusinessFillJobLocation()
        {
            objTable.Clear();
            objTable = objDataJobSeekerPreferredJobCategory.DataFillJobLocationDropDown();
            return objTable;
        }

        public DataTable BusinessFillPreferredJobCatandLocInformation(int Js_ID)
        {
            objTable.Clear();
            objTable = objDataJobSeekerPreferredJobCategory.DataFillPreferredJobCatandLocInformationr(Js_ID);
            return objTable;
        }

        public string BusinessRegisterPreferredJobCatandLocInformation(Entity_JobSeeker_PreferredJobCategory objEntityJobSeekerPreferredJobCategory)
        {
            string error_msg = "";

            SqlParameter[] objParams = new SqlParameter[8];

            objParams[0] = new SqlParameter("@Js_ID", SqlDbType.Int);
            objParams[0].Value = objEntityJobSeekerPreferredJobCategory.id;

            objParams[1] = new SqlParameter("@Js_PrefJobCat_1", SqlDbType.Int);
            objParams[1].Value = objEntityJobSeekerPreferredJobCategory.jobcat_1;

            objParams[2] = new SqlParameter("@Js_PrefJobCat_2", SqlDbType.Int);
            objParams[2].Value = objEntityJobSeekerPreferredJobCategory.jobcat_2;

            objParams[3] = new SqlParameter("@Js_PrefJobCat_3", SqlDbType.Int);
            objParams[3].Value = objEntityJobSeekerPreferredJobCategory.jobcat_3;

            objParams[4] = new SqlParameter("@Js_PrefJobLoc_1", SqlDbType.Int);
            objParams[4].Value = objEntityJobSeekerPreferredJobCategory.jobLoc_1;

            objParams[5] = new SqlParameter("@Js_PrefJobLoc_2", SqlDbType.Int);
            objParams[5].Value = objEntityJobSeekerPreferredJobCategory.jobLoc_2;

            objParams[6] = new SqlParameter("@Js_PrefJobLoc_3", SqlDbType.Int);
            objParams[6].Value = objEntityJobSeekerPreferredJobCategory.jobLoc_3;

            objParams[7] = new SqlParameter("@ERROR", SqlDbType.Char, 100);
            objParams[7].Direction = ParameterDirection.Output;

            error_msg = objDataJobSeekerPreferredJobCategory.DataRegisterPreferredJobCatandLocInformation(objParams);
            return error_msg;
        }
    }
}
