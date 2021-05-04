<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageTrangChu.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Src="~/Controls/loadControls.ascx" TagPrefix="uc1" TagName="loadControls" %>
<%@ Register Src="~/Controls/loadSideBarAdmin.ascx" TagPrefix="uc1" TagName="loadSideBarAdmin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Css/home.css" />
    <link rel="stylesheet" href="Css/admin.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%=load() %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <uc1:loadSideBarAdmin runat="server" ID="loadSideBarAdmin" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <%=loadSach() %>
  <%--  <h1 class="title">
        <asp:HyperLink runat="server" ID="HyperLink1" CssClass="title__link" Style="background-image: url(img/lbcenter.png)">
           Sách mới
        </asp:HyperLink>
    </h1>
    <div class="group_book">
        <ul>
            <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="empty.aspx?modul=tl&submodul=ts" CssClass="book">
                   <img src="img/6KCM16U4.jpg"/>
                </asp:HyperLink>
                <div class="book__item-notify">
                    <h3 class="book__item-notify-title">lịch triều tạp kỷ
                    </h3>
                    <ul class="book__item-notify-info">
                        <li>Số trang:604</li>
                        <li>Kích thước:15.5x24cm</li>
                        <li>Ngày phát hành:12-4-2004</li>
                    </ul>
                    <div class="book__item-price">
                        <span class="book__item-price-new">188.000đ</span>
                        <span class="book__item-price-old">235.000đ</span>
                    </div>
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng"  ID="btnThemGioHang" CssClass="btn"  />
                    <asp:Button runat="server" Text="Mua ngay" ID="btnMuaNgay" CssClass="btn" />
                </div>
            </li>
       </ul>
      </div>--%>
 
</asp:Content>

