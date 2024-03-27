<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<form id="Form" runat="server">
    <link href="style.css" rel="stylesheet" />
    <link href="loginstyle.css" rel="stylesheet" />
    <div class="container">
	    <h1>Login</h1>
            <asp:TextBox ID="mno" runat="server" placeholder="Mobile No." onblur="(this.value<1111111111 || this.value>9999999999)?alert('Enter 10 digit Mobile No.'):submit.focus()" Cssclass="tb" Required="true" />
            <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" Cssclass="tb" Required="true" />
            <div class="align"><a href="loginfp.aspx">Forget Password?</a></div>
            <asp:Button ID="loginbtn" runat="server" Text="Log In" OnClick="login_Click" Cssclass="btn" />
    		<footer>Not a member?<a href="signup.aspx">SignUp Now</a></footer>
      	</div>
</form>

</asp:Content>

