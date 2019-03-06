using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChakrirFactory.com
{
    public partial class signout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cookies["JobSeekerBasicInfo"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["CompanyBasicInfo"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["SystemBasicInfo"].Expires = DateTime.Now.AddDays(-1);
            Session.Abandon();

            Response.Redirect("index.aspx");
        }
    }
}