using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class Controls_Account_loginRegisterControl : System.Web.UI.UserControl
{
   static string modul;
    protected void Page_Load(object sender, EventArgs e)
    {
        RadioButtonList1.SelectedIndex = 0;
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
        try
        {
            DatabaseSql.con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = DatabaseSql.con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT KHACHHANG(EMAIL, MATKHAU, TENKH, DIACHI, SDT, GIOITINH) VALUES(@email,@matkhau,@tenkh,@diachi,@sdt,@gioitinh)";
            cmd.Parameters.AddWithValue("@email", txtEmailRegister.Text);
            cmd.Parameters.AddWithValue("@matkhau",txtPWRegister.Text);
            cmd.Parameters.AddWithValue("@diachi", txtAddress.Text);
            cmd.Parameters.AddWithValue("@sdt",txtPhone.Text);
            cmd.Parameters.AddWithValue("@tenkh",txtTenHienThi.Text);
            cmd.Parameters.AddWithValue("@gioitinh",RadioButtonList1.SelectedItem.ToString());
            int rs = cmd.ExecuteNonQuery();
            if (rs > 0)
            {
                MultiView1.ActiveViewIndex = 0;
                DatabaseSql.con.Close();   
                Response.Write("<script>alert('Đăng ký thành công!!')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Tài khoản tồn tại!!')</script>");
            MultiView1.ActiveViewIndex = 1;
        }
        DatabaseSql.con.Close();
    }
    protected void btnLoginRegister_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (DatabaseSql.con.State!=ConnectionState.Open)
        DatabaseSql.con.Open();
        string sql = "select *from quantri where email=@email and matkhau=@matkhau";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = DatabaseSql.con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sql;
        cmd.Parameters.AddWithValue("@email", txtEmailLogin.Text);
        cmd.Parameters.AddWithValue("@matkhau", txtPWLogin.Text);
        SqlDataReader dr = cmd.ExecuteReader();
       
        string qtc = "kh";
        if (dr.Read())
        {
            qtc = dr["quyen"].ToString().Trim().ToLower();
            Session["tenhienthi"] = dr["tenhienthi"].ToString().Trim();
            Session["checkDN"] = "1";
            Session["qtc"] = qtc;
            if (qtc.Equals("admin"))
            {
                dr.Close();
                DatabaseSql.con.Close();
                Response.Redirect("Home.aspx?modul=admin");
            }

        }
       
        
            sql = "select *from khachhang where email=@email and matkhau=@matkhau";
            cmd = new SqlCommand();
            cmd.Connection = DatabaseSql.con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@email", txtEmailLogin.Text);
            cmd.Parameters.AddWithValue("@matkhau", txtPWLogin.Text);
            dr.Close();
            dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            qtc = dr["quyen"].ToString().Trim().ToLower();
            Session["tenhienthi"] = dr["tenkh"].ToString().Trim();
            Session["checkDN"] = "1";
            Session["qtc"] = qtc;
            if (qtc.Equals("kh"))
            {
                dr.Close();
                DatabaseSql.con.Close();
                Response.Redirect("Home.aspx");
            }

        }
        Session["checkDN"] = "0";
            lbNotifyLogin.Text = "Sai tên tài khoản hoặc mật khẩu";        
        dr.Close();
        MultiView1.ActiveViewIndex = 0;
        DatabaseSql.con.Close();
    }
}