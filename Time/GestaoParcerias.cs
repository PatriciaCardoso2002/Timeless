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
    public partial class GestaoParcerias : Form
    {
        private SqlConnection CN;
        public GestaoParcerias(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private int ObterIdFuncionario(string nomeFuncionario)
        {
            int idFuncionario = -1;

            try
            {
                // Abrir a conexão com o banco de dados
                CN.Open();

                // Criar o comando SQL para obter o ID do funcionário pelo nome
                SqlCommand command = new SqlCommand("SELECT idFuncionario FROM TIMELESS_FUNCIONARIO WHERE nome = @nomeFuncionario", CN);
                command.Parameters.AddWithValue("@nomeFuncionario", nomeFuncionario);

                // Executar o comando e obter o ID do funcionário
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    idFuncionario = Convert.ToInt32(result);
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

            return idFuncionario;
        }
        private DataTable ObterTodasParceriasNegociadasFuncionario(int idFuncionario)
        {
            DataTable result = new DataTable();

            try
            {
                // Abrir a conexão com o banco de dados
                CN.Open();

                // Criar o comando SQL para chamar a UDF
                SqlCommand command = new SqlCommand("SELECT * FROM dbo.ObterTodasParceriasNegociadasFuncionario(@idFuncionario)", CN);
                command.Parameters.AddWithValue("@idFuncionario", idFuncionario);

                // Executar o comando e obter os resultados em um SqlDataReader
                SqlDataReader reader = command.ExecuteReader();

                // Carregar os resultados no DataTable
                result.Load(reader);

                // Fechar o SqlDataReader
                reader.Close();
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

            return result;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string nomeFuncionario = textBox1.Text; // Obtém o nome do funcionário do TextBox

            // Chamar o método para buscar o ID do funcionário
            int idFuncionario = ObterIdFuncionario(nomeFuncionario);

            if (idFuncionario != -1)
            {
                // Chamar o método para obter as parcerias do funcionário
                DataTable result = ObterTodasParceriasNegociadasFuncionario(idFuncionario);

                // Exibir os resultados na DataGridView
                dataGridView1.DataSource = result;
            }
            else
            {
                MessageBox.Show("Funcionário não encontrado.");
            }
        }
    }
}
