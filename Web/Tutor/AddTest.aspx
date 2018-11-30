<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddTest.aspx.cs" Inherits="Web.Tutor.AddTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-left: 387px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" ClientIDMode="Static"  runat="server">
        <ContentTemplate>
        <div style="width:100%  ;height:1000px">
            Create New Test Here : -<br /> <br />
            <table class="auto-style2">
            <asp:Repeater ID="Repeater1" runat="server" >
                <HeaderTemplate >

                        <tr >
                            <td >
                                <asp:TextBox ID="text1" runat="server" Text="Subject Name" BackColor="#cc0000"  ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                            <td >
                                <asp:TextBox ID="text2" runat="server" Text="Subject Status" BackColor="#cc0000"   ForeColor="White" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>

                        </tr>

                    </HeaderTemplate>

                    <ItemTemplate>

                        <tr>
                            <td>
                                <asp:TextBox ID="t1" runat="server" Text='<%# Eval("Subject") %>' BackColor="white" ForeColor="black" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>                             
                            <td>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Status") %>' BackColor="white" ForeColor="black" Font-Bold="true" ReadOnly="true"></asp:TextBox></td>
                        </tr>

                    </ItemTemplate>
            </asp:Repeater>
                
                </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Exam]">
            </asp:SqlDataSource>
            <br />
            <div >

                <table align="center" style="color:black">

                <tr>
                    <td style="width: 257px;text-align:right"> Add New Test : &nbsp; </td>
                    <td><asp:TextBox ID="TxtAddCat" runat="server" Height="22px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 257px;text-align:right"><br /> Privacy : &nbsp;</td>
                    <td><br /> <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Selected="True">Public</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                    </asp:DropDownList>

                    </td>
                </tr> 
                <tr>
                    <td >
                        <asp:Label ID="Messagelbl" runat="server"  ></asp:Label>
                    </td>
                    <td >
                        <br /><asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Add" BackColor="#cc0000"   BorderColor="black" Width="150px" />
                    </td>
                </tr>
                        </div>
            </table>
        </div>
       </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
