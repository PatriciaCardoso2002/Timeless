using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Time
{
    public partial class Form2 : Form
    {
        private SqlConnection CN;

        public Form2(SqlConnection connection)
        {
            CN = connection; // Atribui a conexão recebida ao CN no Form2
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
            SqlCommand cmd = new SqlCommand("insert into TIMELESS_CONTA_PROGRAMA values (@idConta,@idPrograma)", CN);
            CN.Open();
            cmd.Parameters.AddWithValue("@idConta", int.Parse(textBox1.Text));
            cmd.Parameters.AddWithValue("@idPrograma", int.Parse(textBox3.Text));
            cmd.ExecuteNonQuery();
            CN.Close();
            MessageBox.Show("Successfully Saved");
        

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
