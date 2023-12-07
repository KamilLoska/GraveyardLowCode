<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="NewUserWizard.aspx.cs" Inherits="UserIntegration.Web.Pages.Wizard.NewUserWizard" %>

<%@ Register Assembly="VSoft.Framework.Web" Namespace="VSoft.Framework.Web.WebControls" TagPrefix="vfw" %>
<%@ Register TagPrefix="wiz" Namespace="VSoft.Identity.Provider.WebControls.UserIntegrationModule.Wizard" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <vfw:UserMessagesControl runat="server" ID="_userMessages" />
   <wiz:NewUserWizardNavigation ID="m_navigator" Width="100%" runat="server" />
</asp:Content>