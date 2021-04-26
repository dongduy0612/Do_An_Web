using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_loadControls : System.Web.UI.UserControl
{
    private string modul = "";
    private string submodul = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];
        if (Request.QueryString["submodul"] != null)
            submodul = Request.QueryString["submodul"];
        switch (modul)
        {
            case "dn":
            case "dk":
                PlaceHolder1.Controls.Add(LoadControl("Account/loginRegisterControl.ascx"));
                break;
            case "admin":
                switch (submodul) {
                    case "qldmb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/Manager/categoryBook.ascx"));
                        break;
                    case "qldsb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/Manager/listBook.ascx"));
                        break;
                    case "qldstk":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/Manager/listAccount.ascx"));
                        break;
                    case "tmdmb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/AddNew/addCategoryBook.ascx"));
                        break;
                    case "tmb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/AddNew/addBook.ascx"));
                        break;
                }
                break;
            case "tl":
                switch (submodul)                    
                {
                   case "ts":
                        PlaceHolder1.Controls.Add(LoadControl("Book/book.ascx"));
                        break;
                }
                break;
            case "gt":
               PlaceHolder1.Controls.Add(LoadControl("Introduce/introduce.ascx"));
                break;
        }

      

    }
}