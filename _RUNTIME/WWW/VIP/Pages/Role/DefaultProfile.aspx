<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="DefaultProfile.aspx.cs" Inherits="Role.Web.DefaultProfile" EnableEventValidation="false" %>

<%@ Register TagPrefix="prof" Namespace="VSoft.Identity.Provider.WebControls.Role.Profile" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <prof:ProfileNavigation ID="m_ProfileNavigator" Width="100%" runat="server" />
</asp:Content>