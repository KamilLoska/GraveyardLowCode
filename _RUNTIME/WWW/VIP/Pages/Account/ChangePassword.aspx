<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="ChangePassword.aspx.cs" Inherits="Account.Web.ChangePassword" %>

<%@ Register TagPrefix="acc" Namespace="VSoft.Identity.Provider.WebControls.Account.LoginPasswordControls" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <acc:ChangePasswordNavigation ID="m_changePass" Width="100%" runat="server" />
</asp:Content>