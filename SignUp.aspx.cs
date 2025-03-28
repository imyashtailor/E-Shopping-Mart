using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_shopping_Website
{
    public partial class SignUp : System.Web.UI.Page
    {
        public object Usertype { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void txtsignup_Click(object sender, EventArgs e)
        {
            if (isformvalid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingDB"].ConnectionString))
                {
                    try
                    {
                        con.Open();

                        // insert the query (parametrized query)
                        SqlCommand cmd = new SqlCommand("INSERT INTO Users (Username, Password, Email, Name, Usertype) VALUES (@Username, @Password, @Email, @Name, @User)", con);

                        // Adding parameters to the query
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Name", txtname.Text);
                        cmd.Parameters.AddWithValue("@Password", txtuPass.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@User", Usertype);

                        // click login button after successful message display
                        Response.Write("<script> alert('Registration successfully done'); </script>");
                        clr();

                        // Execute the query
                        cmd.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        // Handle errors if any
                        Response.Write("<script> alert('Error: " + ex.Message + "'); </script>");
                    }
                }
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.Write("<script> alert('Registration failed'); </script>");
                lblMsg.Text = "All fields are mandatory";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        private bool isformvalid()
        {
           if (txtname.Text == "")
           {
              Response.Write("<script> alert('name is not valid'); </script>");
              txtname.Focus();

              return false;
           }
           else if(txtUsername.Text == "")
            {
                Response.Write("<script> alert('Username is not valid'); </script>");
                txtUsername.Focus();

                return false;
            }
           else if (txtuPass.Text == "")
           {
              Response.Write("<script> alert('Password is not valid'); </script>");
              txtuPass.Focus();

              return false;
           }
           else if (txtuPass.Text != txtCPass.Text)
           {
               Response.Write("<script> alert('Confirm Password is not valid'); </script>");
               txtCPass.Focus();
                
                return false;
           }
           else if (txtEmail.Text == "")
           {
               Response.Write("<script> alert('Email is not valid'); </script>");
               txtEmail.Focus();
               
               return false;
           }
           return true;
        }
        private void clr()
        {
            txtUsername.Text = string.Empty;
            txtname.Text = string.Empty;
            txtuPass.Text = string.Empty;
            txtCPass.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }
    }
}
  