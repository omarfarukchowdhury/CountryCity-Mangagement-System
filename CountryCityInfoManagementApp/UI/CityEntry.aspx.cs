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
    public partial class CityEntry : System.Web.UI.Page
    {
        CityManger cityManger=new CityManger();
        CountryManger countryManger=new CountryManger();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                List<Country> countryList = countryManger.GetAllCountryList();

                countryDropDownList.DataSource = countryList;
                countryDropDownList.DataValueField = "CountryID";
                countryDropDownList.DataTextField = "CountryName";
                countryDropDownList.DataBind();
                BindData(cityManger.GetCountryCity());
            }

        }

        private void BindData(List<City> list)
        {
            showGridView.DataSource = list;
            showGridView.DataBind();
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (noOfDwellersTextBox.Text.Equals(String.Empty))
            {
                messageLabel.Text = "Number Of Dweller is Empty";
            }
            else if (!IsDouble(noOfDwellersTextBox.Text))
            {
                messageLabel.Text = "Please Insert Number in No Of Dwellers Field";
            }
            else
            {
                var city = SetFormDataToCity();
                messageLabel.Text = cityManger.Insert(city);
                BindData(cityManger.GetCountryCity());
                ClearForm(); 
            }
        }

        private bool IsDouble(string textBox)
        {
            try
            {
                double a = Convert.ToDouble(textBox);
                return true;
            }
            catch (Exception)
            {
            
                    return false;
               
               
            }
        }

        private void ClearForm()
        {
            nameTextBox.Text = "";
            aboutTextBox.Value = "";
            noOfDwellersTextBox.Text = "";
            weatherTextBox.Text = "";
            locationTextBox.Text = "";

        }

        private City SetFormDataToCity()
        {
            var city = new City();
            city.CityName = nameTextBox.Text;
            city.CityAbout = aboutTextBox.Value;
            city.NoOfDwellers = Convert.ToDouble(noOfDwellersTextBox.Text);
            city.Location = locationTextBox.Text;
            city.Weather = weatherTextBox.Text;
            city.MyCountry.CountryID= Convert.ToInt32(countryDropDownList.SelectedValue);
            return city;
        }

       
    }
}