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
    public partial class Menu : Form
    {
        private SqlConnection CN;
        public Menu(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            VerificarExistenciaConta frm = new VerificarExistenciaConta(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void Menu_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            MenuFuncionario frm = new MenuFuncionario(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }
    }
}
