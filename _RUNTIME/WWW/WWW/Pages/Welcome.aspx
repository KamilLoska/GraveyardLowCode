<%@ Page Title="Welcome" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Site.Master" Inherits="VBP_WebUI.Pages.Welcome" CodeBehind="Welcome.aspx.cs" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="head">
   <asp:PlaceHolder runat="server" ID="m_conHead" />
</asp:Content>
<asp:Content runat="server" ID="ContentPlaceHolder" ContentPlaceHolderID="MC">
   <div class="page-container">
      <div class="page-head">
         <div class="page-title">
            <h2>
               <%=VSoft.BusinessPlatform.Application.Contracts.Localization.Welcome%>
            </h2>
         </div>
      </div>
      <div class="page-content">
         <div class="row">
            <div class="col-xs-12">
               <div class="portlet welcome">
                  <div class="portlet-wrapper">
                     <div class="portlet-title">
                        <div class="caption">
                           <span class="caption-subject font-green-sharp bold uppercase"><%=VSoft.BusinessPlatform.Application.Contracts.Localization.DefaultAppPage%></span>
                        </div>
                     </div>
                     <div class="portlet-content">
                        <div class="a-disp-ib">
                           <%=VSoft.BusinessPlatform.Application.Contracts.Localization.DefaultAppPageContent%>
                        </div>
                        <div class="a-disp-ib vbp-img">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>