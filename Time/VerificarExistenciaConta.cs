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
        private List<int> tamanhosIDConta = new List<int>() { 1, 2, 3 }; // Tamanhos esperados do ID da conta

        public VerificarExistenciaConta(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            int idConta = 0;

            if (int.TryParse(textBox1.Text, out idConta))
            {
                CN.Open();

                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM TIMELESS_CONTA WHERE idConta = @idConta", CN))
                {
                    command.Parameters.AddWithValue("@idConta", idConta);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        ComConta frm = new ComConta(CN);
                        frm.Show();
                    }
                    else
                    {
                        SemConta form = new SemConta(CN);
                        form.Show();
                    }
                }

                CN.Close();
            }
        }



        private void VerificarExistenciaConta_Load(object sender, EventArgs e)
        {

        }
    }
}
