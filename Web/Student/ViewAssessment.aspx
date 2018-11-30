<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="ViewAssessment.aspx.cs" Inherits="Web.Student.ViewAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>View Assessment Results</h1></div>
    <div>
        <!-- Get student name , assessment name, student score -->
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="asname" HeaderText="Assessment Name" />
                <asp:BoundField DataField="asDetails" HeaderText="Assessment Details" />
                <asp:BoundField DataField="asQuestionType" HeaderText="Question Type" />
                <asp:BoundField DataField="asTime" HeaderText="Duration" />
                <asp:BoundField DataField="asDueDate" HeaderText="DeadLine" />
                <asp:BoundField DataField="totalQuestions" HeaderText="Total Marks" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT a.asName, a.asDetails, a.asQuestionType, a.asTime, a.asDueDate, sa.stasScore FROM Assessments AS a INNER JOIN Students AS s ON a.studID = s.studId INNER JOIN StudentAssessments AS sa ON s.studId = sa.studID WHERE (s.studId = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
