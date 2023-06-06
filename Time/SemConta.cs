using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;


namespace Time
{
    public partial class SemConta : Form
    {
        private SqlConnection CN;

        public SemConta(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void SemConta_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            CN.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO TIMELESS_CONTA VALUES (@nome, @apelido, @dataNascimento, @email, @palPasse, @progsFavoritos, @idFuncionario)", CN);
            cmd.Parameters.AddWithValue("@nome", textBox2.Text);
            cmd.Parameters.AddWithValue("@apelido", textBox3.Text);
            cmd.Parameters.AddWithValue("@dataNascimento", DateTime.ParseExact(textBox4.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture));
            cmd.Parameters.AddWithValue("@email", textBox5.Text);
            cmd.Parameters.AddWithValue("@palPasse", textBox6.Text);
            cmd.Parameters.AddWithValue("@progsFavoritos", DBNull.Value);
            cmd.Parameters.AddWithValue("@idFuncionario", int.Parse(textBox7.Text));
            cmd.ExecuteNonQuery();

            MessageBox.Show("Successfully created");

            MenuDepoisCriarConta frm = new MenuDepoisCriarConta(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }



        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
