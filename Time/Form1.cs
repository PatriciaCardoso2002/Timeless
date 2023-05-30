using System.Data.SqlClient;
using System.Data;

namespace Time
{
    public partial class Form1 : Form
    {
        private SqlConnection CN; // Declaração da variável de conexão

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            TestDBConnection(textBox1.Text, textBox3.Text, textBox3.Text, textBox2.Text);

            Form2 frm = new Form2(CN);
            //1 modeless dialog, Show()
            frm.Show();


        }
        private void TestDBConnection(string dbServer, string dbName, string userName, string userPass)
        {
            CN = new SqlConnection("Data Source=" + dbServer + ";"
                                    + "Initial Catalog=" + dbName + ";uid=" + userName + ";" + "password=" + userPass);
            try
            {
                CN.Open();
                if (CN.State == ConnectionState.Open)
                {
                    MessageBox.Show("Successful connection to database " + CN.Database + " on the "
                                    + CN.DataSource + " server", "Connection Test", MessageBoxButtons.OK);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to open connection to database due to the error:\r\n" +
                                ex.Message, "Connection Test", MessageBoxButtons.OK);
            }
            if (CN.State == ConnectionState.Open)
                CN.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}