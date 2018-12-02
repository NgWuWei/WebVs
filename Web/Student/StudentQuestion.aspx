<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="StudentQuestion.aspx.cs" Inherits="Web.Student.StudentQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Assessment Question prepared by tutor</h1></div>
    <asp:Panel ID="Panel1" runat="server">
        <div>
            <!-- soon add if else for different question TYPE -->
            <asp:DataList ID="DataList1" runat="server" DataKeyField="mqQuestionID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("mqQuestionId") %>'></asp:Label>
                    <br />Question No. <%# Container.ItemIndex+1 %>
                    <!-- Get question Description here -->
                    <%# Eval("mqQuestionDesc") %>
                    <br /> 
                    <!-- Radio list here -->
                    <asp:RadioButton ID="maAnswerA" runat="server" Text='<%# "A) " + Eval("maAnswerA") %>' GroupName="qList"/><br />
                    <asp:RadioButton ID="maAnswerB" runat="server" Text='<%# "B) " + Eval("maAnswerB") %>' GroupName="qList"/><br />
                    <asp:RadioButton ID="maAnswerC" runat="server" Text='<%# "C) " + Eval("maAnswerC") %>' GroupName="qList"/><br />
                    <asp:RadioButton ID="maAnswerD" runat="server" Text='<%# "D) " + Eval("maAnswerD") %>' GroupName="qList"/><br />
                    Marks: <asp:Label ID="lblMarks" runat="server" Text='<%# Eval("mqEachMarks") %>'></asp:Label>
                    
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mq.mqQuestionID, mq.mqQuestionDesc, mq.mqEachMarks, ma.maAnswerA, ma.maAnswerB, ma.maAnswerC, ma.maAnswerD FROM MultiQuestions AS mq INNER JOIN MultiAnswers AS ma ON mq.mqQuestionID = ma.mqQuestionID WHERE (mq.asID = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />


        <br /><br />
        <div>
            <asp:Button ID="Button2" runat="server" Text="To homepage" PostBackUrl="~/Student/Student.aspx"/>
        </div>

    </asp:Panel>
</asp:Content>
