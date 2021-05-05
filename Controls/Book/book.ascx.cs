using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Controls_Book_book : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected string loadSach()
    {
        string values = "";
        if (DatabaseSql.con.State != System.Data.ConnectionState.Open)
            DatabaseSql.con.Open();
        SqlDataAdapter dap = new SqlDataAdapter();
        dap.TableMappings.Add("Table", "Sach");
        dap.SelectCommand = new SqlCommand("select *from sach,nhaxuatban,theloai where sach.matheloai=theloai.matheloai and sach.manxb=nhaxuatban.manxb and masach=" + "'" + Request.QueryString["ms"].ToString() + "'", DatabaseSql.con);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DataTable dbSach = ds.Tables["Sach"];
        DataRow r = dbSach.Rows[0];
        values = @"
 <img style='max-height:230px;min-width:148px;' src='../../img/" + r["hinhminhhoa"].ToString() + @"' class='book__info-left' />
    <div class='book__info-right'>
        <h1>" + r["tensach"].ToString() + @"</h1>
        <div class='book__info-right-left'>
            <ul>
                <li class='book__info-right-item'>
                    <span>Mã sach</span>
                    <span class='book__info-right-properties'>" + r["masach"].ToString() + @"</span>
                </li>
                <li class='book__info-right-item'>
                    <span>Tác giả</span>
                    <span class='book__info-right-properties'>" + r["tentacgia"].ToString() + @"</span>
                </li>
                <li class='book__info-right-item'>
                    <span>Tên nhà xuất bản</span>
                    <span class='book__info-right-properties'>" + r["tennxb"].ToString() + @"</span>
                </li>
                <li class='book__info-right-item'>
                    <span>Thể loại</span>
                    <span class='book__info-right-properties'>" + r["tentheloai"].ToString() + @"</span>
                </li>
                <li class='book__info-right-item'>
                    <span>Đơn vị tính</span>
                    <span class='book__info-right-properties'>" + r["donvitinh"].ToString() + @"</span>
                </li>
                <li class='book__info-right-item'>
                    <span>Ngày phát hành</span>
                    <span class='book__info-right-properties'>" + DateTime.Parse(r["namxb"].ToString()).ToShortDateString().ToString() + @"</span>
                </li>
            </ul>
            <div class='book__info-right-right'>
                <p class='book__info-right-price-old'>Giá bìa: <span>180000đ</span></p>
                <p class='book__info-right-price-new'>Giá Nhã Nam:<span>" + r["dongia"].ToString() + "đ" + @"</span></p>
                
";
        DatabaseSql.con.Close();
        return values;
    }

}