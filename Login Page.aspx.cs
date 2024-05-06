using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                checkstatusresult();
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            string userid = id.Text;
            string userpwd = upwd.Text;
            Session["loginid"] = userid;  
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";

            //checking whether all the inputs are given.
            if (userid.Length != 0 && userpwd.Length != 0)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand checkid = new SqlCommand("select lib_ID from register where lib_ID=@userid", con);
                    checkid.Parameters.AddWithValue("@userid", userid);
                    string tocheckid = (string)checkid.ExecuteScalar();

                    //checking the existence of user(ID)
                    if (userid == tocheckid)
                    {
                        SqlCommand checkpwd = new SqlCommand("select password from register where lib_ID=@userid", con);
                        checkpwd.Parameters.AddWithValue("@userid", userid);
                        string tocheckpwd = (string)checkpwd.ExecuteScalar();
                        {

                            //checking the correct password
                            if (userpwd == tocheckpwd)
                            {
                                Response.Redirect("Home Page.aspx");
                            }
                            else
                            {
                                error.Text = "Enter correct password.";
                            }
                        }
                    }
                    else
                    {
                        error.Text = "The given id doesn't exist in the database.";
                    }
                }
            }
            else
            {
                error.Text = "Enter the required value";
            }
        }


        protected void reg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void login0_Click(object sender, EventArgs e)
        {
            //getting user input.
            string adminuserid = aid.Text;
            string adminpwd = apwd.Text;
            Session["adminuser"] = adminuserid;
            if(adminuserid.Length>0 && adminpwd.Length > 0)
            {
                string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    //quert to select username
                    SqlCommand idcheck = new SqlCommand("select username from Admin_Detail where username=@adminuserid", con);
                    idcheck.Parameters.AddWithValue("@adminuserid", adminuserid);
                    string checkadminid =(string) idcheck.ExecuteScalar();
                    error0.Text = checkadminid;
                    //quert to select password.
                    SqlCommand pwdcheck = new SqlCommand("select apassword from Admin_Detail where username=@adminuserid", con);
                    pwdcheck.Parameters.AddWithValue("@adminuserid", adminuserid);
                    string checkapwd = (string)pwdcheck.ExecuteScalar();
                    error1.Text = checkapwd;
                    //checking wether the username present with database value
                    if (adminuserid == checkadminid)
                    {

                        //checking wether the password matches with the respective username
                        if (adminpwd == checkapwd)
                        {
                            Response.Redirect("Admin Page.aspx");
                        }
                        else
                        {
                            aerror.Text = "Wrong Password";
                        }
                    }
                    else
                    {
                        aerror.Text = "The admin with given username doesnot exist";
                    }
                }
            }
            else
            {
                aerror.Text = "Enter all required values.";
            }
            
        }
        void checkstatusresult()
        {

            //The number to book-status needs to be updated by the admin.
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand checkstatus = new SqlCommand("select count(*) from bookborrowed where status is null;", con);
                int count = (int)checkstatus.ExecuteScalar();
                if (count > 0)
                {
                    statusresult.Text = $"[ '{count}' book-status needs to be updated. ]";
                }
                else
                {
                    statusresult.Text = "All book status are updated.";
                }
            }
        }
    }
}