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
    public partial class ViewCountry : System.Web.UI.Page
    {
        CountryManger countryManger=new CountryManger();
        List<Country> search=new List<Country>();
        List<Country> full = new List<Country>();
        protected void Page_Load(object sender, EventArgs e)
        {
            full = countryManger.GetAll();
            Session["full"] = full;
            BindData(full);
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            var country = nameTextBox.Text;
            search = countryManger.GetSearchCountryInfo(country);
            Session["search"] = search;
            BindData(search);
        }

        private void BindData(List<Country> country)
        {
            showGridView.DataSource = country;
            showGridView.DataBind();
        }

        protected void showGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            full = (List<Country>) Session["full"];
            if (full==null||full.Count==0)
            {
                showGridView.PageIndex = e.NewPageIndex;
                BindData(countryManger.GetSearchCountryInfo(nameTextBox.Text));  
            }
            else
            {
                showGridView.PageIndex = e.NewPageIndex;
                BindData(countryManger.GetAll());  
            }
            
        }
    }
}