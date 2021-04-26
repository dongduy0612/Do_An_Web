<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageTrangChu.master" AutoEventWireup="true" CodeFile="empty.aspx.cs" Inherits="empty" %>

<%@ Register Src="~/Controls/loadControls.ascx" TagPrefix="uc1" TagName="loadControls" %>
<%@ Register Src="~/Controls/loadSideBarAdmin.ascx" TagPrefix="uc1" TagName="loadSideBarAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="Css/emptys.css"/>
    <link rel="stylesheet" href="Css/admin.css"/>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:Literal runat="server" ID="ltrLoadStatus"></asp:Literal>--%>
    <%=load() %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <uc1:loadSideBarAdmin runat="server" ID="loadSideBarAdmin" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <uc1:loadControls runat="server" ID="loadControls" />
</asp:Content>

