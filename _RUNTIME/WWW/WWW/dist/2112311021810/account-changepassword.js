(()=>{ShowSummaryMessages=function(i,n,a){a==null||a.length==0||a.forEach(t=>{n=="E"?$("#"+i).kendoNotification({hideOnClick:!1,autoHideAfter:0,appendTo:"#"+i}).data("kendoNotification").error(t):n=="W"?$("#"+i).kendoNotification({hideOnClick:!1,autoHideAfter:0,appendTo:"#"+i}).data("kendoNotification").warning(t):n=="S"?$("#"+i).kendoNotification({hideOnClick:!1,autoHideAfter:0,appendTo:"#"+i}).data("kendoNotification").info(t):n=="I"&&$("#"+i).kendoNotification({hideOnClick:!1,autoHideAfter:0,appendTo:"#"+i}).data("kendoNotification").success(t)})};InitPasswordEye=function(i){let a=$(`#${i}`).parent();a.addClass("k-input-icon"),a.append("<span class='k-icon k-icon-24 k-i-preview'><span class='k-icon k-icon-24 k-i-line'/></span>");let t=$(".k-icon.k-i-line",a);$(".k-icon.k-i-preview",a).click(()=>{t.toggleClass("k-i-line");let e=$("input",a);e.attr("type",e.attr("type")==="password"?"text":"password")})};$(document).ready(function(){$("form").kendoValidator({rules:{equalto:function(i){if(i.filter("[data-val-equalto-other]").length){var n=i.attr("data-val-equalto-other");return n=n.substr(n.lastIndexOf(".")+1),i.val()==$(`input[name = ${n}]`).val()}return!0}},messages:{equalto:function(i){return i.attr("data-val-equalto")}}})});})();
