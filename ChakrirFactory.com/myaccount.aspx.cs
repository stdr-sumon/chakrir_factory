using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChakrirFactory.com
{
    public partial class myaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Js_Name"] != null) { Response.Redirect("/JobSeeker/index.aspx"); }
            else if (Session["Cmp_Name"] != null) { Response.Redirect("/Company/index.aspx"); }
            else { Response.Redirect("/Admin/index.aspx"); }
        }
    }
}