<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryEntry.aspx.cs" Inherits="CountryCityInfoManagementApp.Home" ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Country Entry</title>
  
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
                 
                      <div class="first jumbotron">
                      
                         
                          <fieldset >
                              <legend>Country Entry</legend>
                               <asp:Label ID="Label" runat="server" Text="Name"></asp:Label>
                              <br/>
                              <div class="col-sm-push-4"><asp:TextBox  Class="form-control" ID="nameTextBox" runat="server"></asp:TextBox></div>
                              <asp:Label ID="Label2" runat="server" Text="About"></asp:Label>
                              <br />
                              <div class="col-sm-push-4"><textarea  Class="form-control" id="aboutTextBox" runat="server"></textarea></div>
                              <br />
                      
                              <div class="alert alert-info"> <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></div>
                              <br />
                              <asp:Button Class="btn btn-success btn-lg" ID="saveButton1" runat="server" Text="Save" OnClick="saveButton1_Click" />
                              &nbsp;&nbsp;&nbsp;
                              <asp:Button Class="btn btn-danger btn-lg" ID="cancelButton" runat="server" Text="Cancel" OnClick="cancelButton_Click" />
                              <br />
                              <br />
                   
                              <br />
                          </fieldset>
           
                 </div>

                 <div class="second">
                     
                     <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" Width="687px" >
                               <Columns >
                                
                                   <asp:TemplateField HeaderText="Serial No" >
                                       <ItemTemplate><%#Eval("SerialNo") %></ItemTemplate>
                                   </asp:TemplateField>
                  
                                   <asp:TemplateField HeaderText="Name" Visible="True">
                                       <ItemTemplate><%#Eval("CountryName") %></ItemTemplate>
                                   </asp:TemplateField>
                  
                                   <asp:TemplateField HeaderText="About">
                                       <ItemTemplate><%#Eval("CountryAbout") %></ItemTemplate>
                                   </asp:TemplateField>
                                       
                               </Columns>  
                           </asp:GridView>
                </div>
                 </form>
            </div>
        
         
        <footer>Developed By Robust Storm Team</footer>

      </div>
</body>
</html>
