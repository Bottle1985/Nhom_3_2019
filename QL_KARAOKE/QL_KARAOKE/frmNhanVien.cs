using QL_KARAOKE.DB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QL_KARAOKE
{
    public partial class frmNhanVien : Form
    {
        public frmNhanVien()
        {
            InitializeComponent();
        }

        private KARAOKE_DatabaseDataContext db;
        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            db = new KARAOKE_DatabaseDataContext();
            ShowData();

            dgvNhanVien.Columns["password"].HeaderText = "Mật khẩu";//ẩn cột mật khẩu
            dgvNhanVien.Columns["Username"].HeaderText = "Tài khoản";
            dgvNhanVien.Columns["hovaten"].HeaderText = "Họ và tên";
            dgvNhanVien.Columns["dienthoai"].HeaderText = "Điện thoại";
            dgvNhanVien.Columns["diachi"].HeaderText = "Địa chỉ";

            dgvNhanVien.Columns["username"].Width = 100;
            dgvNhanVien.Columns["dienthoai"].Width = 100;
            dgvNhanVien.Columns["hovaten"].Width = 200;
            dgvNhanVien.Columns["diachi"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void ShowData()
        {
            dgvNhanVien.DataSource = from nv in db.NhanViens
                                     select new
                                     {
                                         nv.Username,
                                         nv.Password,
                                         nv.HoVaTen,
                                         nv.DienThoai,
                                         nv.DiaChi
                                     };
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtUsername.Text))
            {
                MessageBox.Show("Vui lòng nhập tài khoản nhân viên", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtUsername.Select();
                return;
            }
            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                MessageBox.Show("Vui lòng nhập mật khẩu", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtPassword.Select();
                return;
            }

            //kiểm tra sự tồn tại của tài khoản trong csdl
            var c = db.NhanViens.Where(x => x.Username.Trim().ToLower() == txtUsername.Text.Trim().ToLower()).Count();
            if (c > 0)
            {
                MessageBox.Show("Tài khoản này đã tồn tại", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtUsername.Select();
                return;
            }

            var nv = new NhanVien();
            nv.Username = txtUsername.Text.Trim().ToLower();
            nv.Password = txtPassword.Text;
            nv.HoVaTen = txtHoVaTen.Text;
            nv.DienThoai = txtDienThoai.Text;
            nv.DiaChi = txtDiaChi.Text;

            db.NhanViens.InsertOnSubmit(nv);
            db.SubmitChanges();
            MessageBox.Show("Thêm mới nhân viên thành công!", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ShowData();
            txtDiaChi.Text = txtDienThoai.Text = txtHoVaTen.Text = txtPassword.Text = txtUsername.Text = null;
        }

        private DataGridViewRow r;
        private void dgvNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                r = dgvNhanVien.Rows[e.RowIndex];
                txtUsername.Text = r.Cells["username"].Value.ToString();
                txtPassword.Text = r.Cells["password"].Value.ToString();
                txtHoVaTen.Text = r.Cells["hovaten"].Value.ToString();
                txtDienThoai.Text = r.Cells["dienthoai"].Value.ToString();
                txtDiaChi.Text = r.Cells["diachi"].Value.ToString();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (r == null)
            {
                MessageBox.Show("Vui lòng chọn nhân viên cần cập nhật", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var nv = db.NhanViens.SingleOrDefault(x => x.Username == r.Cells["username"].Value.ToString());
            nv.Password = txtPassword.Text;
            nv.HoVaTen = txtHoVaTen.Text;
            nv.DienThoai = txtDienThoai.Text;
            nv.DiaChi = txtDiaChi.Text;

            db.SubmitChanges();
            MessageBox.Show("Cập nhật nhân viên thành công!", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ShowData();
            txtDiaChi.Text = txtDienThoai.Text = txtHoVaTen.Text = txtPassword.Text = txtUsername.Text = null;
            r = null;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (r == null)
            {
                MessageBox.Show("Vui lòng chọn nhân viên cần xóa", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (
              MessageBox.Show("Bạn thực sự muốn xóa nhân viên " + r.Cells["username"].Value.ToString() + " ?",
                                      "Xác nhận xóa",
                                      MessageBoxButtons.YesNo,
                                      MessageBoxIcon.Question) == DialogResult.Yes
              )
            {
                try
                {
                    var nv = db.NhanViens.SingleOrDefault(x => x.Username == r.Cells["username"].Value.ToString());
                    db.NhanViens.DeleteOnSubmit(nv);
                    db.SubmitChanges();
                    MessageBox.Show("Xóa nhân viên thành công!", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
                  
                }
                catch 
                {
                    MessageBox.Show("Xóa nhân viên thất bại!", "Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                finally
                {
                    ShowData();
                    txtDiaChi.Text = txtDienThoai.Text = txtHoVaTen.Text = txtPassword.Text = txtUsername.Text = null;
                    r = null;
                }
            }

        }

       
    }
}
