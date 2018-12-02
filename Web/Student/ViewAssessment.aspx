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
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="asName" HeaderText="Assessment Name" SortExpression="asName" />
                <asp:BoundField DataField="asDetails" HeaderText="Assessment Details" SortExpression="asDetails" />
                <asp:BoundField DataField="asQuestionType" HeaderText="Question Type" SortExpression="asQuestionType" />
                <asp:BoundField DataField="asTime" HeaderText="Duration" SortExpression="asTime" />
                <asp:BoundField DataField="asDueDate" HeaderText="Deadline" SortExpression="asDueDate" />
                <asp:BoundField DataField="asTotalMarks" HeaderText="Result" SortExpression="asTotalMarks" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT asName, asDetails, asQuestionType, asTime, asDueDate, asTotalMarks FROM Assessments AS a WHERE (studID = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
