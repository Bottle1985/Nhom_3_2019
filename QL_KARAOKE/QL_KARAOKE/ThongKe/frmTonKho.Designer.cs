namespace QL_KARAOKE.ThongKe
{
    partial class frmTonKho
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvTonKho = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.rbtTatCa = new System.Windows.Forms.RadioButton();
            this.rbtGanHet = new System.Windows.Forms.RadioButton();
            this.rbtDaHet = new System.Windows.Forms.RadioButton();
            this.btnThongKe = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTonKho)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvTonKho
            // 
            this.dgvTonKho.AllowUserToAddRows = false;
            this.dgvTonKho.AllowUserToDeleteRows = false;
            this.dgvTonKho.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvTonKho.BackgroundColor = System.Drawing.Color.White;
            this.dgvTonKho.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTonKho.Location = new System.Drawing.Point(0, 84);
            this.dgvTonKho.Name = "dgvTonKho";
            this.dgvTonKho.ReadOnly = true;
            this.dgvTonKho.Size = new System.Drawing.Size(969, 467);
            this.dgvTonKho.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(446, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(238, 25);
            this.label1.TabIndex = 1;
            this.label1.Text = "THỐNG KÊ TỒN KHO";
            // 
            // rbtTatCa
            // 
            this.rbtTatCa.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.rbtTatCa.AutoSize = true;
            this.rbtTatCa.Checked = true;
            this.rbtTatCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbtTatCa.ForeColor = System.Drawing.Color.Black;
            this.rbtTatCa.Location = new System.Drawing.Point(530, 59);
            this.rbtTatCa.Name = "rbtTatCa";
            this.rbtTatCa.Size = new System.Drawing.Size(128, 19);
            this.rbtTatCa.TabIndex = 2;
            this.rbtTatCa.TabStop = true;
            this.rbtTatCa.Text = "Tất cả mặt hàng";
            this.rbtTatCa.UseVisualStyleBackColor = true;
            // 
            // rbtGanHet
            // 
            this.rbtGanHet.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.rbtGanHet.AutoSize = true;
            this.rbtGanHet.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbtGanHet.ForeColor = System.Drawing.Color.Black;
            this.rbtGanHet.Location = new System.Drawing.Point(659, 59);
            this.rbtGanHet.Name = "rbtGanHet";
            this.rbtGanHet.Size = new System.Drawing.Size(75, 19);
            this.rbtGanHet.TabIndex = 2;
            this.rbtGanHet.Text = "Gần hết";
            this.rbtGanHet.UseVisualStyleBackColor = true;
            // 
            // rbtDaHet
            // 
            this.rbtDaHet.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.rbtDaHet.AutoSize = true;
            this.rbtDaHet.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbtDaHet.ForeColor = System.Drawing.Color.Black;
            this.rbtDaHet.Location = new System.Drawing.Point(737, 59);
            this.rbtDaHet.Name = "rbtDaHet";
            this.rbtDaHet.Size = new System.Drawing.Size(67, 19);
            this.rbtDaHet.TabIndex = 2;
            this.rbtDaHet.Text = "Đã hết";
            this.rbtDaHet.UseVisualStyleBackColor = true;
            // 
            // btnThongKe
            // 
            this.btnThongKe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnThongKe.BackColor = System.Drawing.Color.Cyan;
            this.btnThongKe.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThongKe.ForeColor = System.Drawing.Color.Black;
            this.btnThongKe.Location = new System.Drawing.Point(856, 51);
            this.btnThongKe.Name = "btnThongKe";
            this.btnThongKe.Size = new System.Drawing.Size(85, 29);
            this.btnThongKe.TabIndex = 3;
            this.btnThongKe.Text = "Thống kê";
            this.btnThongKe.UseVisualStyleBackColor = false;
            this.btnThongKe.Click += new System.EventHandler(this.btnThongKe_Click);
            // 
            // frmTonKho
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(969, 551);
            this.Controls.Add(this.btnThongKe);
            this.Controls.Add(this.rbtDaHet);
            this.Controls.Add(this.rbtGanHet);
            this.Controls.Add(this.rbtTatCa);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvTonKho);
            this.Name = "frmTonKho";
            this.Text = "frmTonKho";
            this.Load += new System.EventHandler(this.frmTonKho_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTonKho)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvTonKho;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RadioButton rbtTatCa;
        private System.Windows.Forms.RadioButton rbtGanHet;
        private System.Windows.Forms.RadioButton rbtDaHet;
        private System.Windows.Forms.Button btnThongKe;
    }
}