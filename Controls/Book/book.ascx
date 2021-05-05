<%@ Control Language="C#" AutoEventWireup="true" CodeFile="book.ascx.cs" Inherits="Controls_Book_book" %>
<div class="book__info">
   <%=loadSach() %>
    <p class="right__info-right-quantity">Số lượng</p>
                <p class="right__info-right-input">
                    <input disabled type="text" class="input-quality" value="1" />
                    <span class="right__info-right-group">
                        <a  href="javascript:up();" class="icon-up" ></a>
                        <a href="javascript:down();" class="icon-down"></a>
                    </span>
                    <span class="right_-info-right-group-btn">
                        <%--<asp:Button ID="Button1" runat="server" CssClass="btnThemGioHang btn" Text="Button" />--%>
                        <button runat="server" type="button" class="btnThemGioHang btn">Thêm vào giả hàng</button>
                        <button type="button" runat="server" class="btnMuaNgay btn">Mua ngay</button>
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

