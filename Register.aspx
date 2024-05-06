<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Library_Management.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">

            <asp:Label ID="Label6" runat="server" Text="REGISTER FORM" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="50px" ForeColor="#000099"></asp:Label>
            <br />
            <div style="border: thick solid #3366CC; text-align: center; height: 300px; width: 650px; border-radius:25px; margin-top: 50px; margin-left: 300px; padding-top: 30px;">
            <asp:Label ID="Label1" runat="server" Text="FIRST NAME : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="fname" runat="server" BackColor="#99CCFF" BorderColor="#003366" Height="30px" Width="250px"></asp:TextBox>
                <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="LAST NAME : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="lname" runat="server" BackColor="#99CCFF" BorderColor="#003366" Height="30px" Width="250px"></asp:TextBox>
                <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="LIBRARY ID : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="lid" runat="server" BackColor="#99CCFF" BorderColor="#003366" Height="30px" Width="250px"></asp:TextBox>
                <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="PASSWORD : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="pwd" runat="server" BackColor="#99CCFF" BorderColor="#003366" Height="30px" Width="250px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="result" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="REGISTER" />
</div>
        </div>
    </form>
</body>
</html>
