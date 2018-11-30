<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="FinalResult.aspx.cs" Inherits="Web.Assessment.FinalResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <table width="560" align="center">
            <tr>
                <td class="style2">
                    Result</td>
            </tr>
            <tr>
                <td>&nbsp;<asp:Label ID="errorLabel" runat="server" CssClass="errormessage"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="resultGrid" runat="server" DataKeyNames="QuestionID" SelectedIndex="0" 
                    AutoGenerateColumns="False" CellPadding="4" AutoGenerateSelectButton="True" OnSelectedIndexChanged="resultGrid_SelectedIndexChanged" Width="555px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <RowStyle BackColor="White" ForeColor="#330099" CssClass="generaltext" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="QuestionID" HeaderText="Question" />
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct Answer" />
                            <asp:BoundField DataField="UserAnswer" HeaderText="Your Answer" />
                            <asp:BoundField DataField="Result" HeaderText="Result" />
                        </Columns>
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" CssClass="boldtext" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\yiksonmak\Desktop\WebAssignmentAll\WebAssignment\WebAssignment\App_Data\BrightEdu.mdf;Integrated Security=True"
                        SelectCommand="SELECT [Title], [Answer1], [Answer2], [Answer3], [Answer4], [QuestionID], [QuestionOrder],  [CorrectAnswer], [ExamID] FROM [Question] WHERE ([ExamID] = @ExamID) ORDER BY [QuestionOrder]">
                        <SelectParameters>
                            <asp:SessionParameter Name="ExamID" SessionField="ExamID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DetailsView ID="answerDetails" runat="server" CellPadding="3" Height="45px" Width="552px" DataSourceID="SqlDataSource1" 
                        AutoGenerateRows="False" DataKeyNames="QuestionID" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" >
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" CssClass="generaltext" />
                        <FieldHeaderStyle CssClass="boldtext" Width="100px" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="QuestionOrder" HeaderText="Question No.:" />
                            <asp:BoundField DataField="Title" HeaderText="Question:" />
                            <asp:BoundField DataField="Answer1" HeaderText="Answer 1:" />
                            <asp:BoundField DataField="Answer2" HeaderText="Answer 2:" />
                            <asp:BoundField DataField="Answer3" HeaderText="Answer 3:" />
                            <asp:BoundField DataField="Answer4" HeaderText="Answer 4:" />
                            <asp:TemplateField></asp:TemplateField>
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct Answer:" />
                        </Fields>
                    </asp:DetailsView>                
                </td>
            </tr>
            <tr>
                <td><a href="Exam.aspx">Return to Exam</a></td>
            </tr>                                    
            <tr>
                <td>&nbsp;</td>
            </tr>                                    
        </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
