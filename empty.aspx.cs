using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class empty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public string load()
    {
        string value = "";
        string checkdn = "0";
        string quyen = "kh";
        if (Session["qtc"] != null)
            quyen = Session["qtc"].ToString();
        if (Session["checkDN"] != null)
            checkdn = Session["checkDN"].ToString();
        if (Request.QueryString["modul"] != null && Request.QueryString["modul"].Equals("dx"))
        {
            Session.Clear();
        }
        if (checkdn.Equals("1"))
        {
            value = @"
        <ul class='header__first-menu'>
              <li class='header__first-menu-item'>
                  <a Class='header__first-menu-link' runat='server' >Xin chào "+Session["tenhienthi"]+@"</a>
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
}