<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MAIS/Default.Master" Inherits="VSoft.Framework.AuthorizationProviders.VIPProvider.Web.LogOn" %>

<%@ Register TagPrefix="empty" Namespace="VSoft.Framework.Web.WebControls" Assembly="VSoft.Framework.Web" %>
<%@ Register TagPrefix="commoncontrols" Namespace="VSoft.Framework.AuthorizationProviders.Impl.Web.CommonControls" Assembly="VSoft.Framework.AuthorizationProviders.Impl.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_headContentPlaceHolder" runat="server">
   <title>VIP</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_mainContentPlaceHolder" runat="server">
   <br />
   <br />
   <br />
   <table cellpadding="0" cellspacing="0" border="0" align="center">
      <tr>
         <td>
            <empty:PageValidatorSummaryExt ID="m_PagevalidatorsummaryText" ValidatorAsTableRow="true" runat="server"></empty:PageValidatorSummaryExt>
            <empty:EmptyControl ID="m_emptyControl" Visible="true" runat="server"></empty:EmptyControl>
         </td>
      </tr>
      <tr>
         <td align="center">
            <commoncontrols:LogOnControl ID="m_logOnControl" runat="server" OnLoggedIn="LogOnControlLoggedIn" OnLoginError="LogOnControlLogginError" DisplayRememberMe="false"
               SkinID="LogOnCtrl" />
         </td>
      </tr>
      <tr>
          <td  style="padding:20px 0">
              <div runat="server" style="border-top: 1px solid #ddd; padding:10px 0; width:310px; font-size:12px; display:none">
                       <asp:Literal ID="m_defaultCredentialsInfo" runat=server/>
                  </div>
          </td>
      </tr>
   </table>
</asp:Content>