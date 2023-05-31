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
    public partial class Pagamento : Form
    {
        public class MetodoPagamento
        {
            public int Id { get; set; }
            public string Descricao { get; set; }

            public override string ToString()
            {
                return Descricao;
            }
        }

        private SqlConnection CN;
        public Pagamento(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Verificar se um método de pagamento foi selecionado
            if (comboBox1.SelectedItem == null)
            {
                MessageBox.Show("Selecione um método de pagamento.", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Recuperar o método de pagamento selecionado
            MetodoPagamento metodoPagamento = (MetodoPagamento)comboBox1.SelectedItem;

            // Recuperar os valores das textboxes
            int idConta = int.Parse(textBox1.Text);
            int valorPago = int.Parse(textBox2.Text);
            DateTime dataPagamento = DateTime.Parse(textBox3.Text);

            CN.Open(); // Abrir a conexão antes de executar o comando

            // Realizar o pagamento
            string insertQuery = "INSERT INTO TIMELESS_PAGAMENTO (idCliente, valorPago, dataPagamento, metodoId) " +
                                 "VALUES (@idCliente, @valorPago, @dataPagamento, @metodoId)";
            using (SqlCommand insertCommand = new SqlCommand(insertQuery, CN))
            {
                insertCommand.Parameters.AddWithValue("@idCliente", idConta);
                insertCommand.Parameters.AddWithValue("@valorPago", valorPago);
                insertCommand.Parameters.AddWithValue("@dataPagamento", dataPagamento);
                insertCommand.Parameters.AddWithValue("@metodoId", metodoPagamento.Id);

                insertCommand.ExecuteNonQuery();

                MessageBox.Show("Pagamento efetuado com sucesso.", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            CN.Close(); // Fechar a conexão após concluir a operação
        }


        private void Pagamento_Load(object sender, EventArgs e)
        {
            // Preencher a comboBox1 com os métodos de pagamento disponíveis
            string query = "SELECT id, descricao FROM TIMELESS_METODOPAGAMENTO";
            using (SqlCommand command = new SqlCommand(query, CN))
            {
                CN.Open(); // Abrir a conexão antes de executar o comando

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Adicionar os métodos de pagamento na comboBox1
                        comboBox1.Items.Add(new MetodoPagamento
                        {
                            Id = reader.GetInt32(0),
                            Descricao = reader.GetString(1)
                        });
                    }
                }

                CN.Close(); // Fechar a conexão após concluir a operação
            }
        }

    }
}
