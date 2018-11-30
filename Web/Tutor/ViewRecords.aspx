<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="ViewRecords.aspx.cs" Inherits="Web.Tutor.ViewRecords" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 <asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <div><h1>View Student Records
         </h1>
    </div>
    <div>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="studID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:DynamicField DataField="studID" HeaderText="Student ID" />
                <asp:DynamicField DataField="studName" HeaderText="Student Name" />
                <asp:DynamicField DataField="studGrade" HeaderText="Student Grade" />
                <asp:DynamicField DataField="asName" HeaderText="Assessment Name" />
                <asp:DynamicField DataField="asDetails" HeaderText="Assessment Details" />
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT s.studId, s.studName, s.studGrade, a.asID, a.asName, a.asDetails, sa.stasScore FROM Students AS s INNER JOIN Assessments AS a ON s.studId = a.studID INNER JOIN StudentAssessments AS sa ON s.studId = sa.studID"></asp:SqlDataSource>
         Edit Student Grades: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     </div>
    <div>
         <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                asName:
                <asp:Label ID="asNameLabel" runat="server" Text='<%# Eval("asName") %>' />
                <br />
                mqQuestionDesc:
                <asp:Label ID="mqQuestionDescLabel" runat="server" Text='<%# Eval("mqQuestionDesc") %>' />
                <br />
                mqCorrectAnswer:
                <asp:Label ID="mqCorrectAnswerLabel" runat="server" Text='<%# Eval("mqCorrectAnswer") %>' />
                <br />
                stasScore:
                <asp:Label ID="stasScoreLabel" runat="server" Text='<%# Eval("stasScore") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT a.asName, mq.mqQuestionDesc, mq.mqCorrectAnswer, sa.stasScore FROM Students AS s INNER JOIN StudentAssessments AS sa ON s.studId = sa.studID INNER JOIN MultiQuestions AS mq ON sa.mqQuestionID = mq.mqQuestionID INNER JOIN Assessments AS a ON a.asID = mq.asID WHERE (s.studId = @studid) AND (a.asID = @asid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DataList1" Name="studid" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DataList1" Name="asid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
     </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>