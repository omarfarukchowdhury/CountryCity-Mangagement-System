using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp.DAL
{
    
    public class CountryGateway
    {
        public static SqlConnection Connection()
        {
            return new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        }
        public bool Insert(Country country)
        {
            try
            {
                var con = Connection();
                con.Open();
                var sql = string.Format("INSERT INTO CountryTable VALUES ('{0}','{1}')",country.CountryName,country.CountryAbout);
                var cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                con.Close();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public List<Country> GetAllCountryList()
        {
            SqlConnection con = Connection();
            con.Open();
            string sql = "SELECT * FROM CountryTable ORDER BY CountryName";
            SqlCommand cmd=new SqlCommand(sql,con);
            SqlDataReader reader= cmd.ExecuteReader();
            List<Country> countryList=new List<Country>();
            int a = 0;
            while (reader.Read())
            {
                
                a++;
                Country country=new Country();
                country.CountryID = int.Parse(reader["CountryID"].ToString());
                country.CountryName = reader["CountryName"].ToString();
                country.CountryAbout = reader["CountryAbout"].ToString();
                country.SerialNo = a;
                countryList.Add(country);
            }
            reader.Close();
            con.Close();
            return countryList;

        }

        public List<Country> GetSearchCountryInfo(string countryName)
        {
            var a = 0;
            var con = Connection();
            con.Open();
            string sql = string.Format("Select CountryAbout, CountryName , COUNT(CityName) AS [NoOfCountry], SUM(No_Of_Dwellers) AS [NoOfDwellers] FROM GetCountryCity WHERE CountryName LIKE '%{0}%' GROUP BY CountryName,CountryAbout", countryName);
            var cmd = new SqlCommand(sql, con);
            var reader = cmd.ExecuteReader();
            var countryList = new List<Country>();
            while (reader.Read())
            {

                a++;
                countryList.Add(new Country()
                {
                    CountryName = reader["CountryName"].ToString(),
                    CountryAbout = reader["CountryAbout"].ToString(),
                    SerialNo = a,
                    NoOfCity = int.Parse(reader["NoOfCountry"].ToString()),
                    NoOfCityDwellers = double.Parse(reader["NoOfDwellers"].ToString()),
                });
            }
            reader.Close();
            con.Close();
            return countryList;
             
        }

        public List<Country> GetAll()
        {
            var a = 0;
            var con = Connection();
            con.Open();
            var sql = string.Format("Select CountryAbout, CountryName , COUNT(CityName) AS [NoOfCountry], SUM(No_Of_Dwellers) AS [NoOfDwellers] FROM GetCountryCity GROUP BY CountryName,CountryAbout ORDER BY CountryName");
            var cmd = new SqlCommand(sql, con);
            var reader = cmd.ExecuteReader();
            var countryList = new List<Country>();
            while (reader.Read())
            {

                a++;
                var country = new Country();
                country.CountryName = reader["CountryName"].ToString();
                country.CountryAbout = reader["CountryAbout"].ToString();
                country.SerialNo = a;
                country.NoOfCity = int.Parse(reader["NoOfCountry"].ToString());
                country.NoOfCityDwellers = double.Parse(reader["NoOfDwellers"].ToString());
                countryList.Add(country);
            }
            reader.Close();
            con.Close();
            return countryList;
            
        }

        public static Country IsCountryExist(string countryName)
        {
            
            var con = Connection();
            con.Open();
            var sql = string.Format("SELECT CountryName, CountryAbout FROM CountryTable WHERE CountryName='{0}'", countryName);
            var cmd = new SqlCommand(sql, con);
            var reader = cmd.ExecuteReader();
            var country = new Country();
            while (reader.Read())
            {

                country.CountryName = reader["CountryName"].ToString();
                country.CountryAbout = reader["CountryAbout"].ToString();


            }
            return country;
        }
    }
}