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
    public partial class ViewCities : System.Web.UI.Page
    {
        CityManger cityManger=new CityManger();
        CountryManger countryManger=new CountryManger();
        List<City> cityList;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                List<Country> countryList = countryManger.GetAllCountryList();

                countryNameDropDownList.DataSource = countryList;
                countryNameDropDownList.DataValueField = "CountryID";
                countryNameDropDownList.DataTextField = "CountryName";
                countryNameDropDownList.DataBind();
                BindData(cityManger.GetAllCities());
            }
            
            
            

        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
           
            var value = cityNameTextBox.Text;
            if (cityNameRadioButton.Checked)
            {
                BindData(cityManger.GetDataListByName("CityName",value));
                cityNameTextBox.Text = "";
            }
            else if (CountryNameRadioButton.Checked)
            {
                cityList =cityManger. GetDataListByID("CountryID", countryNameDropDownList.SelectedValue);
                Session["cityList"] = cityList;
                if (cityList.Count==0)
                {
                    messageLabel.Text = "There is no data that your Searched";
                    BindData(null);
                }
                else
                {
                    BindData(cityList);
                    cityNameTextBox.Text = "";
                }
                
            }
            else
            {
                messageLabel.Text = "First Select Any Type";
                cityNameTextBox.Text = "";
                BindData(null);
            }
           
        }

        private void BindData(List<City> city)
        {
            showGridView.DataSource = city;
            showGridView.DataBind();
        }


        protected void showGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityList = (List<City>)Session["cityList"];
            if (cityList == null || cityList.Count == 0)
            {
                showGridView.PageIndex = e.NewPageIndex;
                BindData(cityManger.GetAllCities());
            }
            else
            {
                showGridView.PageIndex = e.NewPageIndex;
                BindData(cityList);

            }
        }
    }
}