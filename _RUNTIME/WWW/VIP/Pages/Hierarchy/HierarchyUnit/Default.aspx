<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="Hierarchy.Web.Pages.HierarchyUnit.Default" %>

<%@ Register TagPrefix="hrc" Namespace="VSoft.Identity.Provider.WebControls.HierarchyModule.HierarchyUnit" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <hrc:HierarchyUnitNavigationControl ID="UnitHierarchyNavControl1" Width="100%" runat="server" />
</asp:Content>