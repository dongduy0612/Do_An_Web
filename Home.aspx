<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageTrangChu.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Css/home.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Literal runat="server" ID="ltrLoginRegister"></asp:Literal>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <h1 class="title">
        <asp:HyperLink runat="server" ID="HyperLink1" CssClass="title__link" Style="background-image: url(img/lbcenter.png)">
           Sách mới
        </asp:HyperLink>
    </h1>
    <div class="group_book">
        <ul>
            <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="btnThemGioHang" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="btnMuaNgay" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button1" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button2" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button3" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button4" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button5" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button6" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button7" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button8" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button9" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button10" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button11" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button12" CssClass="btn" />
                </div>
            </li>
        </ul>
    </div>
    <h1 class="title">
        <asp:HyperLink runat="server" ID="HyperLink2" CssClass="title__link" Style="background-image: url(img/lbcenter.png)">
           Sách bán chạy
        </asp:HyperLink>
    </h1>
    <div class="group_book">
        <ul>
            <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button13" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button14" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button15" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button16" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button17" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button18" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button19" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button20" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button21" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button22" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button23" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button24" CssClass="btn" />
                </div>
            </li>
              <li class="book__item">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="book">
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
                    <asp:Button runat="server" Text="Thêm vào giỏ hàng" ID="Button25" CssClass="btn" />
                    <asp:Button runat="server" Text="Mua ngay" ID="Button26" CssClass="btn" />
                </div>
            </li>
        </ul>
    </div>
</asp:Content>

