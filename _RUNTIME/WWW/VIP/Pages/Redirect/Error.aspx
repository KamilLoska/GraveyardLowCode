<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" MasterPageFile="~/Simple.Master"
   Inherits="UserIntegration.Web.Pages.Redirect.Error" %>

<%@ Register TagPrefix="swc" Namespace="VExceptionHandler" Assembly="VSoft.Framework.AuthorizationProviders.Impl.Web" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
   <link href="../../Css/WebBlue/Layout/VehStandard.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <table width="100%">
      <tr>
         <td class="VEH_Text_" width="100%">
            <swc:ExceptionHandler ID="m_ctlError" runat="server" Width="100%" CSS_Message="VEH_Legend"
               CSS_DivInfo="VEH_TitleWOPadding_" CSS_Table="VEH_Control_" CSS_Title="VEH_LabelError_" />
         </td>
      </tr>
   </table>
</asp:Content>