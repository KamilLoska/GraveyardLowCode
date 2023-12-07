<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="ErrorView.aspx.cs" Inherits="Role.Web.Pages.ErrorView" %>

<%@ Register TagPrefix="swc" Namespace="VExceptionHandler" Assembly="VSoft.Framework.AuthorizationProviders.Impl.Web" %>

<asp:Content ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
   <link href="~/Css/WebBlue/Layout/VehStandard.css" type="text/css" rel="stylesheet" id="_vehStyle" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <table width="100%">
      <tr>
         <td class="VEH_Text_" width="100%">
            <swc:ExceptionHandler ID="m_ctlError" runat="server" Width="100%" CSS_Message="VEH_Legend"
               CSS_DivInfo="VEH_TitleWOPadding_" CSS_Table="VEH_Control_" CSS_Title="VEH_LabelError_" />
         </td>
      </tr>
   </table>
</asp:Content>