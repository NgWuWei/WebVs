<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="ViewRecords.aspx.cs" Inherits="Web.Tutor.ViewRecords" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 <asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>View Student Records
         </h1>
    </div>
    <div>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="assessId">
            <Columns>
                <asp:BoundField DataField="studId" HeaderText="student ID" SortExpression="studId" />
                <asp:BoundField DataField="studName" HeaderText="student Name" ReadOnly="True" SortExpression="studName" />
                <asp:BoundField DataField="studGrade" HeaderText="student Grade" SortExpression="studGrade" />
                <asp:BoundField DataField="assessTitle" HeaderText="assessTitle" SortExpression="assessTitle" />
                <asp:BoundField DataField="assessDetail" HeaderText="assessDetail" SortExpression="assessDetail" />
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT a.studId, s.studName, s.studGrade, a.assessTitle, assessDetail, a.assessId FROM Students AS s INNER JOIN Assessments AS a ON s.studId = a.studId AND s.assessId = a.assessId"></asp:SqlDataSource>
     </div>
    <div>
         <asp:DataList ID="DataList1" runat="server" DataKeyField="assessId" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                assessId:
                <asp:Label ID="assessIdLabel" runat="server" Text='<%# Eval("assessId") %>' />
                <br />
                assessTitle:
                <asp:Label ID="assessTitleLabel" runat="server" Text='<%# Eval("assessTitle") %>' />
                <br />
                assessDetail:
                <asp:Label ID="assessDetailLabel" runat="server" Text='<%# Eval("assessDetail") %>' />
                <br />
                questionTitle:
                <asp:Label ID="questionTitleLabel" runat="server" Text='<%# Eval("questionTitle") %>' />
                <br />
                questionDetail:
                <asp:Label ID="questionDetailLabel" runat="server" Text='<%# Eval("questionDetail") %>' />
                <br />
                ansDetail:
                <asp:Label ID="ansDetailLabel" runat="server" Text='<%# Eval("ansDetail") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT a.assessId, a.assessTitle, a.assessDetail, q.questionTitle, q.questionDetail, an.ansDetail FROM Assessments AS a INNER JOIN Questions AS q ON a.questionId = q.questionId INNER JOIN Answers AS an ON q.ansId = an.ansId WHERE (a.assessId = @assessId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="assessId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
     </div>
</asp:Content>