<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCities.aspx.cs" Inherits="CountryCityInfoManagementApp.ViewCities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Cities</title>

    <link href="../CSS/reset.css" rel="stylesheet" />
    <link href="../CSS/Gridstyle.css" rel="stylesheet" />
    <link href="../CSS/StyleSheet.css" rel="stylesheet" />
    <link href="../Bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../Bootstrap/bootstrap.min.js" rel="stylesheet" />
</head>
<body><div class="wrapper">
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
          <div class="middle">
              <form id="form1" runat="server">
                  <div class="first jumbotron">
                      <fieldset>
                          <legend>Search Criteria</legend>
                          <asp:RadioButton Class="radio-inline" ID="cityNameRadioButton" runat="server" Text="City Name" GroupName="same" />
                          <asp:TextBox  ID="cityNameTextBox" runat="server" Class="form-control"></asp:TextBox>
                          <asp:RadioButton Class="radio-inline" ID="CountryNameRadioButton" runat="server" Text="Country" GroupName="same"/>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:DropDownList Class="form-control" ID="countryNameDropDownList" runat="server">
                          </asp:DropDownList>
                          <br/><br><div class="alert alert-info"> <asp:Label  ID="messageLabel" runat="server" Text=""></asp:Label></div>
                          <asp:Button CssClass="btn btn-primary btn-lg" ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
                           </fieldset>
                          </div>
                  <div class="second">
                          <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="showGridView_PageIndexChanging" PageSize="5"  CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" Width="687px" >
                              <Columns>
                                  <asp:TemplateField HeaderText="Serial No">
                                      <ItemTemplate><%#Eval("SerialNo") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="City Name">
                                      <ItemTemplate><%#Eval("CityName") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="About">
                                      <ItemTemplate><%#Eval("CityAbout") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="No Of Dwellers">
                                      <ItemTemplate><%#Eval("NoOfDwellers") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="Location">
                                      <ItemTemplate><%#Eval("Location") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="Weather">
                                      <ItemTemplate><%#Eval("Weather") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="Country Name">
                                      <ItemTemplate><%#Eval("MyCountry.CountryName") %></ItemTemplate>
                                  </asp:TemplateField>
                    
                                  <asp:TemplateField HeaderText="Country About">
                                      <ItemTemplate><%#Eval("MyCountry.CountryAbout") %></ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                  </div>
              </form>
              <footer>Developed By Robust Storm Team</footer>
          </div>

      </div>
</body>
</html>
