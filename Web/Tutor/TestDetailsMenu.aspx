<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="TestDetailsMenu.aspx.cs" Inherits="Web.Tutor.TestDetailsMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 379px;
            margin-right: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <asp:GridView ID="MultiTestView2" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="mqQuestionID"
                ShowHeaderWhenEmpty="True"

               
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="auto-style16" style="margin-left: 159px">
                <%-- Theme Properties --%>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle ForeColor="Black" BackColor="#EEEEEE" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                
                <AlternatingRowStyle BackColor="#DCDCDC" />
                
                <Columns>
                    <asp:templatefield HeaderText="Select">
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" 

                        CssClass="gridCB" runat="server"></asp:checkbox>
                    </itemtemplate>
                    </asp:templatefield>

                    <asp:TemplateField HeaderText="Test Name">
                        <ItemTemplate>
                         <!--   <asp:Label  Text='<%# Eval("asName") %>' runat="server"  ></asp:Label> -->
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtasNametxt"   runat="server" />
                        </EditItemTemplate>
             <%--           Text='<%# Eval("mqdAnswerID") %>'--%>
                        
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Question Type">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("asQuestionType") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuestionType" Text='<%# Eval("asQuestionType") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtQuestionTypeFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Marks">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("asTotalMarks") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTotalMarks" Text='<%# Eval("asTotalMarks") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtTotalMarksFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>     
  
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Resources/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/addnew.png" runat="server" NavigationUrl="~/Tutor/AddTestMenu.aspx" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    <br />
    <br />
    <asp:Button ID="Assignbtn" runat="server" Text="Assign" OnClick="Assignbtn_Click" CssClass="auto-style1" Width="54px" />
</asp:Content>
