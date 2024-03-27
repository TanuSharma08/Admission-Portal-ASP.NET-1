<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loginfp.aspx.cs" Inherits="loginfp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="style.css" rel="stylesheet" />
    <style>
		h2{
			color:white;
			text-align:center;
			font-size:30px;
		}
	</style>
	
    <script type="text/javascript">
        window.onload = function () {
        var password = document.getElementById('<%= password.ClientID %>');
        var confirmPassword = document.getElementById('<%= confirmpassword.ClientID %>');
        var confirmButton = document.getElementById('<%= confirmpswd.ClientID %>');

        confirmButton.onclick = function () {
            if (password.value !== confirmPassword.value) {
                alert("Passwords do not match!");
                return false;
            }
        };
    };
</script>

    <form id="Form" runat="server">

    <div class="container">
        <h2>Forgot Password</h2>

        <asp:TextBox ID="email" runat="server" placeholder="Email" TextMode="Email" Cssclass="tb" Required="true" />
        <asp:TextBox ID="mno" runat="server" placeholder="Mobile No." onblur="(this.value<1111111111 || this.value>9999999999)?alert('Enter 10 digit Mobile No.'):submit.focus()" Cssclass="tb" Required="true" />
        <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" Cssclass="tb" Required="true" />
        <asp:TextBox ID="confirmpassword" runat="server" placeholder="Confirm Password" TextMode="Password" Cssclass="tb" Required="true" />

        <div class="align"><asp:Button ID="confirmpswd" runat="server" Text="Confirm" OnClick="confirmpswd_Click" Cssclass="button" /></div>
    </div>
</form>

</asp:Content>

