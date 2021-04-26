<%@ Control Language="C#" AutoEventWireup="true" CodeFile="book.ascx.cs" Inherits="Controls_Book_book" %>
<div class="book__info">
    <img src="../../img/6KCM16U4.jpg" class="book__info-left" />
    <div class="book__info-right">
        <h1>Lịch Triều Tạp Kỹ</h1>
        <div class="book__info-right-left">
            <ul>
                <li class="book__info-right-item">
                    <span>Mã sản phẩm</span>
                    <span class="book__info-right-properties">123456</span>
                </li>
                <li class="book__info-right-item">
                    <span>Tác giả</span>
                    <span class="book__info-right-properties">Cao lăng biên soạn</span>
                </li>
                <li class="book__info-right-item">
                    <span>Dịch giả</span>
                    <span class="book__info-right-properties">Hoa bằng,Hoàng Văn Lâu</span>
                </li>
                <li class="book__info-right-item">
                    <span>Nhà xuất bản</span>
                    <span class="book__info-right-properties">Hội nhà văn</span>
                </li>
                <li class="book__info-right-item">
                    <span>Số trang</span>
                    <span class="book__info-right-properties">604</span>
                </li>
                <li class="book__info-right-item">
                    <span>Ngày phát hành</span>
                    <span class="book__info-right-properties">12-4-2021</span>
                </li>
            </ul>
            <div class="book__info-right-right">
                <p class="book__info-right-price-old">Giá bìa: <span>235.000đ</span></p>
                <p class="book__info-right-price-new">Giá Nhã Nam:<span>180.000đ</span></p>
                <p class="right__info-right-quantity">Số lượng</p>
                <p class="right__info-right-input">
                    <input disabled type="text" class="input-quality" value="1" />
                    <span class="right__info-right-group">
                        <a  href="javascript:up();" class="icon-up" ></a>
                        <a href="javascript:down();" class="icon-down"></a>
                    </span>
                    <span class="right_-info-right-group-btn">
                        <button  type="button" class="btnThemGioHang btn">Thêm vào giả hàng</button>
                        <button type="button" class="btnMuaNgay btn">Mua ngay</button>
                    </span>

                </p>
            </div>
        </div>
        
    </div>
    <script language="javascript" type="text/javascript">     
        var value = document.querySelector(".input-quality").getAttribute("value");
        function up() {
            ++value;
            document.querySelector(".input-quality").setAttribute("value", value);
        }
        function down() {
           
            if (value == 1)
            { }
            else
            --value;            
            document.querySelector(".input-quality").setAttribute("value", value);
        }
        
</script>
</div>

