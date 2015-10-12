<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountry.aspx.cs" Inherits="CountryCityInfoManagementApp.ViewCountry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Country</title>
    <link href="../CSS/reset.css" rel="stylesheet" />
    <link href="../CSS/Gridstyle.css" rel="stylesheet" />
    <link href="../CSS/StyleSheet.css" rel="stylesheet" />
    <link href="../Bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
     <link href="../Bootstrap/bootstrap.min.css" rel="stylesheet" />
     <link href="../Bootstrap/bootstrap.min.js" rel="stylesheet" />
</head>
<body>
    <div class="wrapper">
          <nav class=" navbar navbar-inverse">
                    <div class="container">
                        <div class=" navbar-header">
                            <a class="navbar-brand" href="#">Country & City Management</a>
                        </div>
                        <div>
                            <ul class="nav navbar-nav">
                                <li ><a href="Home.aspx">Home</a></li>
                                <li><a href="CountryEntry.aspx">Country Entry</a></li>
                                <li><a href="CityEntry.aspx">City Entry</a></li> 
                                <li><a href="ViewCities.aspx">View Cities</a></li> 
                                <li><a href="ViewCountry.aspx">View Counties</a></li> 
                            </ul>
                        </div>
                    </div>
                </nav>
    
        <form id="form1" runat="server">
        <div class="middle">
            <div class="first jumbotron">
                      <fieldset>
                          <legend>Search Criteria</legend>

                          <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                         <asp:TextBox CssClass="form-control" ID="nameTextBox" runat="server"></asp:TextBox>
                          <br/>
                          <asp:Button CssClass="btn btn-success btn-lg" ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                          <asp:Button CssClass="btn btn-danger btn-lg" ID="cancelButton" runat="server" Text="Cancel" OnClick="cancelButton_Click" />
                      </fieldset>
                  </div>
            <div class="second">
                <asp:GridView ID="showGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="showGridView_OnPageIndexChanging" PageSize="5"  CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" Width="687px" >
                    <Columns >
                    
                        <asp:TemplateField HeaderText="Serial No" >
                            <ItemTemplate><%#Eval("SerialNo") %></ItemTemplate>
                        </asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate><%#Eval("CountryName") %></ItemTemplate>
                        </asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="About">
                            <ItemTemplate><%#Eval("CountryAbout") %></ItemTemplate>
                        </asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="No Of City">
                            <ItemTemplate><%#Eval("NoOfCity") %></ItemTemplate>
                        </asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="No Of City Dwellers">
                            <ItemTemplate><%#Eval("NoOfCityDwellers") %></ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>    
    
      
        </form>
        <footer>Developed By Robust Storm Team</footer>
    </div>
</body>
</html>
