﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsTypeList.aspx.cs" Inherits="NewsTypeList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><div id="topic" style="background-image: url(Images/bar_bg1.gif); background-repeat: repeat-x; font-size: 15px; color: #ffffff;">
                                    &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tbody>
                <tr>
                    <td align="left" bgcolor="#fbfbfb" class="middle_border_1 margin_middle1" style="width: 661px">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                            Width="699px">
                            <ItemTemplate>
                                <table id="Table8" runat="server" border="0" cellpadding="1" cellspacing="0" style="width: 661px">
                                    <tr>
                                        <td align="left" style="width: 329px">
                                         【<a href='<%#Eval("TypeName","NewsTypeList.aspx?TypeName={0}")%>'>
                                        <%#Eval("TypeName").ToString().Length > 25 ? CutChar(Eval("TypeName").ToString(), 32) + "..." : Eval("TypeName")%>
                                    </a>】
                                        <a href='<%#Eval("id","NewsInfo.aspx?id={0}")%>'>
                                        <%#Eval("name").ToString().Length > 25 ? CutChar(Eval("name").ToString(), 32) + "..." : Eval("name")%>
                                    </a> </td>
                                        <td align="center" style="width: 140px">
                                            <asp:Label ID="Label2" runat="server" Height="20px" Text='<%# DataBinder.Eval(Container, "DataItem.Addtime") %>'
                                                Width="193px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#fbfbfb" class="middle_border_1 margin_middle1" style="width: 661px;
                        height: 38px">
                        共【<asp:Label ID="lblSumPage" runat="server"></asp:Label>】页 &nbsp; &nbsp; &nbsp;
                        当前第【<asp:Label ID="lblCurrentPage" runat="server"></asp:Label>】页&nbsp;
                        <asp:HyperLink ID="hyfirst" runat="server">首页</asp:HyperLink>
                        &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="lnkPrev" runat="server">上一页</asp:HyperLink>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:HyperLink ID="lnkNext" runat="server">下一页</asp:HyperLink>
                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:HyperLink ID="hylastpage" runat="server">尾页</asp:HyperLink>
                    </td>
                </tr>
            </tbody>
        </table>
</asp:Content>

