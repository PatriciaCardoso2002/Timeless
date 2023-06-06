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
    public partial class MenuFuncionario : Form
    {
        private SqlConnection CN; 
        public MenuFuncionario(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            GestaoContas frm = new GestaoContas(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            GestaoParcerias frm = new GestaoParcerias(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }
    }
}
