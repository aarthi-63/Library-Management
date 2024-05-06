using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //get user input
            string ufname = fname.Text;
            string ulname = lname.Text;
            string uid = lid.Text;
            string upwd = pwd.Text;

            //checking whether all input is given.
            if (ufname.Length == 0 || uid.Length == 0 || upwd.Length == 0)
            {
                result.Text = "Enter all required values.";
            }
            else
            {
                char checkfltr = Convert.ToChar(upwd.Substring(0, 1));
                string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select lib_ID from register where lib_ID=@id", con);
                    cmd.Parameters.AddWithValue("@id", uid);
                    string id = (string)cmd.ExecuteScalar();

                    //checking the existence of user.
                    if (uid == id)
                    {
                        result.Text = "ID already present in the database";
                    }
                    else
                    {

                        //checking the password to start with alphabets
                        if (Char.IsLetter(checkfltr) == true)
                        {

                            //password length
                            if (upwd.Length >= 8)
                            {
                                SqlCommand execmd = new SqlCommand();
                                execmd.CommandText = "insert into register values(@id,@fname,@lname,@pwd)";
                                execmd.Connection = con;
                                execmd.Parameters.AddWithValue("@id", uid);
                                execmd.Parameters.AddWithValue("@fname", ufname);
                                execmd.Parameters.AddWithValue("@lname", ulname);
                                execmd.Parameters.AddWithValue("@pwd", upwd);
                                int exe = execmd.ExecuteNonQuery();
                                Response.Redirect("Login Page.aspx");
                            }
                            else
                            {
                                result.Text = "Password should be greater than 8";
                            }
                        }
                        else
                        {
                            result.Text = "Pasword should start with alphabet";
                        }
                    }
                }
            }
        }
    }
}