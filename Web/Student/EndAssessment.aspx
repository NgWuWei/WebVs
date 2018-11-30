<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="EndAssessment.aspx.cs" Inherits="Web.Student.EndAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1>Your Result is : 
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:DynamicField DataField="asName" HeaderText="Assessment Title" />
            <asp:DynamicField DataField="mqQuestionDesc" HeaderText="Question" />
            <asp:DynamicField DataField="mqCorrectAnswer" HeaderText="Correct Answer" />
            <asp:DynamicField DataField="mqEachMarks" HeaderText="Question Score" />
            <asp:DynamicField DataField="stasAnswerGiven" HeaderText="Answer Written" />
            <asp:DynamicField DataField="stasScore" HeaderText="Your Result" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT a.asName, mq.mqQuestionDesc, mq.mqCorrectAnswer, mq.mqEachMarks, sa.stasAnswerGiven, sa.stasScore FROM MultiQuestions AS mq INNER JOIN Assessments AS a ON mq.asID = a.asID INNER JOIN StudentAssessments AS sa ON mq.mqQuestionID = sa.mqQuestionID WHERE (a.studID = @id)">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Back to homepage" PostBackUrl="~/Student/Student.aspx" />
</asp:Content>
