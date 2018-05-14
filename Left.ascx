<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Left.ascx.cs" Inherits="Left" %>

                      
                                <div class="t_1"><div><a href="#">商品分类</a></div></div>
                    <div class="f_2 pa15 mb10">
                        <ul class="list_2 list_ico_1">
                   
                  <asp:DataList ID="DataList1" runat="server" ForeColor="#333333" Width="159px">
        <ItemTemplate>
          <LI>   <a href='<%#Eval("id","ShangPinTypeList.aspx?id={0}")%>'>
                <%#Eval("name").ToString().Length > 15 ? CutChar(Eval("name").ToString(), 15) + "..." : Eval("name")%>
            </a></LI>
        </ItemTemplate>
    </asp:DataList>
                        </ul>
                    </div>
                                 