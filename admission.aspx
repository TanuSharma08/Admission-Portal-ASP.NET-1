<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="admission.aspx.cs" Inherits="user_admission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <style>
		*{box-sizing: border-box;}
		body{
			background-image: url("../images/h1.png"); 
			background-size: cover;
			background-repeat: no-repeat;
		}
		h1 { 
		  	text-align: center;
		  	color: white;
		}
		.button {
  			font-size: 25px;
  			background-color: rgb(255, 255, 255);
  			color: rgb(26, 25, 25);
            margin: 30px;
  			padding: 5px 0px;
  			border: none;
  			cursor: pointer;
  			width: 150px;
  			opacity: 0.9;
		}

		.button:hover {
		  	opacity: 1;
		}
    </style>
    <form id="form1" runat="server">
    
    <h1>Admission Form</h1><br /><br />

    <asp:Table ID="addcourse" runat="server" CellPadding="5" CellSpacing="0" align="center" width="90%">
    <asp:TableRow>
        <asp:TableCell>First Name</asp:TableCell>
        <asp:TableCell><asp:TextBox ID="fnm" runat="server" size="30" Required="True" /></asp:TableCell>
        <asp:TableCell>Last Name</asp:TableCell><asp:TableCell>
        <asp:TextBox ID="lnm" runat="server" size="30" Required="True" /></asp:TableCell>
    </asp:TableRow>
    
    <asp:TableRow>
        <asp:TableCell>Father's Name</asp:TableCell><asp:TableCell><asp:TextBox ID="fathernm" runat="server" size="30" Required="True" /></asp:TableCell>
        <asp:TableCell>DOB</asp:TableCell><asp:TableCell><asp:TextBox ID="dob" runat="server" size="30" TextMode="Date" Required="True" /></asp:TableCell>
    </asp:TableRow>
    
    <asp:TableRow>
        <asp:TableCell>Gender</asp:TableCell><asp:TableCell><asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" Required="True"><asp:ListItem Text="Male" Value="male" /><asp:ListItem Text="Female" Value="female" /><asp:ListItem Text="Other" Value="other" /></asp:RadioButtonList></asp:TableCell>
        <asp:TableCell>Photo</asp:TableCell><asp:TableCell><asp:FileUpload ID="photo" runat="server" Required="true" size="30"></asp:FileUpload></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Adhaar No.</asp:TableCell><asp:TableCell><asp:TextBox ID="adhaarno" runat="server" size="30" onblur="(this.value<111111111111 || this.value>999999999999)?alert('Enter 12 digit Adhaar No.'):submit.focus()" Required="True" /></asp:TableCell>
        <asp:TableCell>Parent's Profession</asp:TableCell><asp:TableCell><asp:TextBox ID="parentprof" runat="server" size="30" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Company/ Dept. Name</asp:TableCell><asp:TableCell><asp:TextBox ID="codept" runat="server" size="30" /></asp:TableCell>
        <asp:TableCell>Designation</asp:TableCell><asp:TableCell><asp:TextBox ID="designation" runat="server" size="30" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Address</asp:TableCell><asp:TableCell><asp:TextBox ID="address" runat="server" TextMode="MultiLine" Required="True" Width="247" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Whatsapp No.</asp:TableCell><asp:TableCell><asp:TextBox ID="whatsappno" runat="server" size="30" onblur="(this.value<1111111111 || this.value>9999999999)?alert('Enter 10 digit Mobile No.'):submit.focus()" Required="True" /></asp:TableCell>
        <asp:TableCell>Email</asp:TableCell><asp:TableCell><asp:TextBox ID="email" runat="server" size="30" TextMode="Email" Required="True" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Student's Mobile No.</asp:TableCell><asp:TableCell><asp:TextBox ID="studmno" runat="server" size="30" onblur="(this.value<1111111111 || this.value>9999999999)?alert('Enter 10 digit Mobile No.'):submit.focus()" /></asp:TableCell>
        <asp:TableCell>Parent's Mobile No.</asp:TableCell><asp:TableCell><asp:TextBox ID="pmno" runat="server" size="30" onblur="(this.value<1111111111 || this.value>9999999999)?alert('Enter 10 digit Mobile No.'):submit.focus()" Required="True" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Last(Appeared/Passed Exam)</asp:TableCell><asp:TableCell><asp:TextBox ID="lastexam" runat="server" size="30" Required="True" /></asp:TableCell>
        <asp:TableCell>Year of Passing</asp:TableCell><asp:TableCell><asp:TextBox ID="yrofpassing" runat="server" size="30" Required="True" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Name of Institute</asp:TableCell><asp:TableCell><asp:TextBox ID="instnm" runat="server" size="30" Required="True" /></asp:TableCell>
        <asp:TableCell>Percentage</asp:TableCell><asp:TableCell><asp:TextBox ID="pr" runat="server" size="30" Required="True" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell><h3>Commerce</h3></asp:TableCell><asp:TableCell></asp:TableCell>
        <asp:TableCell><h3>Computer</h3></asp:TableCell><asp:TableCell></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Standard</asp:TableCell><asp:TableCell><asp:RadioButtonList ID="std" runat="server" RepeatDirection="Horizontal" ><asp:ListItem Text="11<sup>th</sup>& 12<sup>th</sup>" Value="11th & 12th" /><asp:ListItem Text="12<sup>th</sup>" Value="12th" /></asp:RadioButtonList></asp:TableCell>
        <asp:TableCell>Course</asp:TableCell><asp:TableCell><asp:RadioButtonList ID="course" runat="server" RepeatDirection="Horizontal" ><asp:ListItem Text="BCA" Value="BCA" /><asp:ListItem Text="MCA" Value="MCA" /></asp:RadioButtonList></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>School Name</asp:TableCell><asp:TableCell><asp:TextBox ID="schoolnm" runat="server" size="30" /></asp:TableCell>
        <asp:TableCell>Semester</asp:TableCell><asp:TableCell><asp:DropDownList ID="sem" runat="server"><asp:ListItem Text="-- select sem --" Value="" /><asp:ListItem Text="Sem-1" /><asp:ListItem Text="Sem-2" /><asp:ListItem Text="Sem-3" /><asp:ListItem Text="Sem-4" /><asp:ListItem Text="Sem-5" /><asp:ListItem Text="Sem-6" /></asp:DropDownList></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell>Other Course</asp:TableCell><asp:TableCell><asp:DropDownList ID="othercourse" runat="server" DataTextField="course" DataValueField="course" AppendDataBoundItems="True"><asp:ListItem Text="--select course--" Value="" /></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cn %>" SelectCommand="SELECT Course FROM courses WHERE category NOT IN ('HSC (General)', 'UG', 'PG')" /></asp:TableCell>
        <asp:TableCell>College Name</asp:TableCell><asp:TableCell><asp:TextBox ID="collegenm" runat="server" size="30" /></asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell><b>Modes of Payment: Cash and Cheque</b></asp:TableCell>
    </asp:TableRow>

    </asp:Table><br />
    <center><asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" CssClass="button" /></center>
    </form>
</body>
</html>
</asp:Content>

