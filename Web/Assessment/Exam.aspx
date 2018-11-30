<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Exam.aspx.cs" Inherits="Web.Assessment.Exam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<table width="560" align="center">
                                       
                    <tr>
                       <td class="style2">Available Tests</td> 
                    </tr>        
                    <tr>
                        <td width="100%"></td>
                    </tr>
                    <tr>
                        <td width="100%">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:HyperLink
                                            ID="HyperLink1" runat="server" NavigateUrl='<%# "Start.aspx?testid=" + Eval("ExamID") %>'
                                            Text='<%# Eval("Subject") %>'></asp:HyperLink><br />
                                    &nbsp;<br />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\yiksonmak\Desktop\WebAssignmentAll\WebAssignment\WebAssignment\App_Data\BrightEdu.mdf;Integrated Security=True"
                                
                                SelectCommand="SELECT [Subject], [ExamID] FROM [Exam] WHERE (([Status] = @Status))">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="Public" Name="Status" SessionField="Status" 
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>                                         
                    <tr>
                        <td width="100%">&nbsp;</td>
                    </tr>                      
                    <tr>
                        <td width="100%" class="style2">Test Result History</td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="555px">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="generaltext" />
                                <Columns>
                                    <asp:BoundField DataField="Subject" HeaderText="Quiz" SortExpression="Title" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DateTimeComplete" DataFormatString="{0:d}" HeaderText="Completed"
                                        SortExpression="DateTimeComplete" >
                                        <FooterStyle Width="150px" />
                                        <HeaderStyle Width="150px" />
                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" >
                                        <FooterStyle Width="50px" />
                                        <HeaderStyle Width="50px" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle Font-Bold="True" CssClass="complete" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\yiksonmak\Desktop\WebAssignmentAll\WebAssignment\WebAssignment\App_Data\BrightEdu.mdf;Integrated Security=True"
                                SelectCommand="SELECT Exam.Subject, StudentExam.DateTimeComplete, StudentExam.Score FROM StudentExam INNER JOIN Exam ON StudentExam.ExamID = Exam.ExamID WHERE (StudentExam.Username = @Username) ORDER BY StudentExam.DateTimeComplete">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Username" SessionField="Username" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>                                         
                    <tr>
                        <td width="100%">&nbsp;</td>
                    </tr>                                       
                            
                </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
