<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<link rel="stylesheet" href="/admin/prostyle.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
	<form id="form1" runat="server"><br />
		<div class="container">
			<h1>Your Profile</h1>
            <asp:Repeater ID="profile" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    Name: <asp:TextBox ID="name" runat="server" CssClass="tb" Text='<%#Eval("name") %>'></asp:TextBox><br />
                    Email: <asp:TextBox ID="email" runat="server" CssClass="tb" Text='<%#Eval("email") %>'></asp:TextBox><br />
                    Mobile: <asp:TextBox ID="mno" runat="server" CssClass="tb" Text='<%#Eval("mno") %>' ReadOnly="True"></asp:TextBox><br />
                    Password: <asp:TextBox ID="password" runat="server" CssClass="tb" Text='<%#Eval("password") %>' ReadOnly="True"></asp:TextBox>
                    <br /><asp:Button ID="update" runat="server" Text="Update Profile" OnClick="upd_Click" CssClass="button" />
                </ItemTemplate>

            </asp:Repeater>
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [name], [email], [mno], [password] FROM [user_login] WHERE ([mno] = @mno)">
                <SelectParameters>
                    <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
		</div>
	</form>
</body>
</html>
</asp:Content>


