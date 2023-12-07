<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="ProfileToHierarchy.Web._Default" %>

<%@ Register TagPrefix="pth" Namespace="VSoft.Identity.Provider.WebControls.ProfileToHierarchy" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <pth:ProfileToUnitNavigation ID="ProfileToUnitNavigation1" Width="100%" runat="server" />
</asp:Content>