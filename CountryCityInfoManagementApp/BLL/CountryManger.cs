using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityInfoManagementApp.DAL;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp.BLL
{
    public class CountryManger
    {
        CountryGateway countryGateway=new CountryGateway();
        public bool CheckIsFieldEmpty(Country country)
        {
            if (country.CountryName.Equals(string.Empty)||country.CountryAbout.Equals(string.Empty))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public string Insert(Country country)
        {
            if (!CheckIsFieldEmpty(country))
            {
                if (countryGateway.Insert(country))
                {
                    return "Insertion SuccessFull";
                    
                }
                else
                {
                    return "Country Name Already Exist or Database Not Working";
                }
                
            }
            else
            {
                return "Please Fill The Field First";
            }
        }


        public List<Country> GetAllCountryList()
        {
            return countryGateway.GetAllCountryList();
        }

        public List<Country> GetSearchCountryInfo(string countryName)
        {
           var result= CountryGateway.IsCountryExist(countryName);
            var country = countryGateway.GetSearchCountryInfo(countryName);
            if (result.CountryAbout!=null&&country.Count==0)
            {
                return new List<Country>()
                {
                    new Country {CountryName = countryName,NoOfCityDwellers = 0 , NoOfCity=0,CountryAbout = result.CountryAbout}
                };
            }
            else if (result.CountryAbout == null && country.Count == 0)
            {
                return null;
            }
            else
            {
                return country;
            }
          
        }

        public List<Country> GetAll()
        {
            return countryGateway.GetAll();
        }
    }
}