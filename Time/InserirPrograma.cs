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
   
    public partial class InserirPrograma : Form
    {
        private SqlConnection CN;
        public InserirPrograma(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void InserirPrograma_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        private int GetProgramId(string programaNome)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT idPrograma FROM TIMELESS_PROGRAMA WHERE titulo = @programaNome", CN))
            {
                cmd.Parameters.AddWithValue("@programaNome", programaNome);

                CN.Open(); // Abre a conexão com o banco de dados

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return Convert.ToInt32(reader["idPrograma"]);
                    }
                    else
                    {
                        throw new Exception("Programa não encontrado");
                    }
                }
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string programaNome = textBox1.Text;

            try
            {
                // Obter o idPrograma correspondente ao nome do programa
                int idPrograma = GetProgramId(programaNome);

                using (SqlCommand cmd = new SqlCommand("GetProgramSoundtracks", CN))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@programId", idPrograma);

                    if (CN.State == ConnectionState.Closed)
                    {
                        CN.Open(); // Abre a conexão com o banco de dados
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        dataGridView1.DataSource = dt;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao obter a soundtrack do programa: " + ex.Message);
            }
            finally
            {
                if (CN.State == ConnectionState.Open)
                {
                    CN.Close(); // Fecha a conexão com o banco de dados
                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
