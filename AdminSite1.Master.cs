using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_shopping_Website
{
    public partial class AdminSite1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdminlogout(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session.Abandon();
            Response.Redirect("~/Login.aspx", true); 
        }
    }
}