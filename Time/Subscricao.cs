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

        private void textBox1_TextChanged(object sender, EventArgs e)
{
    int idConta = 0;

    if (int.TryParse(textBox1.Text, out idConta))
    {
        string query = "SELECT TS.tiposubscricao FROM TIMELESS_CONTA_PROGRAMA TCP JOIN TIMELESS_SUBSCRICAO TS ON TCP.idConta = TS.idConta WHERE TCP.idConta = @idConta";

        using (SqlCommand command = new SqlCommand(query, CN))
        {
            command.Parameters.AddWithValue("@idConta", idConta);

            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
    }
}

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
