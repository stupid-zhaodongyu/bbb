<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ly.aspx.cs" Inherits="ly" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <DIV class=main style="width: 713px">

<DIV class=cases>
<H2> 留言中心 </H2>
<DIV class="casePic5 nb">
<UL>
    <table id="Table4" border="0" cellpadding="1" cellspacing="0" style="width: 612px; font-size: 12px;">
        <tr>
            <td style="width: 16%">
                留言类别：</td>
            <td align="left">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    Width="163px">
                    <asp:ListItem>在线咨询</asp:ListItem>
                    <asp:ListItem>意见反馈</asp:ListItem>
                    <asp:ListItem>其他</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
                    <tr>
                        <td style="width: 16%">
                            <font face="宋体">您的姓名:</font></td>
                        <td align="left">
                            <asp:TextBox ID="TextBox1" runat="server" EnableViewState="False" ValidationGroup="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="必须填写" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 16%">
                            <font face="宋体">你的E_mail:</font></td>
                        <td align="left">
                            <asp:TextBox ID="TextBox2" runat="server" EnableViewState="False" ValidationGroup="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="必须填写" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 16%">
                            <font face="宋体">发表内容:</font></td>
                        <td align="left">
                            <asp:TextBox ID="TextBox3" runat="server" EnableViewState="False" Height="112px"
                                TextMode="MultiLine" Width="320px" ValidationGroup="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                ErrorMessage="必须填写" ValidationGroup="2"></asp:RequiredFieldValidator></td>
                    </tr>
        <tr>
            <td colspan="2" style="height: 19px" valign="top">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="确认" /></td>
        </tr>
                </table>
  
 </UL>
    <div style=" text-align:left">   <asp:DataList ID="DataList1" runat="server" Width="707px">
                    <ItemTemplate>
                        
                            <table id="Table6" border="0" cellpadding="1" cellspacing="0" style="width: 607px; border-bottom: #ffffff 0.1mm solid;">
                                <tr>
                                    <td>
                                        姓名:
                                        <asp:Label ID="Label1" runat="server" ForeColor="Maroon" Text='<%# DataBinder.Eval(Container, "DataItem.username") %>'></asp:Label>发布时间：<asp:Label ID="Label4" runat="server" ForeColor="Maroon" Text='<%# DataBinder.Eval(Container, "DataItem.Addtime") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                       内容:
                                        <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.lybcontent") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td height="16">
                                     回复:
                                        <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.lyhuifu") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                     
                    </ItemTemplate>
                </asp:DataList> </div> 
                
                <div>    共【<asp:Label ID="lblSumPage" runat="server"></asp:Label>】页 &nbsp; &nbsp;&nbsp; 当前第【<asp:Label
                    ID="lblCurrentPage" runat="server"></asp:Label>】页&nbsp;
                <asp:HyperLink ID="hyfirst" runat="server">首页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="lnkPrev" runat="server">上一页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:HyperLink ID="lnkNext" runat="server">下一页</asp:HyperLink>
                &nbsp;&nbsp;
                <asp:HyperLink ID="hylastpage" runat="server">尾页</asp:HyperLink></div>
                
                </DIV>
</DIV></DIV>   
</asp:Content>

