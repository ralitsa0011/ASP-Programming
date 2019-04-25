<%@ Page Title="Въвеждане на данни" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="XmlSample.WebForm2" MaintainScrollPositionOnPostback="true" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 221px;
        }
    </style> 
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HyperLink ID="BackHyperLink" runat="server" NavigateUrl="~/Default.aspx" meta:resourcekey="BackHyperLinkResource2">Връщане към началната страница</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="DbStatusLabel" runat="server" meta:resourcekey="DbStatusLabelResource2"></asp:Label>
    <br />
    <asp:Label ID="XmlStatusLabel" runat="server" meta:resourcekey="XmlStatusLabelResource2"></asp:Label>
    <br />
    <br />
    <table>
        <colgroup>
            <col width="208px" />
            <col />
        </colgroup>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblHotelId" runat="server" AssociatedControlID="InpHotelID" meta:resourcekey="lblHotelIdResource2">ID на хотела: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpHotelID" meta:resourcekey="InpHotelIDResource2" MaxLength="7" />
                <asp:RequiredFieldValidator ID="rfvHID" ErrorMessage="Задължително поле ID на хотела" ControlToValidate="InpHotelID"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="rfvHIDResource2" />
                <asp:CustomValidator ID="CustomValidatorHotelD" ControlToValidate="InpHotelID"
                    Display="Dynamic" ForeColor="Red" OnServerValidate="ValidateHotelID" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="CustomValidatorHotelDResource2" />
                <asp:RegularExpressionValidator ID="RlrID" runat="server"
                    ErrorMessage="Въведете ID във формат ID00000" ControlToValidate="InpHotelID" ValidationExpression="ID\d{5}"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="HotelValidationGroup"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblHotelName" runat="server" AssociatedControlID="InpHotelName" meta:resourcekey="lblHotelNameResource2">Име на хотела: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpHotelName" meta:resourcekey="InpHotelNameResource2" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvHName" ErrorMessage="Задължително поле Име на хотела" ControlToValidate="InpHotelName"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="rfvHNameResource2" />
                <asp:RegularExpressionValidator ID="HotelNameRegularExpressionValidator" runat="server"
                    ErrorMessage="Не са разрешени числа и символи . / \ + , ; ': &quot; " ControlToValidate="InpHotelName" ValidationExpression="[^./\{1-9}+,;':&quot;]+"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="HotelValidationGroup"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblHotelCategory" runat="server" AssociatedControlID="InpCategory" meta:resourcekey="lblHotelCategoryResource2">Категория на хотела: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpCategory" meta:resourcekey="InpCategoryNameResource2" MaxLength="13" />
                <asp:RequiredFieldValidator ID="rfvHCategory" ErrorMessage="Задължително поле Категория на хотела" ControlToValidate="InpCategory"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="rfvHCategoryResource2" />
                <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                    ErrorMessage="Разрешени възможности:Тризвезден,Четиризвезден,Петзвездeн" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="InpCategory"     
                                    ValidationExpression="Тризвезден|Четиризвезден|Петзвездeн" />
                       
                       
                       
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblHotelWebsite" runat="server" AssociatedControlID="InpWebsite" meta:resourcekey="lblHotelWebsiteResource2">Уебсайт на хотела: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpWebsite" meta:resourcekey="InpWebsiteResource2" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvHWebsite" ErrorMessage="Задължително поле Уебсайт  на хотела" ControlToValidate="InpWebsite"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="rfvHWebsiteResource2" />
                 <asp:RegularExpressionValidator ID="RegularExpressionWebsite" runat="server"
                    ErrorMessage="Валиден формат: http://.... " ControlToValidate="InpWebsite" ValidationExpression="^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?$"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="HotelValidationGroup"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblHotelDescription" runat="server" AssociatedControlID="InpDescription" meta:resourcekey="lblHotelDescriptionResource2">Кратко описание на хотела: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpDescription" meta:resourcekey="InpDescriptionResource2" MaxLength="500" />
                <asp:RequiredFieldValidator ID="rfvHDescription" ErrorMessage="Задължително поле Кратко описание  на хотела" ControlToValidate="InpDescription"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="rfvHDescriptionResource2" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblHotelFacilities" runat="server" AssociatedControlID="InpFacilities" meta:resourcekey="lblHotelFacilitiesResource2">Удобства в хотела: *</asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="InpFacilities" meta:resourcekey="InpFacilitiesResource2" MaxLength="300" />
                <asp:RequiredFieldValidator ID="rfvHFacilities" ErrorMessage="Задължително поле Удобства в хотела" ControlToValidate="InpFacilities"
                    ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="HotelValidationGroup" meta:resourcekey="rfvHFacilitiesResource2" />
            </td>
        </tr>
    </table>

     
  
