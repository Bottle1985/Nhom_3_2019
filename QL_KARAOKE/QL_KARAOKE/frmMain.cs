using QL_KARAOKE.DB;
using QL_KARAOKE.ThongKe;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QL_KARAOKE
{
    public partial class frmMain : Form
    {

        public frmMain()
        {
            InitializeComponent();
        }
        
        private void quyentruycap ()
        {
            MessageBox.Show("Bạn không đủ quyền try cập", "chú ý", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }


        #region giao_dien

       
        public const int WM_NCLBUTTONDOWN = 0xA1;
        public const int HT_CAPTION = 0x2;

        [DllImportAttribute("user32.dll")]
        public static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);
        [DllImportAttribute("user32.dll")]
        public static extern bool ReleaseCapture();

        private Boolean isMaximize = false;
        private void ptbExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void ptbMinimize_Click(object sender, EventArgs e)
        {
            
            this.WindowState = FormWindowState.Minimized;
        }

        private void ptbMaximize_Click(object sender, EventArgs e)
        {
            
            if (!isMaximize)
            {
                this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
                this.WindowState = FormWindowState.Maximized;
                ptbMaximize.Image = Properties.Resources.res;

            }else
            {
                this.WindowState = FormWindowState.Normal;
                ptbMaximize.Image = Properties.Resources.maxi;
            }
            isMaximize = !isMaximize;
        }

        private void pnlTop_MouseMove(object sender, MouseEventArgs e)
        {
            
            if (e.Button == MouseButtons.Left)
            {
                ReleaseCapture();
                SendMessage(Handle, WM_NCLBUTTONDOWN, HT_CAPTION, 0);
            }
        }

        //khi double click lên paneltop thì gọi tới sự kiện click của picturebox maximize
        private void pnlTop_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            ptbMaximize_Click(null, null);
        }
        #endregion

        private KARAOKE_DatabaseDataContext db;
        private NhanVien nv;
        private void frmMain_Load(object sender, EventArgs e)
        {
            db = new KARAOKE_DatabaseDataContext();
            var f = new frmDangNhap();
            f.ShowDialog();
            nv = f.nv;
            
            
            var ten = db.CauHinhs.SingleOrDefault(x => x.tukhoa == "tencuahang").giatri;
            var diachi = db.CauHinhs.SingleOrDefault(x => x.tukhoa == "diachi").giatri;
            var phone = db.CauHinhs.SingleOrDefault(x => x.tukhoa == "phone").giatri;
            lblTitle.Text = String.Format("{0} - {1} - {2} ", ten, diachi, phone);
            lblNhanVien.Text = String.Format("Nhân viên: {0}", nv.HoVaTen);





        }


        #region menu_item
        private void loaiPhongToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (nv.Username == "admin")
            {
                var f = new frmLoaiPhong();//khai bao form
                addForm(f);
            }
            else
            {
                quyentruycap();
            }
          
        }

        private void addForm(Form f)
        {
            f.FormBorderStyle = FormBorderStyle.None;//bo vien form
            f.Dock = DockStyle.Fill;//tu dong co gian 
            f.TopLevel = false;
            f.TopMost = true;
            grbContent.Controls.Clear();//xoa cac item dang co tren groupbox
            grbContent.Controls.Add(f);
            f.Show();
        }

        private void phongToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin")
            {
                var f = new frmPhong();
                addForm(f);
            }
            else
            {
                quyentruycap();
            }

        }

        private void matHangToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (nv.Username == "admin")
            {
                var f = new frmMatHang(nv.Username);
            addForm(f);
            }
            else
            {
                quyentruycap();
            }


        }

        private void dvtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin")
            {

                var f = new frmDonViTinh();
            addForm(f);
            }
            else
            {
                quyentruycap();
            }

        }

        private void nccToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin")
            {

             var f = new frmNhaCungCap();
            addForm(f);
            }
            else
            {
                quyentruycap();
            }

        }

        private void nvToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin")
            {
                var f = new frmNhanVien();
            addForm(f);
            }
            else
            {
                quyentruycap();
            }


        }

        private void nhapHangToolStripMenuItem_Click(object sender, EventArgs e)
        {


            if (nv.Username == "admin"||nv.Username=="nvkho")
            {
                if (nv.Username == "nvkho")
                {

                    var f = new frmNhapHang();
                    addForm(f);
                }
                else
                {
                    var f = new frmNhapHang();
                    addForm(f);
                }
            }
            else
            {
                quyentruycap();
            }

        }

        private void banHangToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin" || nv.Username == "nvthungan")
            {
                if (nv.Username == "nvthungan")
                {
                    var f = new frmBanHang();
                    addForm(f);
                }
                else
                {
                    var f = new frmBanHang();
                    addForm(f);
                }
            }
            else
            {
                quyentruycap();
            }

        }
        private void tonKhoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin" || nv.Username == "nvketoan")
            {
                if (nv.Username == "nvketoan")
                {
                    var f = new frmTonKho();
                    addForm(f);
                }
                else
                {
                    var f = new frmTonKho();
                    addForm(f);
                }
            }
            else
            {
                quyentruycap();
            }
        }

       

        private void doanhThuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nv.Username == "admin" || nv.Username == "nvketoan")
            {
                if (nv.Username == "nvketoan")
                {

                    var f = new frmDoanhThu();
                    addForm(f);
                }
                else
                {
                    var f = new frmDoanhThu();
                    addForm(f);
                }
            }
            
            else
            {
                quyentruycap();
            }
        }


#endregion

        private void danhMụcToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void nộiQuyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var f = new noiquy();
            addForm(f);
        }

        private void nhàPhátTriểnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmNPT f = new frmNPT();
            addForm(f);
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
            
        }
    }
}
