<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="messages.aspx.cs" Inherits="user_messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Messages</title>
        <link rel="stylesheet" href="msgstyle.css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <h1>Messages</h1>

                <div class="container">
                    <asp:Repeater ID="admission" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <%#Eval("fnm") %>
                            <%#Eval("fathernm") %>
                            <%#Eval("lnm") %>
                            your admission is <%#Eval("status") %>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [fnm], [lnm], [fathernm], [status] FROM [admission] WHERE (([pmno] = @mno) OR ([studmno] = @mno))">
                        <SelectParameters>
                            <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="container">
                    <asp:Repeater ID="studquery" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            Your Query:  <%#Eval("query") %><br />
                            Answer:<%#Eval("reply") %><br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [query], [reply] FROM [studquery] WHERE ([mno] = @mno)">
                        <SelectParameters>
                        <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="container">
                    <asp:Repeater ID="lvapp" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <%# Eval("name") %> Your Leave is <%# Eval("status") %>.
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [name], [status] FROM [lv_app] WHERE ([mno] = @mno)">
                        <SelectParameters>
                            <asp:SessionParameter Name="mno" SessionField="user" Type="String" />
                        </SelectParameters>
                       
                    </asp:SqlDataSource>
                </div>

                <div class="container">
                    <asp:Repeater ID="message" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <b>Date:</b> <%#Eval("Date") %><br />
                            <b>Subject:</b> <%#Eval("subject") %><br />
                            <b>Message:</b> <%#Eval("message") %><br />
                            <br /><br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [date], [subject], [message] FROM [messages]"></asp:SqlDataSource>
                </div>

                <div class="container">
                    <asp:Repeater ID="pdf" runat="server" DataSourceID="SqlDataSource5">
                        <ItemTemplate>
                            <b>Course:</b> <%#Eval("course") %><br />
                            <b>Semester:</b> <%#Eval("sem") %><br />
                            <b>Subject:</b> <%#Eval("subject") %><br />
                            <asp:Label ID="pdf1" runat="server" Text="PDF: " Font-Bold="True" Font-Size="Medium"></asp:Label>
                            <asp:Label ID="pdf" runat="server" Text='<%#Eval("pdf") %>' ReadOnly="True" Font-Names="Arial" Font-Size="Medium"></asp:Label>
                            <br /><asp:Button ID="Button1" runat="server" Text="Click To Download"  OnClick="btnDownload_Click" BackColor="#003366" ForeColor="White" Height="25" BorderColor="White" Font-Size="Medium" style="margin-top:5px;" />
                            <br /><br />
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT [course], [sem], [subject], [pdf] FROM [pdf]"></asp:SqlDataSource>
                    
                </div>


            </div>
        </form>
    </body>
    </html>
</asp:Content>
