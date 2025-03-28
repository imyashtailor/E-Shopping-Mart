using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace E_shopping_Website
{
    public partial class AddProduct : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["ShoppingDB"].ConnectionString;

        public string PID { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Page first time enter the execute the code.
                BindBrand();
                BindCategory();
                BindGender();
                ddlSubCategory.Enabled = false;
                ddlGender.Enabled = false;
            }
        }

        private void BindBrand()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select *from tblBrands", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandId";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select *from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatId";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        private void BindGender()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select *from tblGender with(nolock)", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "GenderName";
                    ddlGender.DataValueField = "GenderId";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_InserProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
                cmd.Parameters.AddWithValue("@PSellPrice", txtSellPrice.Text);
                cmd.Parameters.AddWithValue("@PBrandID", ddlBrand.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PSubCatID", ddlSubCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PGender", ddlGender.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
                cmd.Parameters.AddWithValue("@PProductDetails", txtPDetail.Text);
                cmd.Parameters.AddWithValue("@PMaterialCare", txtMatCare.Text);
                if (chFD.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
                }

                if (ch30Ret.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@30DayRet", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@30DayRet", 0.ToString());
                }
                if (cbCOD.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@COD", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@COD", 0.ToString());
                }
                con.Open();
                Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

                //Insert size quantity
                for (int i = 0; i < cblSize.Items.Count; i++)
                {
                    if (cblSize.Items[i].Selected == true)
                    {
                        Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                        int Quantity = Convert.ToInt32(txtQuantity.Text);

                        SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQuantity values('" + PID + "','" + SizeID + "','" + Quantity + "')", con);
                        cmd2.ExecuteNonQuery();
                    }
                }
                //Insert and upload images
                if (fuImg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/inside images/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);

                    // Use a parameterized query to prevent SQL injection
                    string query = "INSERT INTO tblProductImages (PID, Name, Extension) VALUES (@PID, @Name, @Extension)";
                    SqlCommand cmd3 = new SqlCommand(query, con);

                    // Add parameters to avoid SQL injection and ensure correct data handling
                    cmd3.Parameters.AddWithValue("@PID", PID);
                    cmd3.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "01"); // Ensure trimming and adding "01"
                    cmd3.Parameters.AddWithValue("@Extension", Extention);

                    cmd3.ExecuteNonQuery();

                }
                //2nd fileupload
                if (fuImg02.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/inside images/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                    fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                    string query = "INSERT INTO tblProductImages (PID, Name, Extension) VALUES (@PID, @Name, @Extension)";
                    SqlCommand cmd4 = new SqlCommand(query, con);

                    // Add parameters to avoid SQL injection and ensure correct data handling
                    cmd4.Parameters.AddWithValue("@PID", PID);
                    cmd4.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "02"); // Ensure trimming and adding "01"
                    cmd4.Parameters.AddWithValue("@Extension", Extention);

                    cmd4.ExecuteNonQuery();
                }

                //3rd file upload 
                if (fuImg03.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/inside images/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                    fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                    string query = "INSERT INTO tblProductImages (PID, Name, Extension) VALUES (@PID, @Name, @Extension)";
                    SqlCommand cmd5 = new SqlCommand(query, con);

                    // Add parameters to avoid SQL injection and ensure correct data handling
                    cmd5.Parameters.AddWithValue("@PID", PID);
                    cmd5.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "03"); // Ensure trimming and adding "01"
                    cmd5.Parameters.AddWithValue("@Extension", Extention);

                    cmd5.ExecuteNonQuery();
                }
                //4th file upload control
                if (fuImg04.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/inside images/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                    fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);

                    string query = "INSERT INTO tblProductImages (PID, Name, Extension) VALUES (@PID, @Name, @Extension)";
                    SqlCommand cmd6 = new SqlCommand(query, con);

                    // Add parameters to avoid SQL injection and ensure correct data handling
                    cmd6.Parameters.AddWithValue("@PID", PID);
                    cmd6.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "04"); // Ensure trimming and adding "01"
                    cmd6.Parameters.AddWithValue("@Extension", Extention);

                    cmd6.ExecuteNonQuery();
                }

                //5th file upload
                if (fuImg05.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/inside images/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg05.PostedFile.FileName);
                    fuImg05.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "05" + Extention);

                    string query = "INSERT INTO tblProductImages (PID, Name, Extension) VALUES (@PID, @Name, @Extension)";
                    SqlCommand cmd7 = new SqlCommand(query, con);

                    // Add parameters to avoid SQL injection and ensure correct data handling
                    cmd7.Parameters.AddWithValue("@PID", PID);
                    cmd7.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "05"); // Ensure trimming and adding "01"
                    cmd7.Parameters.AddWithValue("@Extension", Extention);

                    cmd7.ExecuteNonQuery();

                }

            }

        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubCategory.Enabled = true;
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSizes where BrandId='" + ddlBrand.SelectedItem.Value + "' and CatrgoryId='" + ddlCategory.SelectedItem.Value + "' and SubCategoryId='" + ddlSubCategory.SelectedItem.Value + "' and GenderId='" + ddlGender.SelectedItem.Value + "' ", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    cblSize.DataSource = dt;
                    cblSize.DataTextField = "SizeName";
                    cblSize.DataValueField = "SizeID";
                    cblSize.DataBind();


                }
            }
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSubCategory.SelectedIndex != 0)
            {
                ddlGender.Enabled = true;
            }
            else
            {
                ddlGender.Enabled = false;
            }
        }
    }
}