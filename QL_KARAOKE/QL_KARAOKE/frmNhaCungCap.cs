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
    public partial class frmNhaCungCap : Form
    {
        public frmNhaCungCap()
        {
            InitializeComponent();
        }
        private KARAOKE_DatabaseDataContext db;
        private string nhanvien = "admin";
        private void frmNhaCungCap_Load(object sender, EventArgs e)
        {
            db = new KARAOKE_DatabaseDataContext();
            ShowData();
            dgvNhaCungCap.Columns["id"].Visible = false;//ẩn cột mã nhà cung cấp
            dgvNhaCungCap.Columns["TenNCC"].HeaderText = "Tên nhà cung cấp";
            dgvNhaCungCap.Columns["diachi"].HeaderText = "Địa chỉ";
            dgvNhaCungCap.Columns["email"].HeaderText = "Email";
            dgvNhaCungCap.Columns["dienthoai"].HeaderText = "Điện thoại";

            dgvNhaCungCap.Columns["diachi"].Width = 200;
            dgvNhaCungCap.Columns["dienthoai"].Width = 100;
            dgvNhaCungCap.Columns["email"].Width = 200;
            dgvNhaCungCap.Columns["tenncc"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }
        private void ShowData()
        {
            var rs = from n in db.NhaCungCaps
                     select new
                     {
                         n.ID,
                         n.TenNCC,
                         n.DienThoai,
                         n.Email,
                         n.DiaChi
                     };
            dgvNhaCungCap.DataSource = rs;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTenNCC.Text))
            {
                MessageBox.Show("Vui lòng nhập tên nhà cung cấp", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTenNCC.Select();
                return;
            }

            NhaCungCap ncc = new NhaCungCap();
            ncc.TenNCC = txtTenNCC.Text;
            ncc.DiaChi = txtDiaChi.Text;
            ncc.Email = txtEmail.Text;
            ncc.DienThoai = txtDienThoai.Text;
            ncc.NgayTao = DateTime.Now;
            ncc.NguoiTao = nhanvien;

            db.NhaCungCaps.InsertOnSubmit(ncc);
            db.SubmitChanges();
            MessageBox.Show("Thêm mới nhà cung cấp thành công", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ShowData();
            txtDiaChi.Text = txtDienThoai.Text = txtEmail.Text = txtTenNCC.Text = null;

        }

        private DataGridViewRow r;
        private void dgvNhaCungCap_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                r = dgvNhaCungCap.Rows[e.RowIndex];
                txtDiaChi.Text = r.Cells["diachi"].Value.ToString();
                txtEmail.Text = r.Cells["email"].Value.ToString();
                txtTenNCC.Text = r.Cells["tenncc"].Value.ToString();
                txtDienThoai.Text = r.Cells["dienthoai"].Value.ToString();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (r == null)
            {
                MessageBox.Show("Vui lòng chọn nhà cung cấp muốn cập nhật", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var ncc = db.NhaCungCaps.SingleOrDefault(x => x.ID == int.Parse(r.Cells["id"].Value.ToString()));
            ncc.TenNCC = txtTenNCC.Text;
            ncc.DiaChi = txtDiaChi.Text;
            ncc.Email = txtEmail.Text;
            ncc.DienThoai = txtDienThoai.Text;
            ncc.NgayCapNhat = DateTime.Now;
            ncc.NguoiCapNhat = nhanvien;

            db.SubmitChanges();
            MessageBox.Show("Cập nhật nhà cung cấp thành công", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ShowData();
            txtDiaChi.Text = txtDienThoai.Text = txtEmail.Text = txtTenNCC.Text = null;
            r = null;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (r == null)
            {
                MessageBox.Show("Vui lòng chọn nhà cung cấp muốn xóa", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (
              MessageBox.Show("Bạn thực sự muốn xóa nhà cung cấp " + r.Cells["tenncc"].Value.ToString() + " ?",
                                      "Xác nhận xóa",
                                      MessageBoxButtons.YesNo,
                                      MessageBoxIcon.Question) == DialogResult.Yes
              )
            {
                try
                {
                    var ncc = db.NhaCungCaps.SingleOrDefault(x => x.ID == int.Parse(r.Cells["id"].Value.ToString()));
                    db.NhaCungCaps.DeleteOnSubmit(ncc);
                    db.SubmitChanges();
                    MessageBox.Show("Xóa nhà cung cấp thành công", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
                   
                }
                catch 
                {
                    MessageBox.Show("Xóa nhà cung cấp thất bại", "Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                ShowData();
                txtDiaChi.Text = txtDienThoai.Text = txtEmail.Text = txtTenNCC.Text = null;
                r = null;
            }
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
