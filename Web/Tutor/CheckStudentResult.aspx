<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="CheckStudentResult.aspx.cs" Inherits="Web.Tutor.CheckStudentResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" HeaderStyle-Width="200px" >
<HeaderStyle Width="200px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="DateTimeComplete" HeaderText="DateTimeComplete" SortExpression="DateTimeComplete" HeaderStyle-Width="350px">
<HeaderStyle Width="350px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" HeaderStyle-Width="150px">
<HeaderStyle Width="150px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" HeaderStyle-Width="200px">
<HeaderStyle Width="200px"></HeaderStyle>
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"  HorizontalAlign="Center"/>
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"  HorizontalAlign="Center"/>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="center" />
                <RowStyle  HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT StudentExam.Username, Exam.Subject,  StudentExam.Score,StudentExam.DateTimeComplete  FROM StudentExam INNER JOIN Exam ON StudentExam.ExamID = Exam.ExamID"></asp:SqlDataSource>

        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
