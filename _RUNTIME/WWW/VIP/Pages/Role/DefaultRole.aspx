<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="DefaultRole.aspx.cs" Inherits="Role.Web.DefaultRole" %>

<%@ Register TagPrefix="role" Namespace="VSoft.Identity.Provider.WebControls.Role.Role" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <role:RoleNavigation ID="m_RoleNavigator" Width="100%" runat="server" />
</asp:Content>