using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp
{
    interface ICountry
    {
        bool InsertCountry(Country country);
        List<Country> SearchByCountryName(Country country);
        List<Country> GetAllCountry();
    }
}
