using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_shopping_Website
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartNumber();
            if (Session["Username"] != null)
            {
                //lblSuccess.Text = " Login Successfully, Welcome " + Session["Username"].ToString();
                btnSignUp.Visible = false;
                btnLogin.Visible = false;
                btnlogout.Visible = true;
            }
            else
            {
                btnSignUp.Visible = true;
                btnlogout.Visible = false;
                btnLogin.Visible = true;
                //Response.Redirect("~/Default.aspx");
            }
        }
        public void BindCartNumber()
        {
            if (Request.Cookies["CatPID"] != null)
            {
                string CookiePID = Request.Cookies["CatPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();
            }
            else
            {
                pCount.InnerText = 0.ToString();
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}