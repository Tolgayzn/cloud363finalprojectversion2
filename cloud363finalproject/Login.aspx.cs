using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cloud363finalproject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=cognitivedatabase.database.windows.net;Initial Catalog=cognitiveDatabase;User ID=tolga;Password=Turan190708");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [person] where username='" + txtUsername.Text + "' and psw='" + txtPassword.Text + "'", con);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {

                Response.Redirect("Default.aspx");

            }
            else
            {
                

            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
    }
}