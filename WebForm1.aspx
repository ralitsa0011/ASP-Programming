<%@ Page Title="Прехвърляне на XML файловете в БД" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="XmlSample.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="BackHyperLink" runat="server" NavigateUrl="~/Default.aspx">Връщане към началната страница</asp:HyperLink>
    <br />
    <br />
    <h2>Резултати от прехвърлянето:</h2>
    <asp:Table ID="ImportStatusTable" runat="server" BorderWidth="1px" CellPadding="10" GridLines="Horizontal"></asp:Table>
    <h2>Хотели в БД:</h2>
    <asp:GridView ID="HotelsGridView" runat="server"
        DataKeyNames="id" ItemType="XmlSample.HotelsModels.Hotel" SelectMethod="HotelsGridView_GetData"
        AllowPaging="True" AutoGenerateColumns="False" PageSize="20" CellPadding="20">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="name" HeaderText="Име" />
            <asp:BoundField DataField="website" HeaderText="Уебсайт" />
        </Columns>
    </asp:GridView>
       <br />
 
</asp:Content>