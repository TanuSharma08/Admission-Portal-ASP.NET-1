<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="courses.aspx.cs" Inherits="courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>

    <form id="form1" runat="server">
    <link rel="stylesheet" href="/style2.css" />

    <h1>Courses</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="10" Width="100%" HeaderStyle-CssClass="h" RowStyle-CssClass="r">
            <Columns>
                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
                <asp:BoundField DataField="fees" HeaderText="Fees" SortExpression="fees" />
                <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [category], [course], [fees], [duration] FROM [courses]"></asp:SqlDataSource>
    </form>
</body>
</html>
</asp:Content>

    

