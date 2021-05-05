using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected string load()
    {
        string value = "";

        if (Request.QueryString["modul"] != null && Request.QueryString["modul"].Equals("dx"))
        {
            Session.Clear();
            Response.Redirect("/Home.aspx", false);
        }
        if (Session["checkDN"] != null && Session["checkDN"].ToString().Equals("1"))
        {
            value = @"
        <ul class='header__first-menu'>
              <li class='header__first-menu-item'>
                  <a Class='header__first-menu-link' runat='server' >Xin chào " + Session["tenhienthi"].ToString() + @"</a>
              </li>
              <li class='header__first-menu-item'>
                   <a  Class='btnDangXuat header__first-menu-link' ID='btnDangXuat' onclick='btnDangXuat_Click' runat='server' href='Home.aspx?modul=dx' >Đăng xuất</a>
              </li>
         </ul>";
        }
        else
        {
            value = @"
        <ul class='header__first-menu'>
              <li class='header__first-menu-item'>
                  <a class='header__first-menu-link' runat='server' href='empty.aspx?modul=dn'>Đăng nhập</a>
              </li>
              <li class='header__first-menu-item'>
                   <a class='header__first-menu-link' runat='server' href='empty.aspx?modul=dk'>Đăng ký</a>
              </li>
         </ul>";
        }

        return value;
    }
    protected string loadSach()
    {
        string values = "";

        if (DatabaseSql.con.State != System.Data.ConnectionState.Open)
            DatabaseSql.con.Open();
        SqlDataAdapter dap = new SqlDataAdapter();
        dap.TableMappings.Add("Table", "theloai");
        dap.SelectCommand = new SqlCommand("select *from theloai", DatabaseSql.con);
        SqlDataAdapter dap1 = new SqlDataAdapter();
        dap1.TableMappings.Add("Table", "sach");
        dap1.SelectCommand = new SqlCommand("select *from sach", DatabaseSql.con);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        dap1.Fill(ds);
        DataTable dbTheLoai = ds.Tables["theloai"];
        DataTable dbSach = ds.Tables["sach"];
        foreach (DataRow r in dbTheLoai.Rows)
        {
            values += @" <h1 class='title'>
                <a class='title__link' Style='background-image: url(img/lbcenter.png)'>
                   " + r["tentheloai"].ToString() + @"
                </a>
            </h1>
            <div class='group_book'>
            <ul>";
            foreach (DataRow r1 in dbSach.Rows)
            {
                if (r1["matheloai"].ToString().Equals(r["matheloai"].ToString()))
                {
                    values += @"
                <li class='book__item'>
                    <a href='empty.aspx?modul=s&ms="+r1["masach"].ToString()+@"' class='book'>
                       <img src='img/" + r1["hinhminhhoa"].ToString() + @"'/>
                    </a>
                    <div class='book__item-notify'>
                        <h3 class='book__item-notify-title'>" + r1["tensach"].ToString() + @"
                        </h3>
                        <ul class='book__item-notify-info'>
                            <li>Tên tác giả:" + r1["tentacgia"].ToString() + @"</li>
                            <li>Năm sản xuất:" +DateTime.Parse(r1["namxb"].ToString()).ToShortDateString().ToString() + @"</li>
                            <li>Ngày cập nhật:" + DateTime.Parse(r1["ngaycapnhat"].ToString()).ToShortDateString().ToString() + @"</li>
                        </ul>
                        <div class='book__item-price'>
                            <span class='book__item-price-new'>" + r1["dongia"].ToString() + @"</span>
                            <span class='book__item-price-old'>235.000đ</span>
                        </div>
                        <div class='group__btn'>
                        <a  href='#' class='btn btnInfo'>Thêm giỏ hàng</a>
                        <a href='#' class='btn btnInfo'>Mua ngay</a>
                        </div>
                    </div>
                </li>";
                }
            }            
                values += "</ul></div>";
        }
        DatabaseSql.con.Close();
        return values;
    }
}