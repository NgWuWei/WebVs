<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="ExamBegin.aspx.cs" Inherits="Web.Assessment.ExamBegin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<table width="560" align="center">
            <tr>
                <td class="h1"><span class="style2">Current Test:</span>&nbsp;
                    <asp:Label ID="lblCurrentTest" runat="server" 
                        style="color: #FF6600; font-size: large; font-weight: 700;"></asp:Label></td>
            </tr>                 
            <tr>
                <td>
                    <asp:DetailsView ID="questionDetails" runat="server" Height="50px" Width="331px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="QuestionID">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" CssClass="generaltext" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" CssClass="boldtext" Width="100px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:BoundField DataField="Answer1" HeaderText="Answer1" SortExpression="Answer1" />
                            <asp:BoundField DataField="Answer2" HeaderText="Answer2" SortExpression="Answer2" />
                            <asp:BoundField DataField="Answer3" HeaderText="Answer3" SortExpression="Answer3" />
                            <asp:BoundField DataField="Answer4" HeaderText="Answer4" SortExpression="Answer4" />
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="CorrectAnswer" SortExpression="CorrectAnswer" />
                            <asp:BoundField DataField="QuestionOrder" HeaderText="QuestionOrder" SortExpression="QuestionOrder" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" CssClass="generaltext" />
                    </asp:DetailsView>
                    &nbsp;
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [QuestionID], [Title], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [QuestionOrder] FROM [Question] WHERE ([ExamID] = @ExamID) ORDER BY [QuestionOrder]">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="ExamID" Type="Int32" Name="ExamID" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="boldtext">
                    <span class="style1">Your Answer:</span>&nbsp;
                <asp:DropDownList ID="ddlAnswer" runat="server">
                            <asp:ListItem Value="1">Answer 1</asp:ListItem>
                            <asp:ListItem Value="2">Answer 2</asp:ListItem>
                            <asp:ListItem Value="3">Answer 3</asp:ListItem>
                            <asp:ListItem Value="4">Answer 4</asp:ListItem>
                        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnNext" runat="server" OnClick="nextButton_Click" 
                        Text="Next" />
                </td>
            </tr>                                    
        </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
