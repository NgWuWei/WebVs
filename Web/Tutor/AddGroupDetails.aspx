<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddGroupDetails.aspx.cs" Inherits="Web.Tutor.AddGroupDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 128px;
            margin-left: 166px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="groupNamelbl" runat="server"  ></asp:Label>
    
  
    <br />
    <br />

     <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CssClass="auto-style1" DataKeyNames="studId" DataSourceID="SqlDataSource1" Width="537px" AutoGenerateColumns="False">
        <Columns>
            <asp:CheckBoxField />
            <asp:BoundField DataField="studName" HeaderText="Student Name" SortExpression="studName" />
            <asp:BoundField DataField="studId" HeaderText="Student ID" SortExpression="studId" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="studEmail" HeaderText="Student Email" SortExpression="studEmail" />
            <asp:BoundField DataField="studGender" HeaderText="Gender" SortExpression="studGender" />
            <asp:BoundField DataField="courseId" HeaderText="Course ID" SortExpression="courseId" />
            
            <asp:TemplateField>
               <ItemTemplate>
                   <asp:CheckBox Text="Assign" ID="assignBox" runat="server" />
               </ItemTemplate>
           </asp:TemplateField>
            </Columns>
    </asp:GridView>
         <br />
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
    </div>
    <div>
        <asp:Button ID="GroupConfirmbtn" runat="server" text="Confirm" OnClick="GroupConfirmbtn_Click"/>
    </div>
    <div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Students]">
            
        </asp:SqlDataSource>
    </div>
    </asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
   
    



</asp:Content>
