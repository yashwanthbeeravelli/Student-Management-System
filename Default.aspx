<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="jumbotron">
        <h1>Online Student Management System</h1>
        <p class="lead">INSE 6260 Final Project 
            <br />
            Fall 2014<br />
            By Yashwanth Beeravelli and Mengyao Wang<br />
            To Dr. Rachida Dssouli&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="Register" runat="server" Text="Admin" PostBackUrl="~/Administrator/AdminLogin.aspx" ForeColor="#003366"  />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Login" runat="server" Text="Student" PostBackUrl="~/StudentLogin.aspx" ForeColor="#993333" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Admin" runat="server" Text="Instructor" PostBackUrl="~/Instructor/InstructorLogin.aspx" ForeColor="" />

        </p>
       
    </div>

    
</asp:Content>
