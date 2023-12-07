<%@ Page Title="Documents" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/WithoutHeader.Master" Inherits="VBP_WebUI.Pages.RelationElement" CodeBehind="RelationElement.aspx.cs" %>

<%@ Register TagPrefix="form" Namespace="VSoft.BusinessPlatform.Web.Controls.Specific" Assembly="VSoft.BusinessPlatform.Web" %>
<%@ Register TagPrefix="std" Namespace="VSoft.BusinessPlatform.Web.Controls.Navigation" Assembly="VSoft.BusinessPlatform.Web" %>
<%@ Register TagPrefix="nav" Namespace="VSoft.BusinessPlatform.Common.Web.Controls.Navigation.PageNavigation" Assembly="VSoft.BusinessPlatform.Common.Web" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="head">
   <asp:PlaceHolder runat="server" ID="m_conHead" />
</asp:Content>
<asp:Content runat="server" ID="ContentPlaceHolder" ContentPlaceHolderID="MC">
   <sec:VBPSecurityControl ID="m_se" AvoidDoubleClick="true" runat="server" />
   <std:VbpCustomControlNavigator runat="server" ID="m" NaviBarCss="CSS_Navigator" MainTableCellPadding="0" MainTableCellSpacing="0" EnableNavigateBar="false" NavigateBarVisible="false">
      <nav:NavigateControl Title="<%=VSoft.BusinessPlatform.Application.Contracts.Localization.Lista%>" TypeName="VSoft.BusinessPlatform.Web.Navigation.NavigableListViewer" Assembly="VSoft.BusinessPlatform.Web" />
      <nav:NavigateControl Title="<%=VSoft.BusinessPlatform.Application.Contracts.Localization.Szczegoly%>" TypeName="VSoft.BusinessPlatform.Web.Navigation.NavigableFormViewer" Assembly="VSoft.BusinessPlatform.Web" />
      <nav:NavigateControl Title="<%=VSoft.BusinessPlatform.Application.Contracts.Localization.PodgladProcesu%>" TypeName="VSoft.BusinessPlatform.Web.Navigation.NavigableWorkflowViewer" Assembly="VSoft.BusinessPlatform.Web" />
      <nav:NavigateControl Title="<%=VSoft.BusinessPlatform.Application.Contracts.Localization.CustomViewer%>" TypeName="VSoft.BusinessPlatform.Web.Navigation.WelcomePageViewer" Assembly="VSoft.BusinessPlatform.Web" />
   </std:VbpCustomControlNavigator>
   <div class="CSS_RelationElement_Actions" id="ActionPanel" runat="server">
      <form:RelationChangeAcceptButton ID="m_btnOk" runat="server" />
      <form:RelationChangeCancelButton ID="m_btnCancel" runat="server" />
   </div>
</asp:Content>