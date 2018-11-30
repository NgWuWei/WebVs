<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="StudentAssessment.aspx.cs" Inherits="Web.Student.StudentAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Student
         </h1></div>
    <div>
        <!-- This page contains question that is prepared for student
            GridTable to show and load selected question
            
            TODO link database of assessment and group
            -->
        <!-- assessment id, assessment name and question title the same, question type, question no., due date, timer-->

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Student/StudentQuestion.aspx?id={0}" Text="Click me"/>
                <asp:BoundField DataField="asName" HeaderText="Assessment Name" />
                <asp:BoundField DataField="asDetails" HeaderText="Assessment Details" />
                <asp:BoundField DataField="totalMarks" HeaderText="Total Marks" />
                <asp:BoundField DataField="asTime" HeaderText="Duration" />
                <asp:BoundField DataField="asDueDate" HeaderText="DeadLine" />
                <asp:BoundField DataField="totalQuestions" HeaderText="Total Marks" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT a.asName, a.asDetails, SUM(MQ.mqEachMarks) AS totalMarks, a.asTime, a.asDueDate, COUNT(MQ.mqQuestionID) AS totalQuestions, MQ.asID AS id FROM Assessments AS a INNER JOIN Students AS s ON a.studID = s.studId INNER JOIN MultiQuestions AS MQ ON MQ.asID = a.asID GROUP BY a.asName, a.asDetails, a.asTime, a.asDueDate, MQ.mqQuestionID, MQ.asID"></asp:SqlDataSource>

    </div>
</asp:Content>