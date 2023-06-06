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
    public partial class ProgramasPopulares : Form
    {
        private SqlConnection CN;
        public ProgramasPopulares(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void ProgramasPopulares_Load(object sender, EventArgs e)
        {
            try
            {
                if (CN.State != ConnectionState.Open)
                    CN.Open();

                SqlCommand command = new SqlCommand("SELECT * FROM ProgramasPopulares", CN);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                dataGridView1.DataSource = dataTable;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocorreu um erro ao carregar os programas populares: " + ex.Message);
            }
            finally
            {
                if (CN.State == ConnectionState.Open)
                    CN.Close();
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
