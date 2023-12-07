<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="Hierarchy.Web.Pages.UnitType.Default" %>

<%@ Register TagPrefix="hrc" Namespace="VSoft.Identity.Provider.WebControls.HierarchyModule.UnitType" Assembly="VSoft.Identity.Provider.WebControls" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <hrc:UnitTypeNavigationControl ID="UnitTypeNavControl1" Width="100%" runat="server" />
</asp:Content>