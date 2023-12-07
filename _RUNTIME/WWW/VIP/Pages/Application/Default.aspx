<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="Application.Web._Default" %>

<%@ Register TagPrefix="app" Namespace="VSoft.Identity.Provider.WebControls.Application" Assembly="VSoft.Identity.Provider.WebControls" %>
<%@ OutputCache Location="None" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <app:NavigationControl ID="m_navigator" Width="100%" runat="server" />
</asp:Content>