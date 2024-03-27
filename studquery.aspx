<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="studquery.aspx.cs" Inherits="user_studquery" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="/style.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <form id="Form" runat="server">
		
	<div class="container">
	<h1>Student Query</h1>
		
        <asp:Repeater ID="r1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <asp:TextBox ID="name" runat="server" CssClass="tb" Text='<%#Eval("name") %>' ReadOnly="true"></asp:TextBox><br />
                    <asp:TextBox ID="email" runat="server" CssClass="tb" Text='<%#Eval("email") %>' ReadOnly="true"></asp:TextBox><br />
                    <asp:TextBox ID="mno" runat="server" CssClass="tb" Text='<%#Eval("mno") %>' ReadOnly="True"></asp:TextBox><br />
                </ItemTemplate>
            </asp:Repeater>     

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [name], [email], [mno] FROM [user_login] WHERE ([mno] = @mno)">
            <SelectParameters>
                <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>     

            <asp:TextBox ID="query" runat="server" placeholder="Your Query" TextMode="Multiline" Cssclass="tb" Required="true" Height="15px" />

		<div class="align"><asp:Button ID="submit" runat="server" Text="Submit" class="button" OnClick="submit_Click" /></div>
    </div>
	</form>

</asp:Content>