<br />
    <fieldset>
        <legend>Помещения в хотела</legend>

        <asp:ListView ID="PremisesListView" runat="server" ItemType="XmlSample.HotelsModels.Premise" DataKeyNames="premise_id"
            SelectMethod="PremisesListView_GetData" InsertItemPosition="LastItem" InsertMethod="PremisesListView_InsertItem">

            <LayoutTemplate>
                <table runat="server" id="PremisesTable">
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr id="Tr1" runat="server">
                    <td id="Td1" colspan="2" runat="server">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr id="Tr2" runat="server">
                    <td id="Td2" runat="server">
                        <asp:Label ID="PremiseIDLabel" runat="server" AssociatedControlID="premise_id">ID:</asp:Label>
                    </td>
                    <td id="Td3" runat="server">
                        <asp:Literal runat="server" ID="premise_id" Text='<%# Item.premise_id %>' />
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td4" runat="server">
                        <asp:Label ID="TypeLabel" runat="server" AssociatedControlID="type">Вид:</asp:Label>
                    </td>
                    <td id="Td5" runat="server">
                        <asp:Literal runat="server" ID="type" Text='<%# Item.type %>' />
                    </td>
                </tr>               
                <tr id="Tr4" runat="server">
                    <td id="Td6" runat="server">
                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="price">Цена:</asp:Label>
                    </td>
                    <td id="Td7" runat="server">
                        <asp:Literal runat="server" ID="price" Text='<%# Item.price %>' />
                    </td>
                </tr>
                <tr id="Tr5" runat="server">
                    <td id="Td8" runat="server">
                        <asp:Label ID="CurrencyLabel" runat="server" AssociatedControlID="currency">Валута:</asp:Label>
                    </td>
                    <td id="Td9" runat="server">
                        <asp:Literal runat="server" ID="currency" Text='<%# Item.currency %>' />
                    </td>
                </tr>
                <tr id="Tr1" runat="server">
                    <td id="Td10" runat="server">
                        <asp:Label ID="furnitureLabel" runat="server" AssociatedControlID="furniture">Обзавеждане:</asp:Label>
                    </td>
                    <td id="Td11" runat="server">
                        <asp:Literal runat="server" ID="furniture" Text='<%# Item.furniture %>' />
                    </td>
                </tr>
                
            </ItemTemplate>

            <InsertItemTemplate>
                <tr id="Tr7" runat="server">
                    <td id="Td13" runat="server">
                        <asp:Label ID="PremiseIDLabel" runat="server" AssociatedControlID="premise_id">ID: *</asp:Label>
                    </td>
                    <td id="Td14" runat="server">
                        <asp:TextBox runat="server" ID="premise_id" Text='<%# BindItem.premise_id %>' MaxLength="7" />
                        <asp:RequiredFieldValidator ID="PremiseIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ID на помещението" ControlToValidate="premise_id" ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RlrPrID" runat="server"
                    ErrorMessage="Въведете ID във формат PR00000" ControlToValidate="premise_id" ValidationExpression="PR\d{5}"
                    ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup"/>
                    </td>
                </tr>
                <tr id="Tr8" runat="server">
                    <td id="Td15" runat="server">
                        <asp:Label ID="TypeLabel" runat="server" AssociatedControlID="type">Вид: *</asp:Label>
                    </td>
                    <td id="Td16" runat="server">
                        <asp:TextBox runat="server" ID="type" Text='<%# BindItem.type %>' MaxLength="40"/>
                       
                        <asp:RequiredFieldValidator ID="typeRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Тип на помещението" ControlToValidate="type" ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup" />
                         <asp:RegularExpressionValidator ID="TypePrRegularExpressionValidator" runat="server"
                            ErrorMessage="Не са разрешени символи . / \ + , ; ': &quot; " ControlToValidate="type" ValidationExpression="[^./\+,;':&quot;]+"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup"/>
                    </td>
                </tr>
                <tr id="Tr9" runat="server">
                    <td id="Td17" runat="server">
                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="price">Цена: *</asp:Label>
                    </td>
                    <td id="Td18" runat="server">
                        <asp:TextBox runat="server" ID="price" Text='<%# BindItem.price %>' />
                        
                        <asp:RequiredFieldValidator ID="priceRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Цена" ControlToValidate="price" ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup" />
                        <asp:CompareValidator ID="PriceCompareValidator" runat="server" ErrorMessage="Цената трябва да е положително десетично число"
                            ForeColor="Red" Display="Dynamic"
                            ValidationGroup="PremiseInsertValidationGroup" Type="Double" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="price" CultureInvariantValues="True" />
                    </td>
                </tr>
                <tr id="Tr10" runat="server">
                    <td id="Td19" runat="server">
                        <asp:Label ID="CurrencyLabel" runat="server" AssociatedControlID="currency">Валута: *</asp:Label>
                    </td>
                    <td id="Td20" runat="server">
                        <asp:TextBox runat="server" ID="currency" Text='<%# BindItem.currency %>' MaxLength="3"/>
                        <asp:RequiredFieldValidator ID="currencyRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Валута" ControlToValidate="currency" ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                    ErrorMessage="Разрешени възможности:BGN,EUR,USD" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="currency"     
                                    ValidationExpression="BGN|EUR|USD" />
                       
                    </td>
                </tr>
                 <tr id="Tr11" runat="server">
                    <td id="Td21" runat="server">
                        <asp:Label ID="furnitureLabel" runat="server" AssociatedControlID="furniture">Обзавеждане: *</asp:Label>
                    </td>
                    <td id="Td22" runat="server">
                        <asp:TextBox runat="server" ID="furniture" Text='<%# BindItem.furniture %>' MaxLength="120" />
                        <asp:RequiredFieldValidator ID="furnitureRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Обзавеждане" ControlToValidate="furniture" ForeColor="Red" Display="Dynamic" ValidationGroup="PremiseInsertValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr12" runat="server">
                    <td id="Td23" colspan="2" runat="server">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Добавяне на това помещение" ValidationGroup="PremiseInsertValidationGroup" />
                        <asp:Button ID="CanceltButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="PremiseInsertValidationSummary" runat="server" ValidationGroup="PremiseInsertValidationGroup" />
                    </td>
                </tr>
              
            </InsertItemTemplate>

        </asp:ListView>

    </fieldset>

      <br />
    <fieldset>
        <legend>Промоции в хотела</legend>

        <asp:ListView ID="OffersListView" runat="server" ItemType="XmlSample.HotelsModels.Offer" DataKeyNames="offer_id"
            SelectMethod="OffersListView_GetData" InsertItemPosition="LastItem" InsertMethod="OffersListView_InsertItem">

            <LayoutTemplate>
                <table runat="server" id="OffersTable">
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr id="Tr15" runat="server">
                    <td id="Td1" colspan="2" runat="server">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr id="Tr16" runat="server">
                    <td id="Td25" runat="server">
                        <asp:Label ID="OfferIDLabel" runat="server" AssociatedControlID="offer_id">ID:</asp:Label>
                    </td>
                    <td id="Td3" runat="server">
                        <asp:Literal runat="server" ID="offer_id" Text='<%# Item.offer_id %>' />
                    </td>
                </tr>
                <tr id="Tr17" runat="server">
                    <td id="Td26" runat="server">
                        <asp:Label ID="TypeOfferLabel" runat="server" AssociatedControlID="type_offer">Вид:</asp:Label>
                    </td>
                    <td id="Td27" runat="server">
                        <asp:Literal runat="server" ID="type_offer" Text='<%# Item.type_offer %>' />
                    </td>
                </tr>   
                <tr id="Tr18" runat="server">
                    <td id="Td28" runat="server">
                        <asp:Label ID="descrOfferLabel" runat="server" AssociatedControlID="descr_offer">Описание:</asp:Label>
                    </td>
                    <td id="Td29" runat="server">
                        <asp:Literal runat="server" ID="descr_offer" Text='<%# Item.descr_offer %>' />
                    </td>
                </tr>                
                <tr id="Tr19" runat="server">
                    <td id="Td30" runat="server">
                        <asp:Label ID="regPriceLabel" runat="server" AssociatedControlID="regular_price">Редовна Цена:</asp:Label>
                    </td>
                    <td id="Td31" runat="server">
                        <asp:Literal runat="server" ID="regular_price" Text='<%# Item.regular_price %>' />
                    </td>
                </tr>
                <tr id="Tr20" runat="server">
                    <td id="Td32" runat="server">
                        <asp:Label ID="CurrencyRegLabel" runat="server" AssociatedControlID="currency_regular">Валута редовна цена:</asp:Label>
                    </td>
                    <td id="Td33" runat="server">
                        <asp:Literal runat="server" ID="currency_regular" Text='<%# Item.currency_regular %>' />
                    </td>
                </tr>
                <tr id="Tr21" runat ="server">
                    <td id="Td34"  runat="server">
                        <asp:Label ID="promoPriceLabel" runat="server" AssociatedControlID="promotional_price">Промоционална Цена:</asp:Label>
                    </td>
                    <td id="Td35" runat="server">
                        <asp:Literal runat="server" ID="promotional_price" Text='<%# Item.promotional_price %>' />
                    </td>
                </tr>
                <tr id="Tr22" runat="server">
                    <td id="Td36" runat="server">
                        <asp:Label ID="promoCurrencyPriceLabel" runat="server" AssociatedControlID="currency_promotional">Валута промоционална цена:</asp:Label>
                    </td>
                    <td id="Td37" runat="server">
                        <asp:Literal runat="server" ID="currency_promotional" Text='<%# Item.currency_promotional %>' />
                    </td>
                </tr>
               
            </ItemTemplate>

            <InsertItemTemplate>
                <tr id="Tr24" runat="server">
                    <td id="Td39" runat="server">
                        <asp:Label ID="OfferIDLabel" runat="server" AssociatedControlID="offer_id">ID: *</asp:Label>
                    </td>
                    <td id="Td40" runat="server">
                        <asp:TextBox runat="server" ID="offer_id" Text='<%# BindItem.offer_id %>' MaxLength="7" />
                        <asp:RequiredFieldValidator ID="OfferIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ID на промицията" ControlToValidate="offer_id" ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RlrOID" runat="server"
                            ErrorMessage="Въведете ID във формат OR00000" ControlToValidate="offer_id" ValidationExpression="OR\d{5}"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup"/>
                    </td>
                </tr>
                <tr id="Tr25" runat="server">
                    <td id="Td41" runat="server">
                        <asp:Label ID="TypeOfferLabel" runat="server" AssociatedControlID="type_offer">Вид: *</asp:Label>
                    </td>
                    <td id="Td42" runat="server">
                        <asp:TextBox runat="server" ID="type_offer" Text='<%# BindItem.type_offer %>' MaxLength="50"/>
                        <asp:RequiredFieldValidator ID="typeOfferRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Вид на промоцията" ControlToValidate="type_offer" ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="TypeRegularExpressionValidator" runat="server"
                            ErrorMessage="Не са разрешени символи . / \ + , ; ': &quot; " ControlToValidate="type_offer" ValidationExpression="[^./\+,;':&quot;]+"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup"/>
                    </td>
                </tr>
                 <tr id="Tr26" runat="server">
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="descr_offer">Описание:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="descr_offer" Text='<%#: BindItem.descr_offer %>' MaxLength="300" />
                    </td>
                </tr>
                <tr id="Tr27" runat="server">
                    <td id="Td43" runat="server">
                        <asp:Label ID="regPriceLabel" runat="server" AssociatedControlID="regular_price">Редовна Цена: *</asp:Label>
                    </td>
                    <td id="Td44" runat="server">
                        <asp:TextBox runat="server" ID="regular_price" Text='<%# BindItem.regular_price %>'/>
                        <asp:RequiredFieldValidator ID="RegPriceRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Редовна Цена" ControlToValidate="regular_price" ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:CompareValidator ID="RegPriceCompareValidator" runat="server" ErrorMessage="Цената трябва да е положително десетично число"
                            ForeColor="Red" Display="Dynamic"
                            ValidationGroup="OfferInsertValidationGroup" Type="Double" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="regular_price" CultureInvariantValues="True" />
                    </td>
                </tr>
                <tr id="Tr28" runat="server">
                    <td id="Td45" runat="server">
                        <asp:Label ID="CurrencyRegLabel" runat="server" AssociatedControlID="currency_regular">Валута редовна цена: *</asp:Label>
                    </td>
                    <td id="Td46" runat="server">
                        <asp:TextBox runat="server" ID="currency_regular" Text='<%# BindItem.currency_regular %>' MaxLength="3" />
                        <asp:RequiredFieldValidator ID="currencyRegRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Валута редовна цена" ControlToValidate="currency_regular" ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="regexpReg" runat="server"     
                                    ErrorMessage="Разрешени възможности:BGN,EUR,USD" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="currency_regular"     
                                    ValidationExpression="BGN|EUR|USD" />
                       
                    </td>
                </tr>
                <tr id="Tr29" runat="server">
                    <td id="Td47" runat="server">
                        <asp:Label ID="promoPriceLabel" runat="server" AssociatedControlID="promotional_price">Промоционална Цена: *</asp:Label>
                    </td>
                    <td id="Td48" runat="server">
                        <asp:TextBox runat="server" ID="promotional_price" Text='<%# BindItem.promotional_price %>' />
                        <asp:RequiredFieldValidator ID="promoRequiredFieldValidator1" runat="server"
                            ErrorMessage="Задължително поле Промоционална Цена" ControlToValidate="regular_price" ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:CompareValidator ID="promoCompareValidator" runat="server" ErrorMessage="Цената трябва да е положително десетично число"
                            ForeColor="Red" Display="Dynamic"
                            ValidationGroup="OfferInsertValidationGroup" Type="Double" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="promotional_price" CultureInvariantValues="True" />
                    </td>
                </tr>
                <tr id="Tr30" runat="server">
                    <td id="Td49" runat="server">
                        <asp:Label ID="promoCurrencyPriceLabel" runat="server" AssociatedControlID="currency_promotional">Валута промоционална цена: *</asp:Label>
                    </td>
                    <td id="Td50" runat="server">
                        <asp:TextBox runat="server" ID="currency_promotional" Text='<%# BindItem.currency_promotional %>' MaxLength="3" />
                        <asp:RequiredFieldValidator ID="currencyProRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Валута промоционална цена" ControlToValidate="currency_promotional" ForeColor="Red" Display="Dynamic" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RegularE" runat="server"     
                                    ErrorMessage="Разрешени възможности:BGN,EUR,USD" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="currency_promotional"     
                                    ValidationExpression="BGN|EUR|USD" />
                       
                    </td>
                </tr>
                <tr id="Tr31" runat="server">
                    <td id="Td51" colspan="2" runat="server">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Добавяне на промоцията" ValidationGroup="OfferInsertValidationGroup" />
                        <asp:Button ID="CanceltButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="OfferInsertValidationSummary" runat="server" ValidationGroup="OfferInsertValidationGroup" />
                    </td>
                </tr>
              
            </InsertItemTemplate>

        </asp:ListView>

    </fieldset>


     <br />
    <fieldset>
        <legend>Служители в хотела</legend>

        <asp:ListView ID="EmployeesListView" runat="server" ItemType="XmlSample.HotelsModels.Employee" DataKeyNames="employee_id"
            SelectMethod="EmployeesListView_GetData" InsertItemPosition="LastItem" InsertMethod="EmployeesListView_InsertItem">

            <LayoutTemplate>
                <table runat="server" id="EmployeesTable">
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr id="Tr32" runat="server">
                    <td id="Td2" colspan="2" runat="server">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr id="Tr33" runat="server">
                    <td id="Td52" runat="server">
                        <asp:Label ID="EmployeeLabel" runat="server" AssociatedControlID="employee_id">ID:</asp:Label>
                    </td>
                    <td id="Td53" runat="server">
                        <asp:Literal runat="server" ID="employee_id" Text='<%# Item.employee_id %>' />
                    </td>
                </tr>
                <tr id="Tr34" runat="server">
                    <td id="Td54" runat="server">
                        <asp:Label ID="FNameLabel" runat="server" AssociatedControlID="first_name">Име:</asp:Label>
                    </td>
                    <td id="Td55" runat="server">
                        <asp:Literal runat="server" ID="first_name" Text='<%# Item.first_name %>' />
                    </td>
                </tr>   
                <tr id="Tr35" runat="server">
                    <td id="Td56" runat="server">
                        <asp:Label ID="LNameLabel" runat="server" AssociatedControlID="last_name">Фамилия:</asp:Label>
                    </td>
                    <td id="Td57" runat="server">
                        <asp:Literal runat="server" ID="last_name" Text='<%# Item.last_name %>' />
                    </td>
                </tr>  
                 <tr id="Tr36" runat="server">
                    <td id="Td58" runat="server">
                        <asp:Label ID="PosLabel" runat="server" AssociatedControlID="position">Длъжност:</asp:Label>
                    </td>
                    <td id="Td59" runat="server">
                        <asp:Literal runat="server" ID="position" Text='<%# Item.position %>' />
                    </td>
                </tr>               
                <tr id="Tr37" runat="server">
                    <td id="Td60" runat="server">
                        <asp:Label ID="SalaryLabel" runat="server" AssociatedControlID="salary">Заплата:</asp:Label>
                    </td>
                    <td id="Td61" runat="server">
                        <asp:Literal runat="server" ID="salary" Text='<%# Item.salary %>' />
                    </td>
                </tr>
                <tr id="Tr38" runat="server">
                    <td id="Td62" runat="server">
                        <asp:Label ID="SalaryCLabel" runat="server" AssociatedControlID="salary_currency">Валута на Заплата:</asp:Label>
                    </td>
                    <td id="Td63" runat="server">
                        <asp:Literal runat="server" ID="salary_currency" Text='<%# Item.salary_currency %>' />
                    </td>
                </tr>
                <tr id="Tr39" runat ="server">
                    <td id="Td64"  runat="server">
                        <asp:Label ID="GenderLabel" runat="server" AssociatedControlID="gender">Пол:</asp:Label>
                    </td>
                    <td id="Td65" runat="server">
                        <asp:Literal runat="server" ID="gender" Text='<%# Item.gender %>' />
                    </td>
                </tr>
                <tr id="Tr40" runat="server">
                    <td id="Td66" runat="server">
                        <asp:Label ID="DateLabel" runat="server" AssociatedControlID="birth_date">Рождена дата:</asp:Label>
                    </td>
                    <td id="Td67" runat="server">
                        <asp:Literal runat="server" ID="birth_date" Text='<%# Item.birth_date %>' />
                    </td>
                </tr>
                
            </ItemTemplate>

            <InsertItemTemplate>
                <tr id="Tr42" runat="server">
                    <td id="Td69" runat="server">
                        <asp:Label ID="EmployeeLabel" runat="server" AssociatedControlID="employee_id">ID: *</asp:Label>
                    </td>
                    <td id="Td70" runat="server">
                        <asp:TextBox runat="server" ID="employee_id" Text='<%# BindItem.employee_id %>' MaxLength="7"/>
                        <asp:RequiredFieldValidator ID="EmployeeIDRequiredFieldValidator1" runat="server"
                            ErrorMessage="Задължително поле ID" ControlToValidate="employee_id" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RlrEmplID" runat="server"
                            ErrorMessage="Въведете ID във формат EM00000" ControlToValidate="employee_id" ValidationExpression="EM\d{5}"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup"/>
                    </td>
                </tr>
                <tr id="Tr43" runat="server">
                    <td id="Td71" runat="server">
                        <asp:Label ID="FNameLabel" runat="server" AssociatedControlID="first_name">Име: *</asp:Label>
                    </td>
                    <td id="Td72" runat="server">
                        <asp:TextBox runat="server" ID="first_name" Text='<%# BindItem.first_name %>' MaxLength="13"/>
                        <asp:RequiredFieldValidator ID="FRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Име на служителя" ControlToValidate="first_name" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    <asp:RegularExpressionValidator ID="HotelNameRegularExpressionValidator" runat="server"
                             ErrorMessage="Не са разрешени числа и символи . / \ + , ; ': &quot; " ControlToValidate="first_name" ValidationExpression="[^./\{1-9}+,;':&quot;]+"
                             ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr44" runat="server">
                    <td id="Td73" runat="server">
                        <asp:Label ID="LNameLabel" runat="server" AssociatedControlID="last_name">Фамилия: *</asp:Label>
                    </td>
                    <td id="Td74" runat="server">
                        <asp:TextBox runat="server" ID="last_name" Text='<%# BindItem.last_name %>' MaxLength="13"/>
                        <asp:RequiredFieldValidator ID="LRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Фамилия на служителя" ControlToValidate="last_name" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                             ErrorMessage="Не са разрешени числа и символи . / \ + , ; ': &quot; " ControlToValidate="last_name" ValidationExpression="[^./\{1-9}+,;':&quot;]+"
                             ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr45" runat="server">
                    <td id="Td75" runat="server">
                        <asp:Label ID="PosLabel" runat="server" AssociatedControlID="position">Длъжност: *</asp:Label>
                    </td>
                    <td id="Td76" runat="server">
                        <asp:TextBox runat="server" ID="position" Text='<%# BindItem.position %>' MaxLength="50"/>
                        <asp:RequiredFieldValidator ID="PosRequiredFieldValidator2" runat="server"
                            ErrorMessage="Задължително поле Длъжност на служителя" ControlToValidate="position" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr46" runat="server">
                    <td id="Td77" runat="server">
                        <asp:Label ID="SalaryLabel" runat="server" AssociatedControlID="salary">Заплата: *</asp:Label>
                    </td>
                    <td id="Td78" runat="server">
                        <asp:TextBox runat="server" ID="salary" Text='<%# BindItem.salary %>' />
                        <asp:RequiredFieldValidator ID="salaryRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Заплата" ControlToValidate="salary" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                        <asp:CompareValidator ID="salaryCompareValidator" runat="server" ErrorMessage="Заплата трябва да е положително десетично число"
                            ForeColor="Red" Display="Dynamic"
                            ValidationGroup="EmployeeInsertValidationGroup" Type="Double" ValueToCompare="0" Operator="GreaterThan" ControlToValidate="salary" CultureInvariantValues="True" />
                    </td>
                </tr>
                <tr id="Tr47" runat="server">
                    <td id="Td79" runat="server">
                        <asp:Label ID="SalaryCLabel" runat="server" AssociatedControlID="salary_currency">Валута на Заплата: *</asp:Label>
                    </td>
                    <td id="Td80" runat="server">
                        <asp:TextBox runat="server" ID="salary_currency" Text='<%# BindItem.salary_currency %>' MaxLength="3"/>
                        <asp:RequiredFieldValidator ID="SalaryCRequiredFieldValidator4" runat="server"
                            ErrorMessage="Задължително поле Валута" ControlToValidate="salary_currency" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RegularS" runat="server"     
                                    ErrorMessage="Разрешени възможности:BGN,EUR,USD" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="salary_currency"     
                                    ValidationExpression="BGN|EUR|USD" />
                         
                    </td>
                </tr>
                <tr id="Tr48" runat="server">
                    <td id="Td81" runat="server">
                        <asp:Label ID="GenderLabel" runat="server" AssociatedControlID="gender">Пол: *</asp:Label>
                    </td>
                    <td id="Td82" runat="server">
                        <asp:TextBox runat="server" ID="gender" Text='<%# BindItem.gender %>' MaxLength="4"/>
                        <asp:RequiredFieldValidator ID="GenderRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Пол на служителя" ControlToValidate="gender" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RegularG" runat="server"     
                                    ErrorMessage="Разрешени възможности:Мъж,Жена" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="gender"     
                                    ValidationExpression="Мъж|Жена" />
                    </td>
                </tr>
                <tr id="Tr49" runat="server">
                    <td>
                        <asp:Label ID="DateLabel" runat="server" AssociatedControlID="birth_date">Рождена дата:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="birth_date" Text='<%#: BindItem.birth_date %>' MaxLength="13" />
                         <asp:RegularExpressionValidator ID="RegularD" runat="server"     
                                    ErrorMessage="Невалиден формат на дата.Въведете:дд-мм-гггг" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="birth_date"     
                                    ValidationExpression="^([012]\d|30|31)-(0\d|10|11|12)-\d{4}$" />
                    </td>
                </tr>
                <tr id="Tr56" runat="server">
                    <td id="Td99" colspan="2" runat="server">
                        <asp:Button ID="Button2" runat="server" CommandName="Insert" Text="Добавяне на служител " ValidationGroup="EmployeeInsertValidationGroup" />
                        <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="EmployeeInsertValidationSummary" runat="server" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
              
            </InsertItemTemplate>

        </asp:ListView>

    </fieldset>
