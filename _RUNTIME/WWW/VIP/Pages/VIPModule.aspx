<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="VIPModule.aspx.cs" Inherits="UserIntegration.Web.Pages.VipModule" %>
<%@ Register assembly="VSoft.Framework.Web" namespace="VSoft.Framework.Web.WebControls" tagprefix="vfw" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title><%= SelectedModuleTitle %></title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
    <vfw:VFrameControl ID="_mVSFrame" ShowScroll=true style="height:650px;width:900px" ResizeHeightToConntent=false runat="server" />

</asp:Content>