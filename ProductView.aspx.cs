using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

namespace E_shopping_Website
{
    public partial class ProductView : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["ShoppingDB"].ConnectionString;

        public object CatrgoryId { get; private set; }
        public object BrandId { get; private set; }
        public object SubCategoryId { get; private set; }
        public object GenderId { get; private set; }
        public object CategoryId { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductImage();
                    BindProductDetails();
                }
            }
            else
            {
                Response.Redirect("~/ProductsView.aspx");
            }
        }


        private void BindProductImage()
        {
            // Check if "PID" is in the query string and is a valid number
            string pidQueryString = Request.QueryString["PID"];
            Int64 PID;

            if (!string.IsNullOrEmpty(pidQueryString) && Int64.TryParse(pidQueryString, out PID))
            {
                // Valid PID, proceed with database query
                using (SqlConnection con = new SqlConnection(CS))
                {
                    // Use parameterized query to prevent SQL Injection
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblProductImages WHERE PID = @PID", con))
                    {
                        // Define the parameter for the query
                        cmd.Parameters.AddWithValue("@PID", PID);

                        try
                        {
                            con.Open();  // Open the database connection

                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                DataTable dt = new DataTable();
                                sda.Fill(dt);

                                // Check if images exist for the product
                                if (dt.Rows.Count > 0)
                                {
                                    rptrImage.DataSource = dt;
                                    rptrImage.DataBind();
                                }
                                else
                                {
                                    // Handle the case where no images are found
                                    // For example, show a default image or a message
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle exceptions, e.g., log them
                            Console.WriteLine("Error: " + ex.Message);
                        }
                    }
                }
            }
            else
            {
                // Invalid or missing PID, handle the error (redirect or show a message)
                Response.Redirect("ErrorPage.aspx");
            }
        }



        private void BindProductDetails()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            using (SqlConnection con = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblProducts WHERE PID = @PID", con))
                {

                    cmd.Parameters.AddWithValue("@PID", PID);


                    con.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProductDetails.DataSource = dt;
                        rptrProductDetails.DataBind();
                    }
                }
            }
        }

        protected static string GetActiveImgClass(int ItemIndex)
        {
            // Ensure ItemIndex is a valid index, default to 0 for invalid values
            if (ItemIndex < 0)
            {
                return "";  // Return an empty string if the index is invalid
            }

            // Return 'active' for ItemIndex 0, otherwise return an empty string
            return (ItemIndex == 0) ? "active" : "";
        }

        protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
                string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;
                string SubCatID = (e.Item.FindControl("hfSubCatID") as HiddenField).Value;
                string GenderID = (e.Item.FindControl("hfGenderID") as HiddenField).Value;

                RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;

                try
                {
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblSizes WHERE BrandId = @BrandId and CatrgoryId = @CatrgoryId and SubCategoryId = @SubCategoryId and GenderId = @GenderId", con))
                        {
                            // Adding parameters to the query
                            cmd.Parameters.AddWithValue("@BrandId", BrandId);
                            cmd.Parameters.AddWithValue("@CatrgoryId", CatrgoryId); // Fixed the typo here
                            cmd.Parameters.AddWithValue("@SubCategoryId", SubCategoryId);
                            cmd.Parameters.AddWithValue("@GenderId", GenderId);

                            con.Open();

                            // Using SqlDataAdapter to fetch data
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                DataTable dt = new DataTable();

                                // Fill the DataTable with data from the database
                                int rowsAffected = sda.Fill(dt);

                                if (rowsAffected > 0)
                                {
                                    // Bind the data to the RadioButtonList
                                    rblSize.DataSource = dt;
                                    rblSize.DataTextField = "SizeName";  // Ensure this matches your database column name
                                    rblSize.DataValueField = "SizeId";   // Ensure this matches your database column name
                                    rblSize.DataBind();
                                }
                                else
                                {
                                    // Handle no results
                                    // For example, show a message or hide the RadioButtonList
                                    rblSize.Visible = false;
                                    Response.Write("No sizes found for the selected criteria.");
                                }
                            }
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    // Handle SQL exceptions, e.g., connection issues, query issues
                    Response.Write("Database error: " + sqlEx.Message);
                }
                catch (Exception ex)
                {
                    // Handle other exceptions
                    Response.Write("An error occurred: " + ex.Message);
                }


            }
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            string SelectedSize = string.Empty;
            foreach (RepeaterItem item in rptrProductDetails.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rbList = item.FindControl("rblSize") as RadioButtonList;
                    SelectedSize = rbList.SelectedValue;
                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "";
                }
            }

            if (SelectedSize != "")
            {
                Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
                if (Request.Cookies["CartPID"] != null)
                {
                    string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                    CookiePID = CookiePID + "," + PID + "-" + SelectedSize;
                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = CookiePID;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                else
                {
                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedSize;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                Response.Redirect("~/ProductView.aspx?PID=" + PID);
            }
            else
            {
                foreach (RepeaterItem item in rptrProductDetails.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        var lblError = item.FindControl("lblError") as Label;
                        lblError.Text = "Please select a size";
                    }
                }

            }
        }
        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }
    }
}
