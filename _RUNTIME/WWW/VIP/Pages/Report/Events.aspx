<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Events.aspx.cs" Inherits="UserIntegration.Web.Pages.Report.Events" %>

<%@ Register TagPrefix="rep" Namespace="VSoft.Identity.Provider.WebControls.UserIntegrationModule.Report" Assembly="VSoft.Identity.Provider.WebControls" %>
<%@ OutputCache Location="None" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <rep:NavigationControl ID="m_navigator" Width="100%" runat="server" />
</asp:Content>