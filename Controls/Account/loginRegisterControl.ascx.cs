using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Account_loginRegisterControl : System.Web.UI.UserControl
{   
    string modul = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["checkDN"] = "0";
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];
        switch (modul)
        {
            case "dn":
                MultiView1.ActiveViewIndex = 0;
                break;
            case "dk":
                MultiView1.ActiveViewIndex = 1;
                break;
        }
    }



    protected void btnRegister_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnRegister1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnLoginRegister_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtEmailLogin.Text.Equals("dongduy0612@gmail.com") && txtPWLogin.Text.Equals("12345"))
        {
            Session["checkDN"] = "1";
            Response.Redirect("Home.aspx");
        }
        else
        {
            Session["checkDN"] = "0";
            lbNotifyLogin.Text = "Sai tên tài khoản hoặc mật khẩu";
        }     
    }
}