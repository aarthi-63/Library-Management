<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home Page.aspx.cs" Inherits="Library_Management.Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            display:flex;
        }
        .auto-style1 {
            width: 612px;
            height: 408px;
        }
        .auto-style2 {
            width: 286px;
            height: 253px;
        }
        .auto-style3 {
            width: 360px;
            height: 360px;
        }
        .border{
            border-radius:25px;
            margin-top:30px;
        }
        .topic{
            margin-left:40%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div style="height: 535px; width: 20%; background-color: #000066; text-align: center; position: fixed;">

                <img alt="library" class="auto-style1" src="images/library.jpg" style="width: 100%; height: 120px" /><br />

                <br />
                <div style="margin-top: 35px">
                &nbsp;<img alt="homelogo" class="auto-style2" src="images/home.jpg" style="width: 30px; height: 30px" /><a href="Home Page.aspx"><asp:Label ID="h" runat="server" Text="Home" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="White"></asp:Label></a>
                </div>
                <div style="margin-top: 50px">
                <a href="Category.aspx"><asp:Label ID="category" runat="server" Text="Category" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="White"></asp:Label></a>
                </div>
                <div style="margin-top: 80%;">
                &nbsp;<img alt="logout" class="auto-style3" src="images/logout_img.jpg" style="width: 30px; height: 30px" /><a href="Login Page.aspx"><asp:Label ID="logout" runat="server" Text="logout" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="White" ></asp:Label></a>
                    </div>
            </div>
            <div style="margin-left: 22%">
                <div>
                 <asp:Label ID="Label16" runat="server" Text="HOME" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="50px" ForeColor="#000099" CssClass="topic"></asp:Label>
                 <br /></div>

                <div style="border: thick solid #3366CC; text-align: center; width: 700px; height: 250px; margin-left: 160px; " class="border">
                <br />
                <asp:Label ID="Label6" runat="server" Text="Library ID : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="id" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                    <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="First Name : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="fname" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                    <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Last Name : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="lname" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                    <br />
                <br />
                <asp:Label ID="Label15" runat="server" Text="Designation : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="designation" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                    <br />
                <br />
                <asp:Label ID="Label14" runat="server" Text="Department : " Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="dept" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large"></asp:Label>
                <br />
                    </div>
                <div>
                <asp:Label ID="Label9" runat="server" Text="Book" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="XX-Large" ForeColor="#000099"></asp:Label>

                    <br />
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <br />

                    </div>
            </div>
        </div>
    </form>
</body>
</html>
