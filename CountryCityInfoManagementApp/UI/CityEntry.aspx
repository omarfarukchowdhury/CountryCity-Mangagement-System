<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityEntry.aspx.cs" Inherits="CountryCityInfoManagementApp.CityEntry" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>City Entry</title>
  
    <link href="../CSS/reset.css" rel="stylesheet" />
    <link href="../CSS/Gridstyle.css" rel="stylesheet" />
    <link href="../CSS/StyleSheet.css" rel="stylesheet" />
    <link href="../Bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
     <link href="../Bootstrap/bootstrap.min.css" rel="stylesheet" />
     <link href="../Bootstrap/bootstrap.min.js" rel="stylesheet" />
    <script src="../tinymce/tinymce.min.js"></script>
    <script>tinymce.init({ selector: 'textarea' });</script>
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
        <div class="middle">
            
        <form id="form1" runat="server">
                  
               <fieldset>
                    <div class="first jumbotron"> 
                   <legend>City Entry</legend>
                
                  
                         <div class="col-sm-4"><asp:Label ID="Label1" runat="server" Text="Name" ></asp:Label></div>
                        <div class="col-sm-4"> <asp:Label ID="Label3" runat="server" Text="NO Of Dwellers" ></asp:Label></div>
                       <div class="col-sm-4"> <asp:Label ID="Label4" runat="server" Text="Location" ></asp:Label></div>
                        <div class="col-sm-4"><asp:TextBox ID="nameTextBox" runat="server" Class="form-control" ></asp:TextBox></div>
                         <div class="col-sm-4"><asp:TextBox ID="noOfDwellersTextBox" runat="server" Class="form-control"></asp:TextBox></div>  
                        <div class="col-sm-4"><asp:TextBox ID="locationTextBox" runat="server" Class="form-control"></asp:TextBox></div>      
                         <div class="col-sm-4"><asp:Label ID="Label5" runat="server" Text="Weather" ></asp:Label></div>
                          <div class="col-sm-8"><asp:Label ID="Label6" runat="server" Text="Country" ></asp:Label></div>
                         <div class="col-sm-4"><asp:TextBox ID="weatherTextBox" runat="server" Class="form-control"></asp:TextBox></div>         
                        <div class="col-sm-8"><asp:DropDownList ID="countryDropDownList" runat="server" Class="form-control"></asp:DropDownList></div> 
                        <br/><br/><br/><br/><br/><br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server"  Text="About"></asp:Label>
                        
                         <textarea runat="server" id="aboutTextBox" ></textarea>
                    <br/>
                    <div class="alert alert-info"><asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></div><br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" class="btn btn-success btn-lg" /> &nbsp;&nbsp;
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" OnClick="cancelButton_Click" class="btn btn-danger btn-lg"/>
                   
                    
                  </div>
                
                   </fieldset>
            
            <div class="second">
            
                <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" Width="687px" >
            
                    <AlternatingRowStyle CssClass="alt" />
            
                    <Columns >
                
                        <asp:TemplateField HeaderText="Serial No" >
                            <ItemTemplate><%#Eval("SerialNo") %></ItemTemplate>
                        </asp:TemplateField>
                
                        <asp:TemplateField HeaderText="City Name">
                            <ItemTemplate><%#Eval("CityName") %></ItemTemplate>
                        </asp:TemplateField>
                
                        <asp:TemplateField HeaderText="No Of Dwellers">
                            <ItemTemplate><%#Eval("NoOfDwellers") %></ItemTemplate>
                        </asp:TemplateField>
                
                        <asp:TemplateField HeaderText="Country Name">
                            <ItemTemplate><%#Eval("MyCountry.CountryName") %></ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
        
                    <PagerStyle CssClass="pgr" />
        
                </asp:GridView>
                </div>
       
                
        </form>
            </div>
        <footer>Develoved By Robust Storm Team</footer>
    </div>
         
           
</body>
</html>
