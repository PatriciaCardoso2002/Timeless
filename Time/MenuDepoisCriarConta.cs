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

    public partial class MenuDepoisCriarConta : Form
    {
        private SqlConnection CN;
        public MenuDepoisCriarConta(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            EscolherSubscricao frm = new EscolherSubscricao(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ProgramasPorPais frm = new ProgramasPorPais(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void MenuDepoisCriarConta_Load(object sender, EventArgs e)
        {

        }
    }
}
