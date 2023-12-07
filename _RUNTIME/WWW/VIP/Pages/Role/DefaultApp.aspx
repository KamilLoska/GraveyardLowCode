<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="DefaultApp.aspx.cs" Inherits="Role.Web.DefaultApp" %>

<%@ Register TagPrefix="role" Namespace="VSoft.Identity.Provider.WebControls.Role.Application" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <role:AppNavigation ID="m_AppNavigator" Width="100%" runat="server" />
</asp:Content>