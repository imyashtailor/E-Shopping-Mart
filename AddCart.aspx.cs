using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;
using System.Collections.Generic;
using System.Linq;

namespace E_shopping_Website
{
    public partial class AddCart : System.Web.UI.Page
    {
        public int PID;
        public string SizeId;
        public static string CS = ConfigurationManager.ConnectionStrings["ShoppingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductCart();
            }
        }

        private void BindProductCart()
        {
            // Check if the "CartPID" cookie exists
            if (Request.Cookies["CartPID"] != null)
            {
                DataTable dt = new DataTable();

                // Extract the cookie value and split it into an array of product and size information
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');

                // Set the cart item count in the label
                h4Noitems.InnerText = "My Cart(" + CookieDataArray.Length + ") items";
                Int64 CartTotal = 0;
                Int64 Total = 0;
                // Loop through the cookie data to fetch product details from the database
                foreach (string item in CookieDataArray)
                {
                    string PID = item.Split('-')[0];  // Extract Product ID from the cookie
                    string SizeId = item.Split('-')[1];  // Extract Size ID from the cookie

                    // Initialize the connection and command for SQL query
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        // Map size labels to their corresponding integer IDs
                        int SizeIdInt = 0; // Default or fallback value

                        // Map the string size labels to integers
                        // Map the string size labels to integers
                        switch (SizeId)
                        {
                            case "S":
                                SizeIdInt = 1;  // 'S' maps to SizeId = 1
                                break;
                            case "M":
                                SizeIdInt = 2;  // 'M' maps to SizeId = 2
                                break;
                            case "L":
                                SizeIdInt = 3;  // 'L' maps to SizeId = 3
                                break;
                            case "XL":
                                SizeIdInt = 4;  // 'XL' maps to SizeId = 4
                                break;
                            //case "XXL":
                            //    SizeIdInt = 5;  // 'XXL' maps to SizeId = 5
                            //    break;
                            // Add more mappings as needed
                            default:
                                // Handle any unexpected size values or throw an error
                                SizeIdInt = -1;  // Default or invalid size
                                break;
                        }
                        using (SqlCommand cmd = new SqlCommand(@"
                                    SELECT A.*, 
                                           dbo.getsizeName(@SizeId) AS SizeNamee, 
                                           @SizeId AS SizeIDD, 
                                           SizeData.Name, 
                                           SizeData.Extension 
                                    FROM tblProducts A
                                    CROSS APPLY (SELECT TOP 1 B.Name, B.Extension 
                                                FROM tblProductImages B 
                                                WHERE B.PID = A.PID) SizeData
                                    WHERE A.PID = @PID", con))
                        {
                            cmd.Parameters.AddWithValue("@PID", PID);
                            cmd.Parameters.AddWithValue("@SizeId", SizeIdInt);  // Pass the integer SizeId to the function

                            con.Open();

                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                sda.Fill(dt);
                            }
                        }

                    }

                    CartTotal += Convert.ToInt64(dt.Rows[0]["PPrice"]);
                    Total += Convert.ToInt64(dt.Rows[0]["PSellPrice"]);
                }

                // Bind the final accumulated DataTable to the Repeater
                rptrcartproducts.DataSource = dt;
                rptrcartproducts.DataBind();
                divpricedetails.Visible = true;
                spanCartTotal.InnerText = CartTotal.ToString();
                spanTotal.InnerText = "Rs. " + Total.ToString();
                spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();
            }
            else
            {
                // Handle empty cart or no cookies scenario if necessary
                h4Noitems.InnerText = "Your cart is empty.";
                divpricedetails.Visible = false;
            }
        }

        protected void btnRemoveCart_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];

                Button btn = (Button)(sender);
                string PIDSIZE = btn.CommandArgument;

                // Create a list of PID-Size combinations
                List<string> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();

                // Remove the specified product from the list
                if (CookiePIDList.Contains(PIDSIZE))
                {
                    CookiePIDList.Remove(PIDSIZE);
                }

                // Rebuild the cookie value with updated product list
                string CookiePIDUpdated = string.Join(",", CookiePIDList);

                if (string.IsNullOrEmpty(CookiePIDUpdated))
                {
                    // If the list is empty, remove the cookie
                    HttpCookie CartProducts = Request.Cookies["CartPID"];
                    CartProducts.Values["CartPID"] = null;
                    CartProducts.Expires = DateTime.Now.AddDays(-1);  // Set to expired date
                    Response.Cookies.Add(CartProducts);  // Add the expired cookie to the response
                }
                else
                {
                    // Otherwise, update the cookie with the new value
                    HttpCookie CartProducts = Request.Cookies["CartPID"];
                    CartProducts.Values["CartPID"] = CookiePIDUpdated;
                    CartProducts.Expires = DateTime.Now.AddDays(30);  // Set expiration for 30 days
                    Response.Cookies.Add(CartProducts);  // Add the updated cookie to the response
                }

                // Redirect the user to the cart page (or refresh it)
                Response.Redirect("~/AddCart.aspx");
            }
            else
            {
                // If the cookie doesn't exist, you can handle this case
                Response.Redirect("~/ProductsView.aspx");
            }
        }


        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
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
