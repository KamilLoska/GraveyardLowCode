<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="Hierarchy.Web.Pages.HierarchyImportExport._default" %>

<%@ Register TagPrefix="hrc" Namespace="VSoft.Identity.Provider.WebControls.HierarchyModule.HierarchyImportExport" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <hrc:HierarchyImportExportNavigationControl ID="HierarchyImportExportNavigationControl1" Width="100%" runat="server" />
</asp:Content>