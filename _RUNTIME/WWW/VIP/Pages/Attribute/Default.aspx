<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="Attribute.Web._Default"
   EnableEventValidation="false" %>

<%@ Register TagPrefix="att" Namespace="VSoft.Identity.Provider.WebControls.Attribute.Attribute" Assembly="VSoft.Identity.Provider.WebControls" %>
<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <att:AttributeNavigationControl ID="AttributeNavigationControl1" Width="100%" runat="server" />
</asp:Content>