<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Designer.ascx.cs" Inherits="Attribute.Web.Controls.Designer" %>

<script type="text/javascript">    
    var _objectType = '<%= _objectType %>'; //global variable, has to be loaded on ascx because uses server tags to fetch value.

    $('#tabs').ready(function() {
        assignResourceMessagesforObjects();
        logLocalized("RenderingInProgress", LogTypeEnum.Info, 'outputTabs1');
        loadLayout(_objectType, function() {
            loadAttributes(_objectType, function() {
                logLocalized("Done", LogTypeEnum.Info, 'outputTabs1');
            })
        });
    })
</script>

<div id="tabs">
    <ul>
        <li id="tab1_title"><a href="#tabs-1"><span>Design</span></a></li>
        <li id="tab2_title"><a href="#tabs-2"><span>Preview</span></a></li>
    </ul>
    <div id="tabs-1">        
        <table><tr valign = "top"><td>
    
            <table width="250px" id="controlTable" class="controlTable">                
	            <tr>
	                <td width="100%" colspan="3" class="attributesCell" >	    
	                    <div class="column" id="controlColumn" />
	                </td>
	            </tr>		
	            <tr>
	                <td width="45%"><input type="button" id="addDivided" value="Divided" class="CSS_Button" /></td>
	                <td width="10%" />
	                <td width="45%"><input type="button" id="addDividedGroup" value="Divided group" class="CSS_Button" /></td>	    
	            </tr>    
	            <tr>
	                <td><input type="button" id="addWide" value="Wide" class="CSS_Button" /></td>
	                <td width="10%" />
	                <td><input type="button" id="addWideGroup" value="Wide group" class="CSS_Button" /></td>
	            </tr>
	            <tr>
	                <td colspan="3" class="bottomBorderCell"></td>
	            </tr> 
	            <tr>	        
                    <td align="left" colspan="3">
                        <input type="button" id="saveState" value="Save" class="CSS_Button" />
                    </td>
                </tr>
	            <tr>	        
                    <td align="left" colspan="3">
                        <input type="button" id="help" value="Help" class="CSS_Button" />
                    </td>
                </tr>                
                <tr>
                    <td valign="top" style="height:140px" colspan="3">
                        <div id="helpBox">            	        
	                        <table class="helpTable">	        
	                            <tr style="height:30px">
	                                <td width="130px" colspan="2" style="background-color:#f0f0f0">&nbsp;</td>	  	                        
	                                <td width="1px" />  
	                                <td width="120px" id="helpWideNonGrouping" class="content">wide non grouping</td>	    
                                </tr>
                                <tr style="height:30px">
                                    <td colspan="2" style="background-color:#66ccff">&nbsp;</td>	  
                                    <td />  
                                    <td id="helpWideGrouping" class="content">wide grouping</td>	    
                                </tr>
                                <tr style="height:30px">
                                    <td style="background-color:#f0f0f0">&nbsp;</td>	  
                                    <td style="background-color:#f0f0f0">&nbsp;</td>
                                    <td />  
                                    <td id="helpDividedNonGrouping" class="content">divided non grouping</td>	    
                                </tr>
                                <tr style="height:30px">
                                    <td style="background-color:#66ccff">&nbsp;</td>	  
                                    <td style="background-color:#66ccff">&nbsp;</td>	  
                                    <td />  
                                    <td id="helpDividedGrouping" class="content">divided grouping</td>	    
                                </tr>
                            </table> 
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom" colspan="3">
                        <asp:Button ID="back" runat="server" CssClass="CSS_Button" OnClick="back_Click" />
                    </td>
                </tr>        
            </table>

            </td><td>

            <table class="coreTable" width="500px" id="coreTable">
                <tr />   
            </table>

        </td></tr></table>
             
        <div class="log" id="outputTabs1"></div>   
    </div>
    
    <div id="tabs-2">        
        <div id="attributesListContent"></div>  <!-- uwaga na domykanie znacznika div -->        
        
        <div class="log" id="outputTabs2"></div>
    </div>
</div>
