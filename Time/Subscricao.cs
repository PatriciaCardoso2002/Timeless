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
    public partial class Subscricao : Form
    {
        private SqlConnection CN;
        public Subscricao(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void Subscricao_Load(object sender, EventArgs e)
        {

        }

        private int ObterIdConta(string nome)
        {
            int idConta = -1;

            try
            {
                // Abrir a conexão com o banco de dados
                CN.Open();

                // Criar o comando SQL para obter o ID da conta pelo nome
                SqlCommand command = new SqlCommand("SELECT idConta FROM TIMELESS_CONTA WHERE nome LIKE @nome", CN);
                command.Parameters.AddWithValue("@nome", "%" + nome + "%");

                // Executar o comando e obter o ID da conta
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    idConta = Convert.ToInt32(result);
                }
            }
            catch (Exception ex)
            {
                // Lidar com exceções
                MessageBox.Show("Erro: " + ex.Message);
            }
            finally
            {
                // Fechar a conexão com o banco de dados
                CN.Close();
            }

            return idConta;
        }

        private string ObterSubscricaoAssociadaConta(int idConta)
        {
            string subscricao = string.Empty;

            try
            {
                // Abrir a conexão com o banco de dados
                CN.Open();

                // Criar o comando SQL para chamar a UDF
                SqlCommand command = new SqlCommand("SELECT dbo.ObterSubscricaoAssociadaConta(@idConta)", CN);
                command.Parameters.AddWithValue("@idConta", idConta);

                // Executar o comando e obter a subscricao
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    subscricao = result.ToString();
                }
            }
            catch (Exception ex)
            {
                // Lidar com exceções
                MessageBox.Show("Erro: " + ex.Message);
            }
            finally
            {
                // Fechar a conexão com o banco de dados
                CN.Close();
            }

            return subscricao;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            string nomeConta = textBox1.Text; // Obtém o nome da conta do TextBox

            // Chamar o método para buscar o ID da conta
            int idConta = ObterIdConta(nomeConta);

            if (idConta != -1)
            {
                string subscricao = ObterSubscricaoAssociadaConta(idConta);

                DataTable dt = new DataTable();
                dt.Columns.Add("tiposubscricao");
                dt.Rows.Add(subscricao);

                dataGridView1.DataSource = dt;
            }
            else
            {
                MessageBox.Show("Conta não encontrada.");
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
