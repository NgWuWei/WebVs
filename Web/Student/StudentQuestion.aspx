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
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Set as Answer" />
        <!-- display test marks for 1 question -->
        <div>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="mqQuestionID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="mqQuestionDesc" HeaderText="Question Details" />
                                <asp:BoundField DataField="mqEachMarks" HeaderText="Question Score" />
                                <asp:BoundField DataField="mqQuestionID" HeaderText="Question ID" />
                            </Columns>
                        </asp:GridView>
                        l;l<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mq.mqQuestionDesc, mq.mqEachMarks, mq.mqQuestionID FROM Assessments AS a INNER JOIN MultiQuestions AS mq ON a.asID = mq.asID WHERE (mq.asID = @id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" >
                            <Columns>
                                <asp:BoundField DataField="stasAnswerGiven" HeaderText="Answers" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select stasAnswerGiven from studentassessments sa where studid = @id and mqQuestionid=@mqQuestionid">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="user" />
                                <asp:ControlParameter ControlID="GridView1" Name="mqQuestionid" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <br />



        <asp:Button ID="btnSubmit" runat="server" Text="Submit Test" OnClick="BtnSubmit_Click"/>
        <br /><br />
        <asp:Button ID="Button2" runat="server" Text="To homepage" PostBackUrl="~/Student/Student.aspx"/>

    </asp:Panel>
</asp:Content>
