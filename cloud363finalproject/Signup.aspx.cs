using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cloud363finalproject
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //SqlConnection con = new SqlConnection("Data Source=cognitivedatabase.database.windows.net;Initial Catalog=cognitiveDatabase;User ID=tolga;Password=***********");
        

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=cognitivedatabase2.database.windows.net;Initial Catalog=cognitiveDatabase;User ID=cloud363-database;Password=Turan190708");
            if (txtPassword.Text == txtConfirmPassword.Text && (txtUsername.Text.Length > 0))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"insert into [person] (username,psw) values(@username, @password)", con);
                cmd.Parameters.AddWithValue("username", txtUsername.Text);
                cmd.Parameters.AddWithValue("password", txtPassword.Text);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("Login.aspx");
               
            }
            

        }
    }
}