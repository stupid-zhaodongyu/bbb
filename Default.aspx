<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
   <div class="w_710 fr" style="  width: 681px;">
         
                   

          
        <div class="t_2 mt10 clear">
            <a href="NewsList.aspx" style="color: #ffffff; width: 654px;">最新资讯</a></div>
       <asp:DataList ID="dlNews" runat="server" ForeColor="#333333" Width="680px">
           <ItemTemplate>
               <div class="content2">
                   <span class="icon1"></span><a href='<%#Eval("id","NewsInfo.aspx?id={0}")%>'>
                       <%#Eval("name").ToString().Length > 25 ? CutChar(Eval("name").ToString(), 32) + "..." : Eval("name")%>
                   </a>
               </div>
           </ItemTemplate>
       </asp:DataList></div> <div class="w_710 fr" style="  width: 681px;">
        <div class="t_2 mt10 clear">
            <a href="NewShangPinList.aspx" style="color: #ffffff; width: 654px;">最新商品</a></div><asp:DataList ID="DataList2" runat="server" Height="234px" RepeatColumns="4" Width="100%">
                <ItemTemplate>
                    <div align="center" class="product1" style="width: 153px">
                        <div class="product">
                            <table cellpadding="0" cellspacing="0" height="100%" width="100%">
                                <tbody>
                                    <tr align="center" valign="middle">
                                        <td style="height: 122px">
                                            <a class="highlightit" href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'>
                                                <img alt="" border="0" src='files/<%#Eval("ShangPinPhoto")%>' style="width: 116px;
                                                     height: 100px" /></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="ptxt">
                            <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'>
                                <%#Eval("ShangPinName").ToString().Length > 25 ? CutChar(Eval("ShangPinName").ToString(), 32) + "..." : Eval("ShangPinName")%>
                            </a>
                        </div>
                        ¥
                        <%#Eval("ShangPinPrice")%>
                        &nbsp; &nbsp; 销量：<%#Eval("ZongXiaoLiang")%>
                    </div>
                </ItemTemplate>
            </asp:DataList></div>
        
         <div class="w_710 fr" style="  width: 681px;">
        <div class="t_2 mt10 clear">
            <a href="HotShangPinList.aspx" style="color: #ffffff; width: 654px;">热门商品</a></div>
             <asp:DataList ID="DataList1" runat="server" Height="234px" RepeatColumns="4" Width="100%">
                 <ItemTemplate>
                     <div align="center" class="product1" style="width: 153px">
                         <div class="product">
                             <table cellpadding="0" cellspacing="0" height="100%" width="100%">
                                 <tbody>
                                     <tr align="center" valign="middle">
                                         <td style="height: 122px">
                                             <a class="highlightit" href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'>
                                                 <img alt="" border="0" src='files/<%#Eval("ShangPinPhoto")%>' style="width: 116px;
                                                     height: 100px" /></a></td>
                                     </tr>
                                 </tbody>
                             </table>
                         </div>
                         <div class="ptxt">
                             <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'>
                                 <%#Eval("ShangPinName").ToString().Length > 25 ? CutChar(Eval("ShangPinName").ToString(), 32) + "..." : Eval("ShangPinName")%>
                             </a>
                         </div>
                         ¥
                         <%#Eval("ShangPinPrice")%>
                         &nbsp; &nbsp; 销量：<%#Eval("ZongXiaoLiang")%>
                     </div>
                 </ItemTemplate>
             </asp:DataList></div>
</asp:Content>

