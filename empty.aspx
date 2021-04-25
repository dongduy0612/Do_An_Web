<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageTrangChu.master" AutoEventWireup="true" CodeFile="empty.aspx.cs" Inherits="empty" %>

<%@ Register Src="~/Controls/loadControls.ascx" TagPrefix="uc1" TagName="loadControls" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="Css/empty.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <uc1:loadControls runat="server" ID="loadControls" />
</asp:Content>

