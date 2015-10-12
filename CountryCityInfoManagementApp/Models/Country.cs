using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInfoManagementApp.Models
{
    public class Country
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }
        public string CountryAbout { get; set; }
        public int SerialNo { get; set; }
        public  int NoOfCity { get; set; }
        public  double NoOfCityDwellers { get; set; }

        public Country(int countryId, string countryName, string countryAbout):this(countryName,countryAbout)
        {
            CountryID = countryId;
            
        }

        public Country( string countryName, string countryAbout)
        {
            
            CountryName = countryName;
            CountryAbout = countryAbout;
            
        }
        public Country()
        {
            
        }
    }
}