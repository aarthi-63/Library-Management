using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void display_Click(object sender, EventArgs e)
        {
            string selectcategory = DropDownList1.SelectedValue;
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using(SqlConnection con=new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from book where category=@selectcategory", con);
                cmd.Parameters.AddWithValue("@selectcategory", selectcategory);
                SqlDataAdapter sd = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string loginid =(string) Session["loginid"];
            string bid = bookid.Text;
            string fromdate = fdate.Text;
            string todate = tdate.Text;
            
            //checking whether all input is given
            if (bid.Length == 0 || fromdate.Length == 0 || todate.Length == 0)
            {
                error.Text = "Enter all required values";
            }
            else
            {
                string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand bidcheck = new SqlCommand("select book_Id from book where book_Id=@bid",con);
                    bidcheck.Parameters.AddWithValue("@bid", bid);
                    string checkbid =(string) bidcheck.ExecuteScalar();

                    //checking whether given input is present in the database.
                    if (bid == checkbid)
                    {
                        //checking date length  
                        if(fromdate.Length==10 && todate.Length == 10) 
                        { 
                        char fycheck = fromdate[4];
                        char tycheck = todate[4];
                        char fdcheck = fromdate[2];
                        char tdcheck = todate[2];

                            //checking date year format.
                            if (Char.IsDigit(fycheck)!=true && Char.IsDigit(tycheck)!=true && Char.IsDigit(fdcheck) == true && Char.IsDigit(fdcheck) == true)
                        {
                                //query selecting book of staus-updated 
                                SqlCommand statusupdate = new SqlCommand("select book_id from bookborrowed where lib_ID=@loginid and book_id=@bid and status is null", con);
                                statusupdate.Parameters.AddWithValue("@loginid", loginid);
                                statusupdate.Parameters.AddWithValue("@bid", bid);
                                string statusupdatecheck = (string)statusupdate.ExecuteScalar();

                                //query to select the book that is not returned
                                SqlCommand checkbexist = new SqlCommand("select book_id from bookborrowed where lib_ID=@loginid and book_id=@bid and status='Not Returned'", con);
                                checkbexist.Parameters.AddWithValue("@loginid", loginid);
                                checkbexist.Parameters.AddWithValue("@bid", bid);
                                string bookexist = (string)checkbexist.ExecuteScalar();

                                //query to select the quantity of the book.
                                SqlCommand qtycheck = new SqlCommand("select qty from book where book_Id=@bid", con);
                                qtycheck.Parameters.AddWithValue("@bid", bid);
                                int compareqty=(int) qtycheck.ExecuteScalar();
                                
                                //quantity check present in the database
                                if (compareqty > 0)
                                {

                                    //checking the null status of the book.
                                    if (bid != statusupdatecheck)
                                    {
                                        //request for borrow book.
                                        if (bid != bookexist)
                                        {
                                            //insert bookdetails that have been borrowed
                                            SqlCommand cmd = new SqlCommand("insert into bookborrowed(lib_ID,book_id,borrow_date,return_date) values(@loginid,@bid,@fromdate,@todate)", con);
                                            cmd.Parameters.AddWithValue("@loginid", loginid);
                                            cmd.Parameters.AddWithValue("@bid", bid);
                                            cmd.Parameters.AddWithValue("@fromdate", fromdate);
                                            cmd.Parameters.AddWithValue("@todate", todate);
                                            int count = cmd.ExecuteNonQuery();

                                            //to reduce the count of book already available in the database bcoz it is borrowed
                                            if (count > 0)
                                            {
                                                compareqty -= 1;
                                                //update the quantity of book as it is been borrowed.
                                                SqlCommand updateqty = new SqlCommand("update book set qty=@qtycom where book_Id=@bid", con);
                                                updateqty.Parameters.AddWithValue("@qtycom", compareqty);
                                                updateqty.Parameters.AddWithValue("@bid", bid);
                                                int qtyupdate=updateqty.ExecuteNonQuery();
                                                //Quantity update success.
                                                if (qtyupdate > 0)
                                                {
                                                    error.Text = $"{count} book with ID={bid} borrowed by {loginid}";
                                                }
                                                else
                                                {
                                                    error.Text = "Insertion not completed";
                                                }
                                            }
                                            else
                                            {
                                                error.Text = "Insertion not completed";
                                            }
                                        }
                                        else
                                        {
                                            error.Text = "This book have already been taken by you and not been returned.";
                                        }
                                    }
                                    else
                                    {
                                        error.Text = "The status for this borrowed book have not been still updated.";
                                    }
                                }
                                else
                                {
                                    error.Text = "The requested book is not available at present.Check later for availability";
                                }
                        }
                        else
                        {
                            error.Text = "The correct date format is YYYY-MM-DD year";
                        }
                        }
                        else
                        {
                            error.Text = "The correct date format is YYYY-MM-DD length";
                        }
                    }
                    else
                    {
                        error.Text = "The book does not exist in the database.";
                    }
                }
            }
        }
    }
}