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

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
            <Columns>
                <asp:HyperLinkField NavigateUrl='<%#string.Format("~/Student/StudentQuestion.aspx?id={0}", Encrypt(Eval("id").toString))%>' Text="Click me"/>
                <asp:BoundField DataField="asname" HeaderText="Assessment Name" />
                <asp:BoundField DataField="asDetails" HeaderText="Assessment Details" />
                <asp:BoundField DataField="totalMarks" HeaderText="Total Marks" />
                <asp:BoundField DataField="asTime" HeaderText="Duration" />
                <asp:BoundField DataField="asDueDate" HeaderText="DeadLine" />
                <asp:BoundField DataField="totalQuestions" HeaderText="Total Marks" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT A.asName, A.asDetails, SUM(MQ.mqEachMarks) AS totalMarks, A.asTime, A.asDueDate, COUNT(MQ.mqQuestionID) AS totalQuestions, MQ.mqQuestionID AS id FROM Students AS S INNER JOIN Groups AS G ON S.studId = G.studId INNER JOIN Assessments AS A ON G.grpId = A.grpId INNER JOIN MultiQuestions AS MQ ON MQ.asID = A.asID GROUP BY A.asName, A.asDetails, A.asTime, A.asDueDate, MQ.mqQuestionID"></asp:SqlDataSource>

    </div>
</asp:Content>