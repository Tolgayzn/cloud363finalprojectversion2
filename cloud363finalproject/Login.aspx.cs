using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; // Namespace for ConfigurationManager
using System.Threading.Tasks; // Namespace for Task
using Microsoft.Azure.ServiceBus;
using System; // Namespace for Console output
using System.Configuration; // Namespace for ConfigurationManager
using System.Threading.Tasks; // Namespace for Task
using System.Windows.Forms;
using Azure.Storage.Queues.Models;

namespace cloud363finalproject
{
    public partial class Login : System.Web.UI.Page
    {

        //-------------------------------------------------
        // Create the queue service client
        //-------------------------------------------------
        public void CreateQueueClient(string queueName) //depolama işlemcisi oluşturma
        {
            // Get the connection string from app settings
            string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

            // Instantiate a QueueClient which will be used to create and manipulate the queue
            Azure.Storage.Queues.QueueClient queueClient = new Azure.Storage.Queues.QueueClient(connectionString, queueName);
        }

        //-------------------------------------------------
        // Create a message queue
        //-------------------------------------------------
        public bool CreateQueue(string queueName) //kuyruk oluşturma
        {
            try
            {
                // Get the connection string from app settings
                string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

                // Instantiate a QueueClient which will be used to create and manipulate the queue
                Azure.Storage.Queues.QueueClient queueClient = new Azure.Storage.Queues.QueueClient(connectionString, queueName);

                // Create the queue
                queueClient.CreateIfNotExists();

                if (queueClient.Exists())
                {
            
                    return true;
                }
                else
                {
                   
                    return false;
                }
            }
            catch (Exception ex)
            {
                
                return false;
            }
        }
        //-------------------------------------------------
        // Insert a message into a queue
        //-------------------------------------------------
        public void InsertMessage(string queueName, string message) //Sıraya ileti ekleme
        {
            // Get the connection string from app settings
            string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

            // Instantiate a QueueClient which will be used to create and manipulate the queue
            Azure.Storage.Queues.QueueClient queueClient = new Azure.Storage.Queues.QueueClient(connectionString, queueName);

            // Create the queue if it doesn't already exist
            queueClient.CreateIfNotExists();

            if (queueClient.Exists())
            {
                // Send a message to the queue
                queueClient.SendMessage(message);
            }
        }
        //-------------------------------------------------
        // Peek at a message in the queue
        //-------------------------------------------------
        public void PeekMessage(string queueName) //Sonraki iletiye göz atma
        {
            // Get the connection string from app settings
            string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

            // Instantiate a QueueClient which will be used to manipulate the queue
            Azure.Storage.Queues.QueueClient queueClient = new Azure.Storage.Queues.QueueClient(connectionString, queueName);

            if (queueClient.Exists())
            {
                // Peek at the next message
                PeekedMessage[] peekedMessage = queueClient.PeekMessages();

                // Display the message
                MessageBox.Show($"Peeked message: '{peekedMessage[0].Body}'");
            }


        }

        //-------------------------------------------------
        // Update an existing message in the queue
        //-------------------------------------------------
        public void UpdateMessage(string queueName) // Sıraya alınan iletinin içeriğini değiştirme.
        {
            // Get the connection string from app settings
            string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

            // Instantiate a QueueClient which will be used to manipulate the queue
            Azure.Storage.Queues.QueueClient queueClient = new Azure.Storage.Queues.QueueClient(connectionString, queueName);

            if (queueClient.Exists())
            {
                // Get the message from the queue
                QueueMessage[] message = queueClient.ReceiveMessages();

                // Update the message contents
                queueClient.UpdateMessage(message[0].MessageId,
                        message[0].PopReceipt,
                        "Updated contents",
                        TimeSpan.FromSeconds(60.0)  // Make it invisible for another 60 seconds
                    );
            }
        }

        //-------------------------------------------------
        // Process and remove a message from the queue
        //-------------------------------------------------
        public void DequeueMessage(string queueName) //sonraki iletiyi geri gönderme.
        {
            // Get the connection string from app settings
            string connectionString = ConfigurationManager.AppSettings["StorageConnectionString"];

            // Instantiate a QueueClient which will be used to manipulate the queue
            Azure.Storage.Queues.QueueClient queueClient = new Azure.Storage.Queues.QueueClient(connectionString, queueName);

            if (queueClient.Exists())
            {
                // Get the next message
                QueueMessage[] retrievedMessage = queueClient.ReceiveMessages();

                // Process (i.e. print) the message in less than 30 seconds
                MessageBox.Show($"Dequeued message: '{retrievedMessage[0].Body}'");

                // Delete the message
                queueClient.DeleteMessage(retrievedMessage[0].MessageId, retrievedMessage[0].PopReceipt);
            }
        }
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            CreateQueue("que1");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            InsertMessage("que1", TextBox1.Text);
        }
    }
}