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
                        PlaceHolder1.Controls.Add(LoadControl("Admin/Manager/CategoryBook/categoryBook.ascx"));
                        break;
                    case "qldsb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/Manager/listBook/listBook.ascx"));
                        break;
                    case "qldstk":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/Manager/listAccount/listAccount.ascx"));
                        break;
                    case "tmdmb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/AddNew/AddCategoryBook/addCategoryBook.ascx"));
                        break;
                    case "tmb":
                        PlaceHolder1.Controls.Add(LoadControl("Admin/AddNew/AddBook/addBook.ascx"));
                        break;
                }
                break;           
        }

      

    }
}