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
    public partial class ComConta : Form
    {
        private SqlConnection CN;
        public ComConta(SqlConnection connection)
        {
            CN = connection;
            InitializeComponent();
        }

        private void ComConta_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Subscricao frm = new Subscricao(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AssistirEpisódio frm = new AssistirEpisódio(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Pagamento frm = new Pagamento(CN);
            //1 modeless dialog, Show()
            frm.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            ProgramasPopulares frm = new ProgramasPopulares(CN);
            frm.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            InserirPrograma frm = new InserirPrograma(CN);
            frm.Show();
        }
    }
}
