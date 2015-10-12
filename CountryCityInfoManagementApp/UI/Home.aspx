<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CountryCityInfoManagementApp.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
   
    <link href="../CSS/reset.css" rel="stylesheet" />
    <link href="../CSS/Gridstyle.css" rel="stylesheet" />
    <link href="../CSS/StyleSheet.css" rel="stylesheet" />
    <link href="../Bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
     <link href="../Bootstrap/bootstrap.min.css" rel="stylesheet" />
     <link href="../Bootstrap/bootstrap.min.js" rel="stylesheet" />
</head>
<body>
    <div class="wrapper h"> <div class="middle">
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
                                       <div>
                                           <fieldset>
                                               <div class="home alert alert-info"> <legend>Welcome To Country & City Information Management</legend></div><br/><br/>
                                               <div class="pic"><img src="../Pic/world_pol495.jpg" width="400px" height="200px" /></div>
                                               
                                               <div class="button">
                                                   
                                                 <asp:LinkButton Class="btn btn-primary btn-lg"  ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Country Entry</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                                      <asp:LinkButton Class="btn btn-primary btn-lg" ID="LinkButton" runat="server" OnClick="LinkButton_Click">City Entry</asp:LinkButton>
                                                   <br/><br/>
                                                <asp:LinkButton Class="btn btn-primary btn-lg"  ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">View Cities</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                                 <asp:LinkButton Class="btn btn-primary btn-lg"  ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">View Country</asp:LinkButton>

                                               </div>                                             
                                               <br />

                                           </fieldset>
    
                                       </div>
                                   </form></div>
        <footer>Developed BY Robust Storm Team</footer></div>
</body>
</html>
