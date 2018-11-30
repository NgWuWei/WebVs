<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="StudentQuestion.aspx.cs" Inherits="Web.Student.StudentQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Assessment Question prepared by tutor</h1></div>
    <asp:Panel ID="Panel1" runat="server">
        <!-- display question with gridview with select, append empty textbox with selected -->

        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell><p>Question Description: </p></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="QuestionDisplay" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><p>Answer Here:</p></asp:TableCell>
                <asp:TableCell>
                    <!--Add this after this friday if (Request.QueryString["QType"].ToString() == "Text"); -->
                    <asp:TextBox ID="AnswerText" runat="server" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <!-- display test marks for 1 question -->
        <div></div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="mqQuestionDesc" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="mqQuestionDesc" HeaderText="Question Details" />
                <asp:BoundField DataField="mqEachMarks" HeaderText="Question Score" />
                <asp:BoundField DataField="mqStudentAnswer" HeaderText="Answer Given" />
            </Columns> 
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mq.mqQuestionDesc, mq.mqEachMarks FROM Assessments AS a INNER JOIN MultiQuestions AS mq ON a.asID = mq.asID WHERE (mq.asID = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click"/>

    </asp:Panel>
</asp:Content>
