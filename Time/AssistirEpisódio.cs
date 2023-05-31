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
    public partial class AssistirEpisódio : Form
    {
        private SqlConnection CN;
        public AssistirEpisódio(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void AssistirEpisódio_Load(object sender, EventArgs e)
        {
            // Consulta SQL para obter todos os episódios
            string query = "SELECT titulo FROM TIMELESS_EPISODIO";

            using (SqlCommand command = new SqlCommand(query, CN))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Limpa a listBox1
                listBox1.Items.Clear();

                // Adiciona os títulos dos episódios na listBox1
                foreach (DataRow row in dt.Rows)
                {
                    listBox1.Items.Add(row["titulo"].ToString());
                }
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Verifica se algum episódio está selecionado
            if (listBox1.SelectedIndex >= 0)
            {
                // Obtém o título do episódio selecionado
                string episodioSelecionado = listBox1.SelectedItem.ToString();

                // Exibe uma mensagem de sucesso com o título do episódio selecionado
                MessageBox.Show("Episódio selecionado: " + episodioSelecionado, "Sucesso");
            }
        }
    }
}
