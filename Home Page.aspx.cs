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
    public partial class Home_Page : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BookborrowedDisplay();
            }

            string loginid = (string)Session["loginid"];
        string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using(SqlConnection con=new SqlConnection(cs))
            {
                con.Open();

                //retrieving user details from database.
                SqlCommand getid = new SqlCommand("select lib_ID from register where lib_ID=@id", con);
                getid.Parameters.AddWithValue("@id", loginid);
                SqlCommand getfname = new SqlCommand("select f_name from register where lib_ID=@id", con);
                getfname.Parameters.AddWithValue("@id", loginid);
                SqlCommand getlname = new SqlCommand("select l_name from register where lib_ID=@id", con);
                getlname.Parameters.AddWithValue("@id", loginid);
                SqlCommand getdes= new SqlCommand("select designation from register where lib_ID=@id", con);
                getdes.Parameters.AddWithValue("@id", loginid);
                SqlCommand getdept = new SqlCommand("select department from register where lib_ID=@id", con);
                getdept.Parameters.AddWithValue("@id", loginid);

                //execute user details in the webpage.
                id.Text=(string)getid.ExecuteScalar();
                fname.Text = (string)getfname.ExecuteScalar();
                lname.Text = (string)getlname.ExecuteScalar();
                designation.Text = (string)getdes.ExecuteScalar();
                dept.Text = (string)getdept.ExecuteScalar();
                
            }
        }


        protected void BookborrowedDisplay()
        {
            //display the borrowed book details by the individual user. 
            string loginid = (string)Session["loginid"];
            string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\AARTHI KRISHNAN\\OneDrive\\Desktop\\asp\\Library Management\\App_Data\\library_managementDetails.mdf\";Integrated Security=True";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from bookborrowed where lib_ID=@id",con);
                cmd.Parameters.AddWithValue("@id", loginid);
                SqlDataAdapter sd = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}