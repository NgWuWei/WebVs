<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddMultipleTest.aspx.cs" Inherits="Web.Tutor.AddTestDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            width: 171px;
        }
        .auto-style8 {
            width: 100%;
            margin-top: 73px;
        }
        .auto-style9 {
            margin-top: 0px;
        }
        .auto-style10 {
            height: 22px;
            width: 171px;
        }
        .auto-style11 {
            height: 22px;
        }
        .auto-style13 {
            height: 40px;
            width: 171px;
        }
        .auto-style14 {
            height: 40px;
        }
        .auto-style15 {
            float:right;
        }
        .auto-style16 {
            margin-left: 36px;
            text-align: center;
            position:center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <br />
    <br />
    <p>
        TEST NAME     : <asp:Label ID="lblTestName" runat="server"></asp:Label>
    </p>
    <p>
        QUESTION TYPE : <asp:Label ID="QuestionTypelbl" runat="server"></asp:Label>
        <asp:Button ID="Backbtn" runat="server" Text="Return To Test Menu" CssClass="auto-style15"  NavigateUrl="~/Tutor/TestDetailsMenu.aspx"/>
    </p>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [MultiQuestion], [MultiQuetsionDetails]"></asp:SqlDataSource>

    <table class="auto-style8">  
        <tr>
            <td class="auto-style7">Question Entry Options</td>
            <td class="auto-style5">Question Details</td>
        </tr>
        <tr>
            <td class="auto-style10"><br />
                
                <br />
                <br />
                *QUESTION NO.<br />
                <asp:Label ID="QuestionNolbl" runat="server"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="QuestionTxt" runat="server" CssClass="auto-style9" Height="126px" Width="535px"></asp:TextBox>
                <br />
                <asp:Label ID="mulquestionResultlbl" runat="server" Text="Please Select the Marks: "></asp:Label>
                <asp:DropDownList ID="ddlEachMarks" runat="server" CssClass="auto-style16" Height="16px" Width="52px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
                <br />

            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                *CORRECT ANSWER : <br />
                <asp:DropDownList ID ="CorrectAnswerddl"  runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="savebtn" runat="server" Text="Save" OnClick="savebtn_Click" />
            </td>
            <td class="auto-style14">
                
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <br />
                <asp:Button ID="AddAnswerOptionbtn" runat="server" Text="Add More Answer Options" OnClick="AddAnswerOptionbtn_Click" />
            </td>
        </tr>
    </table>
    
    
    
</asp:Content>
