<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MAIS/Default.Master" Inherits="VSoft.Framework.AuthorizationProviders.VIPProvider.Web.ChangeUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <br>
   <br>
   <br>
   <table cellpadding="0" cellspacing="0" border="0" style="width: 400px; margin-left: 50px;" align="center">
      <tr>
         <td>
            <asp:DropDownList runat="server" ID="m_ddlProfileLst" Style="width: 250px;" SkinID="ChangeProfileDD"></asp:DropDownList></td>
         <td>
            <asp:Button runat="server" ID="m_btCheckProfile" SkinID="ChangeProfileButton" /></td>
      </tr>
      <tr>
         <td></td>
         <td>
            <asp:Button runat="server" ID="m_btBack" SkinID="ReturnButton" /></td>
      </tr>
   </table>
</asp:Content>