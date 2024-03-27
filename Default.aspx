<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="user_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
		.index{
  			background: url("/images/in.png");
  			background-size: cover;
  			margin-top: 10px;
  			padding: 50px;
  			margin: 0;
  			margin-bottom: 80px;
		}
		h2{
			font-size: 28px;
  			color: rgba(0, 46, 107, 0.993);
		}
  	</style>

     <form id="form1" runat="server">
    <div class="index">
  		<center><img src="/images/logo1.png" width="400" />
  		<h2>AAVISHKAR INSTITUTE</h2></center>
  	</div>

    <asp:Repeater ID="wlcm" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <center><h2><%#Eval("name") %> , Welcome To Aavishkar Institute</h2></center>
        </ItemTemplate>
    </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [name] FROM [user_login] WHERE ([mno] = @mno)">
            <SelectParameters>
                <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>

</asp:Content>


