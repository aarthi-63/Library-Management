<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Library_Management.Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            display:flex;
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
                &nbsp;<img alt="homelogo" class="auto-style2" src="images/home.jpg" style="width: 30px; height: 30px" /><a href="Home Page.aspx"><asp:Label ID="home" runat="server" Text="Home" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="White" ></asp:Label></a>
                </div>
                <div style="margin-top: 50px">
                <a href="Category.aspx"><asp:Label id="cate" runat="server" Text="Category" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="White" ></asp:Label></a>
                </div>
                <div style="margin-top: 80%;">
                &nbsp;<img alt="logout" class="auto-style3" src="images/logout_img.jpg" style="width: 30px; height: 30px" /><a href="Login Page.aspx"><asp:Label ID="logout" runat="server" Text="logout" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="White" ></asp:Label></a>
                    </div>
            </div>
            <div style="text-align: center; margin-left: 21%;">

                <asp:Label ID="Label16" runat="server" Text="CATEGORY" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="50px" ForeColor="#000099" ></asp:Label>

                <br />

                <br />
                <asp:Label ID="Label2" runat="server" Text="Category of books available in Library" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large"></asp:Label>
                <br />
                <br />

                <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#99CCFF" Height="30px" Width="260px" style="border: 2px solid #003366 ; height:35px;">
                    <asp:ListItem>Arts &amp; Music</asp:ListItem>
                    <asp:ListItem>Biographies</asp:ListItem>
                    <asp:ListItem>Business</asp:ListItem>
                    <asp:ListItem>Comics</asp:ListItem>
                    <asp:ListItem>Computer &amp; Tech</asp:ListItem>
                    <asp:ListItem>Cooking</asp:ListItem>
                    <asp:ListItem>Education &amp; Reference</asp:ListItem>
                    <asp:ListItem>Entertainment</asp:ListItem>
                    <asp:ListItem>Health &amp; Fitness</asp:ListItem>
                    <asp:ListItem>Horror</asp:ListItem>
                    <asp:ListItem>Kids</asp:ListItem>
                    <asp:ListItem>Medical</asp:ListItem>
                    <asp:ListItem>Mysteries</asp:ListItem>
                    <asp:ListItem>Science &amp; Math</asp:ListItem>
                    <asp:ListItem>Social Science</asp:ListItem>
                    <asp:ListItem>Sports</asp:ListItem>
                    <asp:ListItem>Travel</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="display" runat="server" OnClick="display_Click" Text="DISPLAY" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
                <div style="border: thick solid #3366CC; width: 600px; border-radius:20px; text-align: center; margin-left: 180px; padding-top: 10px;">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="BOOK ID : "></asp:Label>

                <asp:TextBox ID="bookid" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                    <br />
                    <br />
            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="FROM DATE : "></asp:Label>

                <asp:TextBox ID="fdate" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px">YYYY-MM-DD</asp:TextBox>
                    <br />
                    <br />
            <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="TO DATE : "></asp:Label>

                <asp:TextBox ID="tdate" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px">YYYY-MM-DD</asp:TextBox>

                <br />
                    <br />
                <asp:Label ID="error" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="BORROW" OnClick="Button1_Click" />
                    <br />
                <br />
                    </div>
            </div>
        </div>
    </form>
</body>
</html>
