<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link rel="stylesheet" href="style.css" />
    <form id="Form" runat="server">
		
	<div class="container">
	<h1>Sign Up</h1>
		
            <asp:TextBox ID="name" runat="server" placeholder="Name" Cssclass="tb" Required="true"/>
            <asp:TextBox ID="email" runat="server" placeholder="Email" TextMode="Email" Cssclass="tb" Required="true" />
            <asp:TextBox ID="mno" runat="server" placeholder="Mobile No." onblur="(this.value<1111111111 || this.value>9999999999)?alert('Enter 10 digit Mobile No.'):submit.focus()" Cssclass="tb" Required="true" />
            <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" Cssclass="tb" Required="true" />

		<div class="align">
        <asp:Button ID="signin" runat="server" Text="Sign Up" class="button" OnClick="signin_Click" />
		<footer>Already a member?<a href="login.aspx">Login</a></footer></div>
  	    </div>
	</form>
</asp:Content>

