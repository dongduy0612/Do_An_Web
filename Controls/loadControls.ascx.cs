using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_loadControls : System.Web.UI.UserControl
{
    private string modul = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];
        switch (modul)
        {
            case "dn":
            case "dk":
                PlaceHolder1.Controls.Add(LoadControl("Account/loginRegisterControl.ascx"));
                break;
        }
    }
}