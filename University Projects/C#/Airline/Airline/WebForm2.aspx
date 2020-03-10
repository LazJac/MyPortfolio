<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Airline.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h2>Information</h2>
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx" Target="_blank">Next passenger</asp:HyperLink>
        </p>
    
    </div>
    </form>
</body>
</html>
