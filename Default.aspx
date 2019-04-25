<%@ Page Title="Добре дошли в XmlSample" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XmlSample.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>
            <asp:Button ID="ImportButton" runat="server" Text="Прехвърляне на XML файлове в БД" PostBackUrl="~/WebForm1.aspx" />
        </li>
        <li>
            <asp:Button ID="EnterDate" runat="server" Text="Въвеждане на данни" PostBackUrl="~/WebForm2.aspx" />
            
        </li>
    </ol>



</asp:Content>
