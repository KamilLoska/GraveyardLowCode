<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="UserIntegration.Web._Default" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td height="38px">&nbsp;</td>
         <td>&nbsp;</td>
      </tr>
      <tr>
         <td class="CSS_WelcomeTD1">
            <table style="word-break: break-all" width="400px" border="0" cellspacing="0" cellpadding="0" align="center">
               <tr valign="top">
                  <th colspan="2" class="CSS_Title"><%= Resources_Welcome%></th>
               </tr>
               <tr valign="top">
                  <td width="50%" class="CSS_Label"><%= Resources_Loged%></td>
                  <td class="CSS_Text"><%= UserFullName%></td>
               </tr>
               <tr valign="top">
                  <td class="CSS_Label"><%= Resources_Login%></td>
                  <td class="CSS_Text"><%= UserLogin%></td>
               </tr>
               <tr valign="top">
                  <td class="CSS_Label"><%= Resources_Roles%></td>
                  <td class="CSS_Text"><%= UserRoles%></td>
               </tr>
               <tr valign="top">
                  <td class="CSS_Label"><%= Resources_LoginDate%></td>
                  <td class="CSS_Text"><%= UserLoginDate%></td>
               </tr>
               <tr valign="top">
                  <td class="CSS_Label"><%= Resources_BadLoginDate%></td>
                  <td class="CSS_Text"><%= LastFailureLoginDate%></td>
               </tr>
               <tr valign="top">
                  <td class="CSS_Label"><%= Resources_PasswordExpirationDate%></td>
                  <td class="<%= CssStyleUserPasswordExpirationDate%>"><%= UserPasswordExpirationDate%></td>
               </tr>
            </table>
         </td>
         <td class="CSS_WelcomeTD2" />
      </tr>
   </table>
</asp:Content>