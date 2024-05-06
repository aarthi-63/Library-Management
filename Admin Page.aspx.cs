using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Admin_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                updatestatustable();
            }

            string loginuser =(string) Session["adminuser"];
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand retrieveuser = new SqlCommand("select username from Admin_Detail where username=@loginuser", con);
                retrieveuser.Parameters.AddWithValue("@loginuser", loginuser);
                uname.Text =(string) retrieveuser.ExecuteScalar();

                SqlCommand retrievefname = new SqlCommand("select afname from Admin_Detail where username=@loginuser", con);
                retrievefname.Parameters.AddWithValue("@loginuser", loginuser);
                fname.Text = (string)retrievefname.ExecuteScalar();

                SqlCommand retrievelname = new SqlCommand("select alname from Admin_Detail where username=@loginuser", con);
                retrievelname.Parameters.AddWithValue("@loginuser", loginuser);
                lname.Text = (string)retrievelname.ExecuteScalar();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //getting details from user.
            string bid = bookid.Text;
            string bname = bookname.Text;
            string arname = aname.Text;
            string cgry = DropDownList1.SelectedValue;
            string pcnt = pgcount.Text;
            string qy = qty.Text;
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                //checking wether all details are entered 
                if (bid.Length == 0 || bname.Length == 0 || arname.Length == 0 || cgry.Length == 0 )
                {
                    error.Text = "Enter all Required Value.";
                }
                else
                {
                    SqlCommand checkbid = new SqlCommand("select book_Id from book where book_Id=@bid", con);
                    checkbid.Parameters.AddWithValue("@bid", bid);
                    string chkid =(string) checkbid.ExecuteScalar();
                    //checking whether the book already present in the database.
                    if (bid==chkid)
                    {
                        error.Text = "The book with same ID already exist.";
                    }
                    else 
                    {
                        SqlCommand cmd = new SqlCommand();

                        //insert query
                        cmd.CommandText = "insert into book values(@bid,@bname,@arname,@cgry,@pcnt,@qy)";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@bid", bid);
                        cmd.Parameters.AddWithValue("@bname", bname);
                        cmd.Parameters.AddWithValue("@arname", arname);
                        cmd.Parameters.AddWithValue("@cgry", cgry);
                        cmd.Parameters.AddWithValue("@pcnt",Convert.ToInt32( pcnt));
                        cmd.Parameters.AddWithValue("@qy", Convert.ToInt32(qy));
                        int count = cmd.ExecuteNonQuery();
                        //result of insertion.
                        if (count > 0)
                        {
                            error.Text = ($"{count} row inserted successfully");
                        }
                        else
                        {
                            error.Text = ("Not inserted");
                        } 
                    }
                }
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {

            //getting all details from the user.
            string bid = bookid.Text;
            string bname = bookname.Text;
            string arname = aname.Text;
            string cgry = DropDownList1.SelectedValue;
            string pcnt = pgcount.Text;
            string qy = qty.Text;
            
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                if (bid.Length == 0 || bname.Length == 0 || arname.Length == 0 || cgry.Length == 0)
                {
                    error.Text = "Enter all Required Value to be updated.";
                }
                else
                {

                    //selecting book id that needs to be updated.
                    SqlCommand checkbid = new SqlCommand("select book_Id from book where book_Id=@bid", con);
                    checkbid.Parameters.AddWithValue("@bid", bid);
                    string chkid = (string)checkbid.ExecuteScalar();

                    //checking if the book exist.
                    if (bid == chkid)
                    {
                        SqlCommand cmd = new SqlCommand();

                        //update query
                        cmd.CommandText = "update book set book_Id=@bid,book_name=@bname,author_name=@arname,category=@cgry,page_count=@pcnt,qty=@qy where book_Id=@bid";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@bid", bid);
                        cmd.Parameters.AddWithValue("@bname", bname);
                        cmd.Parameters.AddWithValue("@arname", arname);
                        cmd.Parameters.AddWithValue("@cgry", cgry);
                        cmd.Parameters.AddWithValue("@pcnt",Convert.ToInt32( pcnt));
                        cmd.Parameters.AddWithValue("@qy", Convert.ToInt32(qy));
                        int count=cmd.ExecuteNonQuery();

                        //update result
                        if (count > 0)
                        {
                            error.Text = $"{count} row updated as per request.";
                        }
                        else
                        {
                            error.Text = "Not updated";
                        }
                    }
                    else
                    {
                        error.Text = "The book with given ID doesnot exist.";
                    }
                }
            }
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            
            //getting id from user.
            string bid = bookid.Text;
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {

                //checking wether the user entered the data.
                if (bid.Length == 0)
                {
                    error.Text = "Enter the book ID that needs to be deleted.";
                }
                else
                {
                    con.Open();
                    SqlCommand checkbid = new SqlCommand("select book_Id from book where book_Id=@bid", con);
                    checkbid.Parameters.AddWithValue("@bid", bid);
                    string chkid = (string)checkbid.ExecuteScalar();

                    //checking wether the book present in database.
                    if (bid == chkid)
                    {
                        SqlCommand cmd = new SqlCommand();

                        //delete query
                        cmd.CommandText = "delete from book where book_Id=@bid";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@bid", bid);
                        int count = cmd.ExecuteNonQuery();

                        //delete success
                        if (count > 0)
                        {
                            error.Text = $"{count} row deleted as per request.";
                        }
                        else
                        {
                            error.Text = "Not deleted.";
                        }
                    }
                    else
                    {
                        error.Text = "The given ID does not exist in the database.";
                    }
                }
            }
        }

        protected void select_Click(object sender, EventArgs e)
        {
            //getting id from user.
            string bid = bookid.Text;
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                //checking wether the user entered the data.
                if (bid.Length == 0)
                {
                    error.Text = "Enter the book ID that needs to be selected.";
                }
                else
                {
                    con.Open();
                    SqlCommand checkbid = new SqlCommand("select book_Id from book where book_Id=@bid", con);
                    checkbid.Parameters.AddWithValue("@bid", bid);
                    string chkid = (string)checkbid.ExecuteScalar();

                    //checking wether the book present in database.
                    if (bid == chkid)
                    {
                        SqlCommand cmd = new SqlCommand();

                        //select query
                        cmd.CommandText = "select * from book where book_Id=@bid";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@bid", bid);
                        SqlDataAdapter sd = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sd.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();                    }
                    else
                    {
                        error.Text = "The given ID does not exist in the database.";
                    }
                }
            }
        }

        void updatestatustable()
        {
            
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using(SqlConnection con=new SqlConnection(cs))
            {
                con.Open();

                //selecting rows whose status needs to be updated.
                SqlCommand updatestatus = new SqlCommand("select * from bookborrowed where status is null", con);
                SqlDataAdapter sd = new SqlDataAdapter(updatestatus);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //getting input from user
            string libid = lid.Text;
            string bookid = bid.Text;
            string status = DropDownList2.SelectedValue;
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                //query to update status
                SqlCommand updatestatus = new SqlCommand("update bookborrowed set status=@status where lib_ID=@libid and book_id=@bookid", con);
                updatestatus.Parameters.AddWithValue("@status", status);
                updatestatus.Parameters.AddWithValue("@libid", libid);
                updatestatus.Parameters.AddWithValue("@bookid", bookid);
                int count = updatestatus.ExecuteNonQuery();
                //status update success.
                if (count > 0)
                {
                    if (status == "Returned")
                    {

                        //retreiving qty of book from database.
                        SqlCommand qtyupdate = new SqlCommand("select qty from book where book_Id=@bookid", con);
                        qtyupdate.Parameters.AddWithValue("@bookid", bookid);
                        int bookqty =(int) qtyupdate.ExecuteScalar();

                        //increase qty of book as it is returned.
                        bookqty += 1;

                        //update the increased qty of book to database
                        SqlCommand insertqty = new SqlCommand("update book set qty=@bookqty where book_Id=@bookid", con);
                        insertqty.Parameters.AddWithValue("@bookid", bookid);
                        insertqty.Parameters.AddWithValue("@bookqty", bookqty);
                        insertqty.ExecuteNonQuery();
                    }
                    statusresult.Text = "Status for the requested book-ID updated.";
                    updatestatustable();
                }
                else
                {
                    statusresult.Text = "Status Not updated";
                }
            }
        }
    }
}