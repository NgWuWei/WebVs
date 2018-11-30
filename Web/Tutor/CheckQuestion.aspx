<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="CheckQuestion.aspx.cs" Inherits="Web.Tutor.CheckQuestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="auto-style1">
        SELECT TEST:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlExam" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource1"></asp:DropDownList>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SelectCommand=&quot;SELECT DISTINCT Exam.Subject FROM Exam INNER JOIN Question ON Exam.ExamID = Question.ExamID&quot;&gt;"></asp:SqlDataSource>
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Answer1" HeaderText="Answer1" SortExpression="Answer1" />
            <asp:BoundField DataField="Answer2" HeaderText="Answer2" SortExpression="Answer2" />
            <asp:BoundField DataField="Answer3" HeaderText="Answer3" SortExpression="Answer3" />
            <asp:BoundField DataField="Answer4" HeaderText="Answer4" SortExpression="Answer4" />
            <asp:BoundField DataField="QuestionOrder" HeaderText="QuestionOrder" SortExpression="QuestionOrder" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [QuestionID], [Title], [Answer1], [Answer2], [Answer3], [Answer4], [QuestionOrder] FROM [Question] WHERE ([ExamID] = @ExamID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlExam" Name="ExamID" PropertyName="SelectedValue" DefaultValue="NULL" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
