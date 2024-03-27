<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="chngpswd.aspx.cs" Inherits="user_chngpswd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="/style.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <style>
		h2{
			color:white;
			text-align:center;
			font-size:30px;
		}
	</style>
	
    <form id="Form" runat="server">

    <div class="container">
        <h2>Change Password</h2>

        <asp:Repeater ID="r1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <asp:TextBox ID="email" runat="server" CssClass="tb" Text='<%#Eval("email") %>' ReadOnly="true"></asp:TextBox><br />
                    <asp:TextBox ID="mno" runat="server" CssClass="tb" Text='<%#Eval("mno") %>' ReadOnly="True"></asp:TextBox><br />
                </ItemTemplate>
            </asp:Repeater>     

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [email], [mno] FROM [user_login] WHERE ([mno] = @mno)">
            <SelectParameters>
                <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:TextBox ID="oldpassword" runat="server" placeholder="Old Password" TextMode="Password" Cssclass="tb" Required="true" />
        <asp:TextBox ID="newpassword" runat="server" placeholder="New Password" TextMode="Password" Cssclass="tb" Required="true" />

        <div class="align"><asp:Button ID="confirm" runat="server" Text="Confirm" OnClick="confirm_Click" Cssclass="button" /></div>
    </div>
</form>

</asp:Content>


