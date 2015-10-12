using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityInfoManagementApp.DAL;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp.BLL
{
    
    
    public class CityManger
    {
        CityGateway cityGateway=new CityGateway();
        public string Insert(City city)
        {
            if (IsFieldEmpty(city))
            {
                return "Please Fill The Field First";
            }
            else if (cityGateway.Insert(city))
            {
                return "Insertion Successfull";
            }
            else
            {
                return "City Name Already Exist";
            }
            
        }

        private bool IsFieldEmpty(City city)
        {
            if (city.CityName.Equals(string.Empty) || city.CityAbout.Equals(string.Empty) || city.NoOfDwellers.Equals(0) || city.Location.Equals(string.Empty) || city.Weather.Equals(string.Empty))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public List<City> GetDataListByName(string attribute ,string value)
        {
           return cityGateway.GetDataListByName(attribute, value);
        }
        public List<City> GetDataListByID(string attribute, string value)
        {
            return cityGateway.GetDataListByID(attribute, value);
        }


        public List<City> GetCountryCity()
        {
           return cityGateway.GetCountryCity();
        }

        public List<City> GetAllCities()
        {
            return cityGateway.GetAllCities();
        }
    }
}