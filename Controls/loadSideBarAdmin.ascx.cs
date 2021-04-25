using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_loadSideBarAdmin : System.Web.UI.UserControl
{
    private string modul = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];
        string quyen = "kh";
        if (Session["qtc"] != null)
            quyen = Session["qtc"].ToString();
        if (quyen.Equals("admin"))
        {
            PlaceHolder1.Controls.Add(LoadControl("Admin/adminControl.ascx"));
            return;
        }
        switch (modul)
        {          
            case "admin":
                PlaceHolder1.Controls.Add(LoadControl("Admin/adminControl.ascx"));
                break;
        }

    }
}