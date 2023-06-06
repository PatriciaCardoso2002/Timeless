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
    public partial class VerificarExistenciaConta : Form
    {
        private SqlConnection CN;

        public VerificarExistenciaConta(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void VerificarExistenciaConta_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string nomeConta = textBox1.Text.Trim();

            if (!string.IsNullOrEmpty(nomeConta))
            {
                CN.Open();

                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM TIMELESS_CONTA WHERE nome = @nomeConta", CN))
                {
                    command.Parameters.AddWithValue("@nomeConta", nomeConta);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        // Redirecionar para a tela ComConta
                        ComConta comContaForm = new ComConta(CN);
                        comContaForm.Show();
                    }
                    else
                    {
                        // Redirecionar para a tela SemConta
                        SemConta semContaForm = new SemConta(CN);
                        semContaForm.Show();
                    }
                }

                CN.Close();
            }
        }
    }
}
