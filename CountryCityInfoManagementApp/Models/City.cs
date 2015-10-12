using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInfoManagementApp.Models
{
    public class City

    {
        public int CityID { get; set; }
        public string CityName { get; set; }
        public string CityAbout { get; set; }
        public double NoOfDwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public Country MyCountry { get; set; }
        public int SerialNo { get; set; }
        

        public City(int cityId,double noOfDwellers, string cityName, string cityAbout,  string location, string weather, Country myCountry, int serialNo)
        {
            CityID = cityId;
            CityName = cityName;
            CityAbout = cityAbout;
            NoOfDwellers = noOfDwellers;
            Location = location;
            Weather = weather;
            MyCountry = myCountry;
            SerialNo = serialNo;
        }
        public City()
        {
            MyCountry=new Country();
        }
    }
}