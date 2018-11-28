<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddMultipleTest.aspx.cs" Inherits="Web.Tutor.AddMultipleTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
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
    </style>

    <br />
    <br />
    <br />
   
        TEST NAME     : 
        <asp:Label ID="testNamelbl" runat="server"></asp:Label>
    <br /><br />
        QUESTION TYPE : 
        <asp:Label ID="qtlbl" runat="server"></asp:Label>

      <div style="float:right">
        <asp:Button ID="returnbtn" runat="server" Text="Return to test menu" />
    </div>
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
                <asp:TextBox ID="Markstxt" TextMode="Number" runat="server" min="1" max="20" step="1"/>
                <br />

            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                *CORRECT ANSWER : <br />
                <asp:DropDownList ID ="CorrectAnswerddl"  runat="server" ></asp:DropDownList>
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
