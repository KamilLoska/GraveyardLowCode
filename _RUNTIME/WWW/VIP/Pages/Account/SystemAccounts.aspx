<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="SystemAccounts.aspx.cs" Inherits="Account.Web.SystemAccounts" %>

<%@ Register TagPrefix="acc" Namespace="VSoft.Identity.Provider.WebControls.Account" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <acc:SystemAccountNavigation ID="m_navigator" Width="100%" runat="server" />
</asp:Content>