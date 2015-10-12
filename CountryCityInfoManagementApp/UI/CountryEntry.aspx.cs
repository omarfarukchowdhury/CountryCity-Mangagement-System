using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityInfoManagementApp.BLL;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp
{
    public partial class Home : System.Web.UI.Page
    {
        CountryManger countryManger=new CountryManger();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData(countryManger.GetAllCountryList());

        }

        private void BindData(List<Country> country)
        {
            showGridView.DataSource = country;
            showGridView.DataBind();
            
        }

        protected void saveButton1_Click(object sender, EventArgs e)
        {
            Country country = SetFormDataToCountry();
            messageLabel.Text = countryManger.Insert(country);
            ClearForm();
            BindData(countryManger.GetAllCountryList());
        }

        private void ClearForm()
        {
            nameTextBox.Text=string.Empty;
            aboutTextBox.Value = string.Empty;
        }

        private Country SetFormDataToCountry()
        {
            var name = nameTextBox.Text;
            var about =aboutTextBox.Value;
            
            return new Country(name, about);
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

       
    }
}