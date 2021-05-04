using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class masterPageTrangChu : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
   protected string loadMenu()
    {
        string values = "";
        if (DatabaseSql.con.State != System.Data.ConnectionState.Open)
            DatabaseSql.con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = DatabaseSql.con;
        cmd.CommandText = "select *from theloai";
        SqlDataReader dr = cmd.ExecuteReader();
        while(dr.Read())
        {
            values += @"<li class='header__nav-sub-menu-item'>
                                            <a href='#'>"+dr["tentheloai"]+@"</a>
                                        </li>";
        }
        dr.Close();
        DatabaseSql.con.Close();

        return values;
    }
}
