using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string checkdn = "0";
        if (Session["checkDN"] != null)
            checkdn = Session["checkDN"].ToString();
        if (Request.QueryString["modul"] != null && Request.QueryString["modul"].Equals("dx"))
        { Session["checkDN"] = 0; checkdn = "0"; }
        if (checkdn.Equals("0"))
            Response.Redirect("empty.aspx?modul=dn");
       
        if (checkdn.Equals("1"))
        {
            ltrLoginRegister.Text = @"
        <ul class='header__first-menu'>
              <li class='header__first-menu-item'>
                  <a Class='header__first-menu-link' runat='server' >Xin chào duy đẹp trai</a>
              </li>
              <li class='header__first-menu-item'>
                   <a  Class='btnDangXuat header__first-menu-link' ID='btnDangXuat' onclick='btnDangXuat_Click' runat='server' href='Home.aspx?modul=dx' >Đăng xuất</a>
              </li>
         </ul>";
        }
        else
        {
            ltrLoginRegister.Text = @"
        <ul class='header__first-menu'>
              <li class='header__first-menu-item'>
                  <a Class='header__first-menu-link' runat='server' href='empty.aspx?modul=dn'>Đăng nhập</a>
              </li>
              <li class='header__first-menu-item'>
                   <a Class='header__first-menu-link' runat='server' href='empty.aspx?modul=dk'>Đăng ký</a>
              </li>
         </ul>";
        }
    }
    protected void btnDangXuat_Click(object sender, EventArgs e)
    {
        Session["checkDN"] = "0";
        Response.Redirect("Home.aspx");
    }
}