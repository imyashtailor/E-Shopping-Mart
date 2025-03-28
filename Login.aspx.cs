using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace E_shopping_Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                // check the information it is correct or not then store the data.
                if(Request.Cookies ["UNAME"] !=null && Request.Cookies["UPWD"] !=null)
                {
                    txtusername.Text = Request.Cookies["UNAME"].Value;
                    txtPass.Text = Request.Cookies["UPWD"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }

        protected void txtloginup_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager .ConnectionStrings["ShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select *from Users where Username=@username and Password=@pwd", con);
                cmd.Parameters.AddWithValue("@username",txtusername.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPass.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    Session["USERID"] = dt.Rows[0]["Uid"].ToString();
                    Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();
                    // set the cookie and store the cookie
                    if (CheckBox1.Checked)
                    {
                        Response.Cookies["UNAME"].Value = txtusername.Text;
                        Response.Cookies["UPWD"].Value = txtPass.Text;

                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(5);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(5);
                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);

                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                    }

                    string Utype;
                    Utype = dt.Rows[0][5].ToString().Trim();

                    if(Utype == "User")
                    {
                        Session["Username"] = txtusername.Text;
                        if (Request.QueryString["rurl"] != null)
                        {
                            if (Request.QueryString["rurl"] == "cart")
                            {
                                Response.Redirect("~/AddCart.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect("~/UserHome.aspx");
                        }
                    }
                    if(Utype == "Admin")
                    {
                        Session["Username"] = txtusername.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Invalid Username and Password";
                }
                clr();
                con.Close();
            }   
        }

        private void clr()
        {
            txtPass.Text = string.Empty;
            txtusername.Text = string.Empty;
            txtusername.Focus();
        }
    }
}