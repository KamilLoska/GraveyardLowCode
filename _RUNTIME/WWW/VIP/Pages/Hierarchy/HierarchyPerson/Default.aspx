<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="Hierarchy.Web.Pages.HierarchyPerson._default" %>

<%@ Register TagPrefix="hrc" Namespace="VSoft.Identity.Provider.WebControls.HierarchyModule.HierarchyPerson" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <hrc:HierarchyPersonNavigationControl ID="HierarchyPersonNavigationControl1" Width="100%" runat="server" />
</asp:Content>