<!--
      -->
   
  <br />
    <fieldset>
        <legend>Мнения за хотела</legend>

        <asp:ListView ID="ReviewsListView" runat="server" ItemType="XmlSample.HotelsModels.Review" DataKeyNames="review_id"
           SelectMethod="ReviewsListView_GetData" InsertItemPosition="LastItem" InsertMethod="ReviewsListView_InsertItem" >
            <LayoutTemplate>
                <table runat="server" id="ReviewsTable">
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr id="Tr13" runat="server">
                    <td id="Td24" colspan="2" runat="server">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr id="Tr50" runat="server">
                    <td id="Td83" runat="server">
                        <asp:Label ID="ReviewIDLabel" runat="server" AssociatedControlID="review_id">ID:</asp:Label>
                    </td>
                    <td id="Td84" runat="server">
                        <asp:Literal runat="server" ID="review_id" Text='<%# Item.review_id %>' />
                    </td>
                </tr>
                <tr id="Tr51" runat="server">
                    <td id="Td85" runat="server">
                        <asp:Label ID="RewLabel" runat="server" AssociatedControlID="reviewer">Оценяващ:</asp:Label>
                    </td>
                    <td id="Td86" runat="server">
                        <asp:Literal runat="server" ID="reviewer" Text='<%# Item.reviewer %>' />
                    </td>
                </tr>   
                <tr id="Tr52" runat="server">
                    <td id="Td87" runat="server">
                        <asp:Label ID="RatingLabel" runat="server" AssociatedControlID="rating">Оценка:</asp:Label>
                    </td>
                    <td id="Td88" runat="server">
                        <asp:Literal runat="server" ID="rating" Text='<%# Item.rating %>' />
                    </td>
                </tr>  
                 <tr id="Tr53" runat="server">
                    <td id="Td89" runat="server">
                        <asp:Label ID="CommentLabel" runat="server" AssociatedControlID="comment">Коментар:</asp:Label>
                    </td>
                    <td id="Td90" runat="server">
                        <asp:Literal runat="server" ID="comment" Text='<%# Item.comment %>' />
                    </td>
                </tr>               
               
            </ItemTemplate>

            <InsertItemTemplate>
                <tr id="Tr55" runat="server">
                    <td id="Td92" runat="server">
                        <asp:Label ID="ReviewIDLabel" runat="server" AssociatedControlID="review_id">ID: *</asp:Label>
                    </td>
                    <td id="Td93" runat="server">
                        <asp:TextBox runat="server" ID="review_id" Text='<%# BindItem.review_id %>' MaxLength="7" />
                        <asp:RequiredFieldValidator ID="ReviewIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ID" ControlToValidate="review_id" ForeColor="Red" Display="Dynamic" ValidationGroup="ReviewInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RlrRWID" runat="server"
                            ErrorMessage="Въведете ID във формат RW00000" ControlToValidate="review_id" ValidationExpression="RW\d{5}"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="ReviewInsertValidationGroup"/>
                    </td>
                </tr>
                <tr id="Tr14" runat="server">
                    <td id="Td94" runat="server">
                        <asp:Label ID="RewLabel" runat="server" AssociatedControlID="reviewer">Оценяващ: *</asp:Label>
                    </td>
                    <td id="Td95" runat="server">
                        <asp:TextBox runat="server" ID="reviewer" Text='<%# BindItem.reviewer %>'  MaxLength="50" />
                        <asp:RequiredFieldValidator ID="reviewerFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Име на оценяващия" ControlToValidate="reviewer" ForeColor="Red" Display="Dynamic" ValidationGroup="ReviewInsertValidationGroup" />
                    </td>
                </tr>
                <tr id="Tr57" runat="server">
                    <td id="Td96" runat="server">
                        <asp:Label ID="RatingLabel" runat="server" AssociatedControlID="rating">Оценка: *</asp:Label>
                    </td>
                    <td id="Td97" runat="server">
                        <asp:TextBox runat="server" ID="rating" Text='<%# BindItem.rating %>'  MaxLength="13"/>
                        <asp:RequiredFieldValidator ID="ratingRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Оценка " ControlToValidate="rating" ForeColor="Red" Display="Dynamic" ValidationGroup="ReviewInsertValidationGroup" />
                        <asp:RegularExpressionValidator ID="RegularG" runat="server"     
                                    ErrorMessage="Разрешени възможности:Положителен,Отрицателен" 
                                    ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="rating"     
                                    ValidationExpression="Положителен|Отрицателен" />
                    </td>
                </tr>
                <tr id="Tr58" runat="server">
                    <td>
                        <asp:Label ID="CommentLabel" runat="server" AssociatedControlID="comment">Коментар:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="comment" Text='<%#: BindItem.comment %>'   MaxLength="300"/>
                    </td>
                </tr>
                <tr id="Tr59" runat="server">
                    <td id="Td98" colspan="2" runat="server">
                        <asp:Button ID="Button5" runat="server" CommandName="Insert" Text="Добавяне на мнение " ValidationGroup="ReviewInsertValidationGroup" />
                        <asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Cancel" Text="Изчистване на полетата" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="ReviewInsertValidationSummary" runat="server" ValidationGroup="ReviewInsertValidationGroup" />
                    </td>
                </tr>
              
            </InsertItemTemplate>

        </asp:ListView>

    </fieldset>

      
    <asp:Button ID="SubmitButton" runat="server" Text="Запис на хотела" ValidationGroup="HotelValidationGroup" OnClick="SubmitButton_Click" />

    <asp:ValidationSummary ID="HotelValidationSummary" runat="server" ValidationGroup="HotelValidationGroup" />

</asp:Content>
