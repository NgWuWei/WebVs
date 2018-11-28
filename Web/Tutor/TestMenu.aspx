<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="TestMenu.aspx.cs" Inherits="Web.Tutor.TestMenu2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" DataKeyNames="QuestionID" style="text-align:center" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="auto-style3" Width="441px" 
                           
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
                <asp:TemplateField HeaderText="Test Name">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("TestName") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtTestName" Text='<%# Eval("TestName") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewTestName" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Total Question No.">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("TotalQuestionNumber") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtTotalQuestionNumber" Text='<%# Eval("TotalQuestionNumber") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewTotalQuestionNumber" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Total Score">
                    <ItemTemplate>
                         <asp:Label Text='<%# Eval("QuestionResult") %>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="txtQuestionResult" Text='<%# Eval("QuestionResult") %>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="txtNewQuestionResult" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Resources/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/Resources/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/Resources/assign.png" runat="server" ToolTip="Assign" Width="20px" Height="20px"  />
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
    <div style="text-align:center">  
     </div>
</asp:Content>
