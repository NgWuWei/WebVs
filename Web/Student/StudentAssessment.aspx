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

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandArgument='<%# Eval("id") %>' runat="server" Text="Click here"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="asName" HeaderText="asName" SortExpression="asName" />
                <asp:BoundField DataField="asDetails" HeaderText="asDetails" SortExpression="asDetails" />
                <asp:BoundField DataField="asQuestionType" HeaderText="asQuestionType" SortExpression="asQuestionType" />
                <asp:BoundField DataField="totalMarks" HeaderText="totalMarks" ReadOnly="True" SortExpression="totalMarks" />
                <asp:BoundField DataField="asTime" HeaderText="asTime" SortExpression="asTime" />
                <asp:BoundField DataField="asDueDate" HeaderText="asDueDate" SortExpression="asDueDate" />
                <asp:BoundField DataField="totalQuestion" HeaderText="totalQuestion" ReadOnly="True" SortExpression="totalQuestion" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT a.asName, a.asDetails, a.asQuestionType, SUM(mq.mqEachMarks) AS totalMarks, a.asTime, a.asDueDate, a.asID AS id, COUNT(mq.asID) AS totalQuestion FROM Assessments AS a INNER JOIN Students AS s ON a.studID = s.studId CROSS JOIN MultiQuestions AS mq WHERE (s.studId = @id) GROUP BY a.asName, a.asDetails, a.asQuestionType, a.asTime, a.asDueDate, a.asID">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>