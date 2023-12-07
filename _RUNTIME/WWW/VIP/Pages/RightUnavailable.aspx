<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="RightUnavailable.aspx.cs" Inherits="UserIntegration.Web.Pages.RightUnavailable" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <table width="100%">
      <tr>
         <td align="center">
            <asp:Label ID="m_RighUnavaible" CssClass="CSS_Red" runat="server"></asp:Label>
         </td>
      </tr>
      <tr>
         <td align="center">
            <asp:Button ID="m_LoginButton" runat="server" OnClientClick="window.top.location.href='../VIP.SignOn'; return false;" /></td>
      </tr>
   </table>
</asp:Content>