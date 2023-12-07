<%@ Page Title="Error page" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/SafeHeaderSite.Master" Inherits="VBP_WebUI.Pages.ErrorPage" CodeBehind="ErrorPage.aspx.cs" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="ContentPlaceHolder" ContentPlaceHolderID="MC">
   <asp:PlaceHolder runat="server" ID="Content"></asp:PlaceHolder>
   <script>$(function ($) { window.frameElement && $(window.frameElement).height($('body').height()); });</script>
</asp:Content>