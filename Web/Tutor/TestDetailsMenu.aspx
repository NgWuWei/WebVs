<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="TestDetailsMenu.aspx.cs" Inherits="Web.Tutor.TestMenu1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 46px;
        }
        .auto-style2 {
            margin-left: 36px;
        }
        .auto-style3 {
            margin-right: 0px;
            margin-top: 154px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <p>
        Test Name: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" DataKeyNames="QuestionID" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="auto-style3" Width="441px" 
                           
            >
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            
            <Columns>
                <asp:TemplateField HeaderText="Question No.">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("QuestionNumber") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtQuestionNumber" Text='<%# Eval("QuestionNumber") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewQuestionNumber" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Question Description">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("QuestionDesc") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtQuestionDesc" Text='<%# Eval("QuestionDesc") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewQuestionDesc" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Correct Answer">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("CorrectAnswer") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtCorrectAnswer" Text='<%# Eval("CorrectAnswer") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewCorrectAnswer" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Each Question Result">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("EachQuestionResult") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtEachQuestionResult" Text='<%# Eval("EachQuestionResult") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewEachQuestionResult" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Resources/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/Resources/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                   </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Resources/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/Resources/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/addnew.png" runat="server" NavigateUrl="~/Tutor/AddTestMenu.aspx" ToolTip="Add New" Width="20px" Height="20px"/>
                     </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" CssClass="auto-style1">
        <div style="text-align:center">
            <h3>Ready to give your Test?</h3>
            <br />
            <asp:Button ID="Assignbtn" runat="server" Text="Assign" CssClass="auto-style2" />
        </div>
        
    </asp:Panel>
</asp:Content>
