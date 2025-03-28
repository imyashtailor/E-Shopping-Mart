using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace E_shopping_Website
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        public string Password { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select *from Users where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    String myGUID = Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);
                    SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Uid,RequestDateTime) Values('"+myGUID +"', '"+Uid+"',GETDATE())", con);
                    cmd1.ExecuteNonQuery();

                    //Send Reset link via Email
                    //create a mail 

                    String ToEmailAddress = dt.Rows[0][3].ToString();
                    String Username =dt.Rows[0][1].ToString();
                    String EmailBody ="Hi ,"+Username + ",<br/><br/>Click the link below to reset your password<br/> https://localhost:44359/RecoverPassword.aspx?id="+myGUID;

                    MailMessage PassRecMail = new MailMessage("tailory123@gmail.com",ToEmailAddress);

                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml = true;
                    try
                    {
                        using (SmtpClient client = new SmtpClient())
                        {
                            client.EnableSsl = true;
                            client.UseDefaultCredentials = false;
                            client.Credentials = new NetworkCredential("tailory123@gmail.com", "icnu sgfb jdet pxws"); // You should use an App Password, not your Gmail password
                            client.Host = "smtp.gmail.com";
                            client.Port = 587; // Use port 587 for TLS (recommended for Gmail)
                            client.DeliveryMethod = SmtpDeliveryMethod.Network;

                            // Assuming PassRecMail is the MailMessage object
                            client.Send(PassRecMail);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                    PassRecMail.Subject = "Reset PassWord";
                    //SmtpClient SMTP = new SmtpClient("smtp.gmail.com",768);
                    //SMTP.Credentials = new NetworkCredential()
                    //{
                    //    UserName = "tailory123@gmail.com",
                    //    Password= "yash1611#*"
                    //};
                    //SMTP.EnableSsl = true;
                    //SMTP.Send(PassRecMail);

                    //--------end-------------






                    lblResetPassMsg.Text = "Reset Link send ! Check Your Email For Reset Password";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                    txtEmailID.Text = string.Empty;
                }
                else
                {
                    lblResetPassMsg.Text = "OOps! This Email Does Not Exist....Plese Try again";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                    txtEmailID.Text = string.Empty;
                    txtEmailID.Focus();
                }
                
            }
        }
    }
}