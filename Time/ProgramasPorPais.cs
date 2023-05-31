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
    public partial class ProgramasPorPais : Form
    {
        private SqlConnection CN;

        public ProgramasPorPais(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void ProgramasPorPais_Load(object sender, EventArgs e)
        {
            LoadPaises();
        }

        private void LoadPaises()
        {
            string query = "SELECT codigoPaisID, nome FROM TIMELESS_PAISES";
            SqlCommand cmd = new SqlCommand(query, CN);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                CN.Open();
                adapter.Fill(dt);

                comboBox1.DisplayMember = "nome";
                comboBox1.ValueMember = "codigoPaisID";
                comboBox1.DataSource = dt;
 
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Ocorreu um erro ao carregar os países: " + ex.Message);
            }
            finally
            {
                CN.Close();
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int codigoPaisID = (int)comboBox1.SelectedValue;

            string query = "SELECT p.titulo, p.anolancamento, p.diretor, p.elenco, p.sinopse, p.duracao " +
                           "FROM TIMELESS_PROGRAMA p " +
                           "INNER JOIN TIMELESS_ALLOWEDIN a ON p.idprograma = a.idPrograma " +
                           "WHERE a.codigoPaisID = @codigoPaisID";

            SqlCommand cmd = new SqlCommand(query, CN);
            cmd.Parameters.AddWithValue("@codigoPaisID", codigoPaisID);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                CN.Open();
                adapter.Fill(dt);

                dataGridView1.DataSource = dt;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Ocorreu um erro ao carregar os programas: " + ex.Message);
            }
            finally
            {
                CN.Close();
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {
            // Adicione o código necessário aqui
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Adicione o código necessário aqui
        }
    }
}
