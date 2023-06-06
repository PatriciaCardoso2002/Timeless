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

namespace Time
{
    public partial class GestaoContas : Form
    {
        private SqlConnection CN;

        public GestaoContas(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();  // Limpa a listBox1 antes de preenchê-la novamente

            if (!string.IsNullOrEmpty(textBox1.Text))
            {
                int idFuncionario = int.Parse(textBox1.Text);

                string query = "SELECT c.nome FROM TIMELESS_CONTA c " +
                               "INNER JOIN TIMELESS_FUNCIONARIO f ON c.idFuncionario = f.idFuncionario " +
                               "WHERE f.idFuncionario = @idFuncionario";

                using (SqlCommand command = new SqlCommand(query, CN))
                {
                    command.Parameters.AddWithValue("@idFuncionario", idFuncionario);

                    try
                    {
                        CN.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            string nomeConta = reader["nome"].ToString();
                            listBox1.Items.Add(nomeConta);
                        }

                        reader.Close();
                    }
                    catch (SqlException ex)
                    {
                        // Trate a exceção adequadamente
                    }
                    finally
                    {
                        CN.Close();
                    }
                }
            }
            else
            {
                MessageBox.Show("Insira um ID de funcionário válido.");
            }
        }

        private void GestaoContas_Load(object sender, EventArgs e)
        {

        }
    }
}
