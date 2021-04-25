<%@ Control Language="C#" AutoEventWireup="true" CodeFile="adminControl.ascx.cs" Inherits="Controls_Admin_adminControl" %>
<div class="admin">
    <div class="admin__category">
        <h1>Quản lý</h1>
        <ul class="admin__category-menu">
            <li class="admin__category-item">
                <img src="../../img/arricon.png"/>

                <a class="<%=danhDau("admin", "qldmb") %> admin__category-link" href="../../empty.aspx?modul=admin&submodul=qldmb">Quản lý danh mục sách
                </a>
            </li>
            <li class="admin__category-item">
                <img src="../../img/arricon.png"/>
                <a class="<%=danhDau("admin", "qldsb") %> admin__category-link"  href="../../empty.aspx?modul=admin&submodul=qldsb">Quản lý danh sách sách
                </a>
            </li>
            <li class="admin__category-item">
                <img src="../../img/arricon.png"/>

                <a class="<%=danhDau("admin", "qldstk") %> admin__category-link"  href="../../empty.aspx?modul=admin&&submodul=qldstk">Quản lý tài khoản
                </a>
            </li>
        </ul>
    </div>
    <div class="admin__category">
        <h1>Thêm mới</h1>
        <ul class="admin__category-menu">
            <li class="admin__category-item">
                <img src="../../img/arricon.png"/>

                <a class="<%=danhDau("admin", "tmdmb") %> admin__category-link"  href="../../empty.aspx?modul=admin&&submodul=tmdmb">Thêm mới danh mục sách
                </a>
            </li>
            <li class="admin__category-item">
                <img src="../../img/arricon.png"/>

                <a class="<%=danhDau("admin", "tmb") %> admin__category-link" href="../../empty.aspx?modul=admin&&submodul=tmb">Thêm mới sách
                </a>
            </li>
        </ul>
    </div>
</div>
