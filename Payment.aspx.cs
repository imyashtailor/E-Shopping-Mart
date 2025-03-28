using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace E_shopping_Website
{
    public partial class Payment : System.Web.UI.Page
    {
        public int PID;
        public string SizeId;
        public static string CS = ConfigurationManager.ConnectionStrings["ShoppingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    BindPriceData();
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        private void BindPriceData()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');

                if (CookieDataArray.Length > 0)
                {
                    DataTable dtBrands = new DataTable();
                    Int64 CartTotal = 0;
                    Int64 Total = 0;

                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        SizeId = CookieDataArray[i].ToString().Split('-')[1];

                        if (hdPidSizeId.Value != null && hdPidSizeId.Value != "")
                        {
                            hdPidSizeId.Value += "," + PID + "-" + SizeId;
                        }
                        else
                        {
                            hdPidSizeId.Value = PID + "-" + SizeId;
                        }

                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            con.Open();
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
                            using (SqlCommand cmd = new SqlCommand(
                                @"
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
                                cmd.Parameters.AddWithValue("@SizeId", SizeIdInt);

                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dtBrands);
                                }
                            }
                        }

                        if (dtBrands.Rows.Count > 0)
                        {
                            CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                            Total += Convert.ToInt64(dtBrands.Rows[i]["PSellPrice"]);
                        }
                    }

                    divPriceDetails.Visible = true;
                    spanCartTotal.InnerText = CartTotal.ToString();
                    spanTotal.InnerText = "Rs. " + Total.ToString();
                    spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

                    hdCartAmount.Value = CartTotal.ToString();
                    hdCartDiscount.Value = (CartTotal - Total).ToString();
                    hdTotalPayed.Value = Total.ToString();
                }
                else
                {
                    Response.Redirect("~/ProductsView.aspx");
                }
            }
        }

        protected void btnPaytm_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string EMAILID = Session["USEREMAIL"].ToString();
                string PaymentType = "Paytm";
                string PaymentStatus = "NotPaid";

                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(
                        "INSERT INTO tblPurchase (UserID, PidSizeId, CartAmount, CartDiscount, TotalPayed, PaymentType, PaymentStatus, Name, Address, PinCode, MobileNumber) " +
                        "VALUES (@UserID, @PidSizeId, @CartAmount, @CartDiscount, @TotalPayed, @PaymentType, @PaymentStatus, @Name, @Address, @PinCode, @MobileNumber); " +
                        "SELECT SCOPE_IDENTITY();", con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", USERID);
                        cmd.Parameters.AddWithValue("@PidSizeId", hdPidSizeId.Value);
                        cmd.Parameters.AddWithValue("@CartAmount", hdCartAmount.Value);
                        cmd.Parameters.AddWithValue("@CartDiscount", hdCartDiscount.Value);
                        cmd.Parameters.AddWithValue("@TotalPayed", hdTotalPayed.Value);
                        cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                        cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@PinCode", txtPinCode.Text);
                        cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);

                        long PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                    }
                }

            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Ensure that the session contains the required user information
            if (Session["Username"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string EMAILID = Session["USEREMAIL"].ToString();
                string PaymentType = "Cash on Delivery";  // Assuming the default payment is Cash on Delivery
                string PaymentStatus = "Paid";  // Set initial payment status to "NotPaid"

                // Prepare other necessary details
                string Name = txtName.Text;
                string Address = txtAddress.Text;
                string PinCode = txtPinCode.Text;
                string MobileNumber = txtMobileNumber.Text;

                // Check if cart has items
                if (hdPidSizeId.Value != "")
                {
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        con.Open();

                        // SQL Query to insert order into tblOrders
                        using (SqlCommand cmd = new SqlCommand(
                            "INSERT INTO tblOrders (UserID, PidSizeId, CartAmount, CartDiscount, TotalPayed, PaymentType, PaymentStatus, PurchaseDate, Name, Address, PinCode, MobileNumber, OrderStatus) " +
                            "VALUES (@UserID, @PidSizeId, @CartAmount, @CartDiscount, @TotalPayed, @PaymentType, @PaymentStatus, GETDATE(), @Name, @Address, @PinCode, @MobileNumber, @OrderStatus); " +
                            "SELECT SCOPE_IDENTITY();", con))
                        {
                            // Add parameters to the query
                            cmd.Parameters.AddWithValue("@UserID", USERID);
                            cmd.Parameters.AddWithValue("@PidSizeId", hdPidSizeId.Value);
                            cmd.Parameters.AddWithValue("@CartAmount", hdCartAmount.Value);
                            cmd.Parameters.AddWithValue("@CartDiscount", hdCartDiscount.Value);
                            cmd.Parameters.AddWithValue("@TotalPayed", hdTotalPayed.Value);
                            cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                            cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                            cmd.Parameters.AddWithValue("@Name", Name);
                            cmd.Parameters.AddWithValue("@Address", Address);
                            cmd.Parameters.AddWithValue("@PinCode", PinCode);
                            cmd.Parameters.AddWithValue("@MobileNumber", MobileNumber);
                            cmd.Parameters.AddWithValue("@OrderStatus", "Delivered");  // Initial order status is "Pending"

                            // Execute the query and get the OrderID
                            long OrderID = Convert.ToInt64(cmd.ExecuteScalar());

                            // If insert is successful, show success message
                            lblOrderStatus.Visible = true;
                            lblOrderStatus.Text = "Order placed successfully!";
                        }
                    }
                }
                else
                {
                    // No items in the cart
                    lblOrderStatus.Visible = true;
                    lblOrderStatus.Text = "No items in the cart to place the order!";
                }
            }
            else
            {
                // If session is invalid or user is not logged in, redirect to Login page
                Response.Redirect("~/Login.aspx");
            }
        }

    }
}
