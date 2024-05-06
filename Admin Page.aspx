<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Page.aspx.cs" Inherits="Library_Management.Admin_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            display:flex;
            border:thick solid #3366CC;
            border-radius:15px;
            margin-top:50px;
            width:670px;
            margin-left:300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Label ID="Label9" runat="server" Text="ADMIN PAGE" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="XX-Large" ForeColor="#000099"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Small" Text="USERNAME : "></asp:Label>

            <asp:Label ID="uname" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Small"></asp:Label>

                <br />
            <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Small" Text="FIRST NAME : "></asp:Label>

            <asp:Label ID="fname" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Small"></asp:Label>

                <br />
            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Small" Text="LAST NAME : "></asp:Label>

            <asp:Label ID="lname" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Small"></asp:Label>
            <br />
            <div>
                <img alt="logout" class="auto-style3" src="images/logout_img.jpg" style="width: 30px; height: 30px" /><a href="Login Page.aspx"><asp:Label ID="logout" runat="server" Text="logout" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="Maroon" ></asp:Label></a>
            </div>
        </div>
        <div class="container">
             

            <div style="text-align: center; height: 300px; width: 50%;">
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="BOOK ID : "></asp:Label>

                <asp:TextBox ID="bookid" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="BOOK NAME : "></asp:Label>

                <asp:TextBox ID="bookname" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="AUTHOR NAME : "></asp:Label>

                <asp:TextBox ID="aname" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
                 <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="INSERT" />
                 &nbsp;&nbsp;&nbsp;
                 <asp:Button ID="update" runat="server" OnClick="update_Click" Text="UPDATE" />
                <br />
                
                </div>
            <div style="text-align: center; height: 300px; width: 50%;">

                <br />

            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="CATEGORY : "></asp:Label>

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
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="PAGE COUNT : "></asp:Label>

                <asp:TextBox ID="pgcount" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="QUANTITY : "></asp:Label>

                <asp:TextBox ID="qty" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>

                <br />
                <br />
               
               
                <asp:Button ID="delete" runat="server" OnClick="delete_Click" Text="DELETE" />
                &nbsp;&nbsp;&nbsp;
               
               
                <asp:Button ID="select" runat="server" OnClick="select_Click" Text="SELECT" />
                <br />
                <br />

            </div>
        </div>
        <div style="text-align: center">

            <br />
                <asp:Label ID="error" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
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
        <hr />
        <div style="text-align: center; margin-top: 10px;">

            <br />

            <asp:Label ID="label14" runat="server" Text="STATUS UPDATE" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="X-Large" ForeColor="#000099"></asp:Label>

                <br />

                <br />
            <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%">
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
        <div style="border: thick solid #3366CC; border-radius:20px; width: 550px; text-align: center; margin-left: 25%;">

        &nbsp;<br />
            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="LIBRARY ID : "></asp:Label>

                <asp:TextBox ID="lid" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="BOOK ID : "></asp:Label>

                <asp:TextBox ID="bid" runat="server" BackColor="#99CCFF" BorderColor="#003366" BorderStyle="Solid" Height="30px" Width="250px"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="Large" Text="STATUS : "></asp:Label>

                <asp:DropDownList ID="DropDownList2" runat="server" BackColor="#99CCFF" Height="30px" Width="260px" style="border: 2px solid #003366 ; height:35px;">
                    <asp:ListItem>Returned</asp:ListItem>
                    <asp:ListItem>Not Returned</asp:ListItem>
                </asp:DropDownList>
                <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="UPDATE" />
            <br />
            <asp:Label ID="statusresult" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Franklin Gothic Medium" Font-Size="Medium" ForeColor="Red"></asp:Label>
            <br />

        </div>
        <div>

            <br />

        </div>
    </form>
</body>
</html>
