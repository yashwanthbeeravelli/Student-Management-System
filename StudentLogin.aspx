<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentLogin.aspx.cs" Inherits="StudentLogin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type ="text/javascript">
        
        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
</script>
    <table class="nav-justified">
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" BackColor="White" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Student Login Detail"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 226px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style3" style="height: 50px">
                    <asp:Label ID="lblStudentId" runat="server" Font-Bold="True" Font-Size="Small" Text="Student Id:"></asp:Label>
                    <br />
                </td>
                <td class="auto-style4" style="margin-left: 80px; height: 50px;">
                    <asp:TextBox ID="txtStudentId" runat="server" Height="27px" style="margin-left: 0px" Width="224px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ControlToValidate="txtStudentId" ErrorMessage="*" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
      ControlToValidate="txtStudentId" ErrorMessage="The Student Id should be in digits like 1234567" 
    ValidationExpression="[0-9]{7}" Font-Bold="True" ForeColor="#FF6600"></asp:RegularExpressionValidator>
                </td>
            </tr>
        <tr>
                <td class="auto-style3" style="height: 21px">
                </td>
                <td class="auto-style4" style="margin-left: 80px; height: 21px;">
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="height: 43px">
                    <asp:Label ID="lblPassword" runat="server" Font-Bold="True" Font-Size="Small" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style4" style="height: 43px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="224px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:HyperLink ID="hypForgotPassword" runat="server" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Student/StudentForgotPwd.aspx">Forgot Password</asp:HyperLink>
                    &nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HlRegister" runat="server" NavigateUrl="~/StudentRegister.aspx" Font-Bold="False" Font-Underline="True" ForeColor="#000099">Register</asp:HyperLink>
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLogin" runat="server" Font-Bold="True" Font-Size="Small" OnClick="btnLogin_Click" Text="Sign In" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" runat="server" Font-Bold="True" Font-Size="Small"  Text="Reset" OnClick="btnReset_Click" />
                </td>
            </tr>
        </table>

</asp:Content>

