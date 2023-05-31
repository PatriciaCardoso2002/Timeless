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
    public partial class EscolherSubscricao : Form
    {
        public class Subscricao
        {
            public string tiposubscricao { get; set; }

            public override string ToString()
            {
                return tiposubscricao;
            }
        }

        private SqlConnection CN;
        public EscolherSubscricao(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obter o tipo de subscrição selecionado
            Subscricao subscricaoSelecionada = comboBox1.SelectedItem as Subscricao;
            if (subscricaoSelecionada != null)
            {
                string tipoSubscricao = subscricaoSelecionada.tiposubscricao;

                // Fazer algo com o tipo de subscrição selecionado
                MessageBox.Show("Tipo de subscrição selecionado: " + tipoSubscricao);
            }
        }

        private void EscolherSubscricao_Load(object sender, EventArgs e)
        {
            // Preencher a comboBox1 com os tipos de subscrição disponíveis
            string query = "SELECT tiposubscricao FROM TIMELESS_SUBSCRICAO";

            if (CN.State == ConnectionState.Closed)
            {
                CN.Open();
            }

            using (SqlCommand command = new SqlCommand(query, CN))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Adicionar os tipos de subscrição na comboBox1
                        comboBox1.Items.Add(new Subscricao
                        {
                            tiposubscricao = reader.GetString(0)
                        });
                    }
                }
            }

            CN.Close();
        }



    }
}
