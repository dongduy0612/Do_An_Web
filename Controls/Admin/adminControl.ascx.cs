using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Admin_adminControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected string danhDau(string modul, string submodul) {
        string modul1 = "";
        string submodul1 = "";
        if (Request.QueryString["modul"] != null)
            modul1 = Request.QueryString["modul"].ToString();

        if (Request.QueryString["submodul"] != null)
            submodul1 = Request.QueryString["submodul"].ToString();
        if(modul1.Equals(modul)&&submodul1.Equals(submodul))
        return "curent";
        return "";
    }
}