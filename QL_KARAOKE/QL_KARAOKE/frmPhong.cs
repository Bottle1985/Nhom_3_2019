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
    public partial class frmPhong : Form
    {
        public frmPhong()
        {
            InitializeComponent();
        }

        private KARAOKE_DatabaseDataContext db;
        private string nhanvien = "admin";//tạm thời dùng admin. Sau này, tạo form đăng nhập sẽ truyền tài khoản nhân viên qua sau
        private void frmPhong_Load(object sender, EventArgs e)
        {
            db = new KARAOKE_DatabaseDataContext();
            ShowData();//gọi hàm hiển thị danh sách phòng khi form đc load

            //đổ dữ liệu cho combobox cbbLoaiPhong
            cbbLoaiPhong.DataSource = db.LoaiPhongs;
            cbbLoaiPhong.DisplayMember = "tenloaiphong";//thuộc tính hiển thị: tên loại phòng
            cbbLoaiPhong.ValueMember = "id";//thuộc tính giá trị: id - mã của loại phòng
            cbbLoaiPhong.SelectedIndex = -1;//mặc định không chọn loại phòng nào cả

            //tùy chỉnh lại thuộc tính hiển thị của các cột trên datagridview dgvPhong
            //tương tự các phần trước nên mình không giải thích nữa
            dgvPhong.Columns["id"].HeaderText = "Mã phòng";
            dgvPhong.Columns["tenloaiphong"].HeaderText = "Loại phòng";
            dgvPhong.Columns["tenphong"].HeaderText = "Tên phòng";
            dgvPhong.Columns["dongia"].HeaderText = "Đơn giá";
            dgvPhong.Columns["succhua"].HeaderText = "Sức chứa";

            dgvPhong.Columns["id"].Width = 100;
            dgvPhong.Columns["tenloaiphong"].Width = 200;
            dgvPhong.Columns["succhua"].Width = 100;
            dgvPhong.Columns["dongia"].Width = 100;
            dgvPhong.Columns["tenphong"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;

            dgvPhong.Columns["id"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgvPhong.Columns["succhua"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgvPhong.Columns["dongia"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;

            dgvPhong.Columns["dongia"].DefaultCellStyle.Format = "N0";
        }
        
        private void ShowData()
        {
            //theo thiết kế thì 2 bảng Phòng và loại phòng quan hệ với nhau 1-n
            //dựa vào khóa ngoại [IDLoaiPhong]
            //nên để lấy dữ liệu từ 2 bảng này, chúng ta sử dụng join trong linq
            var rs = from p in db.Phongs
                     join l in db.LoaiPhongs on p.IDLoaiPhong equals l.ID
                     select new
                     {
                         p.ID,
                         l.TenLoaiPhong,
                         p.TenPhong,
                         l.DonGia,
                         p.SucChua
                     };
            dgvPhong.DataSource = rs;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTenPhong.Text))
            {
                MessageBox.Show("Vui lòng nhập tên phòng", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTenPhong.Select();
                return;
            }
            if(cbbLoaiPhong.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn loại phòng", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (string.IsNullOrEmpty(txtSucChua.Text) || int.Parse(txtSucChua.Text)<=0)
            {
                MessageBox.Show("Sức chứa của phòng phải lớn hơn 0", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSucChua.Select();
                return;
            }

            var p = new Phong();//khai báo 1 đối tượng mới thuộc class Phong
            p.TenPhong = txtTenPhong.Text;
            p.IDLoaiPhong = int.Parse(cbbLoaiPhong.SelectedValue.ToString());// vì SelectedValue.ToString() trả về string nên cần convert qua int để cùng kiểu với idloaiphong trong csdl
            p.SucChua = int.Parse(txtSucChua.Text);//tương tự như trên

            p.NgayTao = DateTime.Now;
            p.NguoiTao = nhanvien;

            db.Phongs.InsertOnSubmit(p);
            db.SubmitChanges(); 
            //lỗi vừa nhận được là do id trong bảng phòng chưa được thiết lập tăng tự động
            //sau khi chỉnh sửa lại xong csdl ta cũng cần cập nhật lại datacontext

            MessageBox.Show("Thêm mới phòng thành công","Successfully",MessageBoxButtons.OK,MessageBoxIcon.Information);
            ShowData();//gọi lại hàm hiển thị danh sách phòng

            //thiết lập lại giá trị mặc định cho các component
            txtSucChua.Text = txtTenPhong.Text = null;
            cbbLoaiPhong.SelectedIndex = -1;
        }

        private void txtSucChua_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))//chỉ được nhập số tự nhiên
            {
                e.Handled = true;
            }
        }

        #region
        //phần cập nhật và phần xóa phòng tương tự như bên loại phòng
        //nên mình sẽ không giải thích nhiều
        //các bạn nếu không hiểu thì xem lại đoạn loại phòng nhé
        #endregion
        private DataGridViewRow r;
        private void dgvPhong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                r = dgvPhong.Rows[e.RowIndex];
                txtTenPhong.Text = r.Cells["tenphong"].Value.ToString();
                txtSucChua.Text = r.Cells["succhua"].Value.ToString();
                cbbLoaiPhong.Text = r.Cells["tenloaiphong"].Value.ToString();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTenPhong.Text))
            {
                MessageBox.Show("Vui lòng nhập tên phòng", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTenPhong.Select();
                return;
            }
            if (cbbLoaiPhong.SelectedIndex < 0)
            {
                MessageBox.Show("Vui lòng chọn loại phòng", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (string.IsNullOrEmpty(txtSucChua.Text) || int.Parse(txtSucChua.Text) <= 0)
            {
                MessageBox.Show("Sức chứa của phòng phải lớn hơn 0", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSucChua.Select();
                return;
            }
            var p = db.Phongs.SingleOrDefault(x=>x.ID == int.Parse(r.Cells["id"].Value.ToString()));
            p.TenPhong = txtTenPhong.Text;
            p.IDLoaiPhong = int.Parse(cbbLoaiPhong.SelectedValue.ToString());// vì SelectedValue.ToString() trả về string nên cần convert qua int để cùng kiểu với idloaiphong trong csdl
            p.SucChua = int.Parse(txtSucChua.Text);//tương tự như trên

            p.NgayCapNhat = DateTime.Now;
            p.NguoiCapNhat = nhanvien;
            db.SubmitChanges();
            MessageBox.Show("Cập nhật phòng thành công", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ShowData();//gọi lại hàm hiển thị danh sách phòng

            //thiết lập lại giá trị mặc định cho các component
            txtSucChua.Text = txtTenPhong.Text = null;
            cbbLoaiPhong.SelectedIndex = -1;
            r = null;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //tương tự như update, khi xóa loại phòng chúng ta cũng dựa vào id của loại phòng được click trên datagridview
            if (r == null)
            {
                MessageBox.Show("Vui lòng chọn phòng muốn xóa", "Ràng buộc dữ liệu", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;//khi gặp lệnh này thì chương trình sẽ không thực hiện các lệnh tiếp theo
            }

            if (
                    MessageBox.Show("Bạn thực sự muốn xóa phòng: " + r.Cells["tenphong"].Value.ToString() + " ?",
                    "Xác nhận xóa",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question) == DialogResult.Yes
                )
            {
                try
                {
                    var p = db.Phongs.SingleOrDefault(x => x.ID == int.Parse(r.Cells["id"].Value.ToString()));
                    db.Phongs.DeleteOnSubmit(p);
                    db.SubmitChanges();

                    MessageBox.Show("Xóa phòng thành công", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ShowData();//hiển thị danh sách loại phòng sau khi thêm mới thành công

                    //reset lại giá trị mặc định cho các component
                    txtSucChua.Text = "0";
                    txtTenPhong.Text = null;
                    cbbLoaiPhong.SelectedIndex = -1;
                    r = null; // không còn hàng nào được chọn

                }
                catch
                {
                    //vì phòng và loại phòng được liên kết bằng khóa ngoại
                    //trong trường hợp đã có phòng tham chiếu tới mã loại đang xóa thì sẽ không xóa được (quan hệ 1-n update/delete)
                    //vì vậy sẽ phát sinh trường hợp catch này
                    MessageBox.Show("Xóa loại phòng thất bại", "Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
