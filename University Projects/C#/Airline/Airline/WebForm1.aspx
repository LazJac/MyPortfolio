<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Airline.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Passenger Name :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="218px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Passenger name is required"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Telephone Number : "></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Width="216px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Valid format (016) 910-3200" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Width="71px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Choose your destination"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Durban</asp:ListItem>
            <asp:ListItem>Cape Town</asp:ListItem>
            <asp:ListItem>Port Elizabeth</asp:ListItem>
            <asp:ListItem>Polokwane</asp:ListItem>
            <asp:ListItem>Bloemfontein</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnFindInfo" runat="server" OnClick="btnFindInfo_Click" Text="Find Info" Width="91px" />
        <br />
        <br />
        <br />
        <asp:Label ID="lblResponse" runat="server"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm2.aspx" Target="_blank">View Info</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
