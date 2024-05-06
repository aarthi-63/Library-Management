<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login Page.aspx.cs" Inherits="Library_Management.Login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            display:flex;
        }
        .topic{
            padding-left:25%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="LIBRARY MANAGEMENT" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="60px" ForeColor="Black" CssClass="topic"></asp:Label>

            <div class="container">
            <div style="border: thick solid #3366CC; text-align: center; width: 35%;  border-radius: 30px; height: 350px; margin-top: 60px; margin-left: 100px; margin-right: 100px; padding-top: 20px;">

            <asp:Label ID="label9" runat="server" Text="USER LOGIN" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="#000099"></asp:Label>

                <br />
                <br />
                <br />

            <asp:Label ID="label" runat="server" Text="LIBRARY ID : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>

                <asp:TextBox ID="id" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />

            <asp:Label ID="label2" runat="server" Text="PASSWORD : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>

                <asp:TextBox ID="upwd" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="error" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="login" runat="server" Text="LOGIN" OnClick="login_Click" />
                <br />
                <br />
                <br />

            <asp:Label ID="Label4" runat="server" Text="NEW USER ? " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>

            &nbsp;
                <asp:Button ID="reg" runat="server" Text="REGISTER" OnClick="reg_Click" />

            </div>

            <div style="border: thick solid #3366CC; text-align: center; width: 35%; border-radius: 30px; height: 350px; margin-top: 60px; margin-right: 100px; padding-top: 20px;">

                <br />
                <asp:Label ID="label10" runat="server" Text="ADMIN LOGIN" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="#000099"></asp:Label>
                <br />
                <br />
                <asp:Label ID="error0" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br />
                <asp:Label ID="error1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="label5" runat="server" Text="USERNAME : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="aid" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="label6" runat="server" Text="PASSWORD : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="apwd" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="aerror" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="login0" runat="server" Text="LOGIN" OnClick="login0_Click" />

                <br />
                <br />
                <asp:Label ID="statusresult" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>

            </div>
                </div>
        </div>
    </form>
</body>
</html>
