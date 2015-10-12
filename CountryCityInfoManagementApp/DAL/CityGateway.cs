using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CountryCityInfoManagementApp.Models;

namespace CountryCityInfoManagementApp.DAL
{
    public class CityGateway
    {
        
        public bool Insert(City city)
        {
            try
            {
                SqlConnection con= CountryGateway.Connection();
                con.Open();
                string sql =string.Format("INSERT INTO CityTable VALUES ('{0}','{1}',{2},'{3}','{4}','{5}')",city.CityName,city.CityAbout,city.NoOfDwellers,city.Location,city.Weather,city.MyCountry.CountryID);
                SqlCommand cmd=new SqlCommand(sql,con);
                int rowAffected=cmd.ExecuteNonQuery();
                con.Close();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
            
        }

        public List<City> GetDataListByName(string attribute, string value)
        {
            var a = 0;
            var con = CountryGateway.Connection();
            con.Open();
            string sql = string.Format("SELECT * FROM GetCountryCity WHERE {0} LIKE '{1}%'", attribute, value);
            var cmd =new SqlCommand(sql,con);
            var reader = cmd.ExecuteReader();
            var cityList=new List<City>();
            while (reader.Read())
            {
                a++;
                var city=new City();
                city.CityID = int.Parse(reader["CityID"].ToString());
                city.CityName = reader["CityName"].ToString();
                city.CityAbout = reader["CityAbout"].ToString();
                city.NoOfDwellers = double.Parse(reader["No_Of_Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.MyCountry.CountryName = reader["CountryName"].ToString();
                city.MyCountry.CountryID = int.Parse(reader["CountryID"].ToString());
                city.MyCountry.CountryAbout = reader["CountryAbout"].ToString();
                city.SerialNo = a;
                cityList.Add(city);
                
            }
            return cityList;
        }
        public List<City> GetDataListByID(string attribute, string value)
        {
            int a = 0;
            SqlConnection con = CountryGateway.Connection();
            con.Open();
            string sql = string.Format("SELECT * FROM GetCountryCity  WHERE {0} ={1}", attribute, value);
            SqlCommand cmd = new SqlCommand(sql, con);
            var reader = cmd.ExecuteReader();
            List<City> cityList = new List<City>();
            while (reader.Read())
            {
                a++;
                City city = new City();
                city.CityID = int.Parse(reader["CityID"].ToString());
                city.CityName = reader["CityName"].ToString();
                city.CityAbout = reader["CityAbout"].ToString();
                city.NoOfDwellers = double.Parse(reader["No_Of_Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.MyCountry.CountryName = reader["CountryName"].ToString();
                city.MyCountry.CountryID = int.Parse(reader["CountryID"].ToString());
                city.MyCountry.CountryAbout = reader["CountryAbout"].ToString();
                city.SerialNo = a;
                cityList.Add(city);

            }
            return cityList;
        }

        public List<City> GetCountryCity()
        {
            SqlConnection con = CountryGateway.Connection();
            con.Open();
            string sql = string.Format("SELECT * FROM GetCountryCity ORDER BY CityName");
            SqlCommand cmd=new SqlCommand(sql,con);
            SqlDataReader reader = cmd.ExecuteReader();
            List<City> cityList = new List<City>();
            int a = 0;
            while (reader.Read())
            {
                
                a++;
                City city = new City();
                city.CityID = int.Parse(reader["CityID"].ToString());
                city.CityName = reader["CityName"].ToString();
                city.CityAbout = reader["CityAbout"].ToString();
                city.NoOfDwellers = double.Parse(reader["No_Of_Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.MyCountry.CountryName = reader["CountryName"].ToString();
                city.MyCountry.CountryID = int.Parse(reader["CountryID"].ToString());
                city.MyCountry.CountryAbout = reader["CountryAbout"].ToString();
                city.SerialNo = a;
                cityList.Add(city); 
            }
            reader.Close();
            con.Close();
            return cityList;

        }

        public List<City> GetAllCities()
        {
            int a = 0;
            SqlConnection con = CountryGateway.Connection();
            con.Open();
            string sql = "SELECT * FROM GetCountryCity ORDER BY CityName";
            SqlCommand cmd = new SqlCommand(sql, con);
            var reader = cmd.ExecuteReader();
            List<City> cityList = new List<City>();
            while (reader.Read())
            {
                a++;
                City city = new City();
                city.CityID = int.Parse(reader["CityID"].ToString());
                city.CityName = reader["CityName"].ToString();
                city.CityAbout = reader["CityAbout"].ToString();
                city.NoOfDwellers = double.Parse(reader["No_Of_Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.MyCountry.CountryName = reader["CountryName"].ToString();
                city.MyCountry.CountryID = int.Parse(reader["CountryID"].ToString());
                city.MyCountry.CountryAbout = reader["CountryAbout"].ToString();
                city.SerialNo = a;
                cityList.Add(city);

            }
            return cityList;
            
        }
    }
}