using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp
{
    interface ICity
    {
        bool Insert(City city);
        List<City> SearchByCity(string cityName);
        List<City> SearchByCountry(int CountryID);
        List<City> GetAllCity();
    }
}
