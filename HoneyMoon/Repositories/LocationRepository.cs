
using Azure;
using HoneyMoon.Models;
using HoneyMoon.Utils;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

namespace HoneyMoon.Repositories
{
    public class LocationRepository : BaseRepository, ILocationRepository
    {
        public LocationRepository(IConfiguration configuration) : base(configuration) { }

        public List<Location> GetAllLocations()
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"SELECT l.id, l.city, l.country FROM Location l
                                           ORDER BY l.city ";

                    var reader = cmd.ExecuteReader();
                    var locations = new List<Location>();
                    while (reader.Read())
                    {
                        locations.Add(new Location()
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id")),
                            City = reader.GetString(reader.GetOrdinal("city")),
                            Country = reader.GetString(reader.GetOrdinal("country"))
                        });
                    }

                    reader.Close();

                    return locations;
                }
            }
        }
        public Location GetLocationById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"SELECT id, city, country FROM Location WHERE Id = @id";
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Location location = new Location
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            City = reader.GetString(reader.GetOrdinal("city")),
                            Country = reader.GetString(reader.GetOrdinal("country"))
                        };
                        reader.Close();
                        return location;
                    }
                    else
                    {
                        reader.Close();
                        return null;
                    }
                }
            }
        }
        public void AddLocation(Location location)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                    INSERT INTO Location(city, country)
                                    OUTPUT INSERTED.ID
                                    VALUES (@city, @country)";
                    cmd.Parameters.AddWithValue("@city", location.City);
                    cmd.Parameters.AddWithValue("@country", location.Country);
                    location.Id = (int)cmd.ExecuteScalar();
                }

            }
        }

        public void EditLocation(Location location)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"UPDATE Location SET city = @city, country = @country WHERE Id = @locationId";
                    cmd.Parameters.AddWithValue("@city", location.City);
                    cmd.Parameters.AddWithValue("@country", location.Country);
                    cmd.Parameters.AddWithValue("@locationId", location.Id);

                    cmd.ExecuteNonQuery();
                }
            }
        }
        public void DeleteLocation(int locationId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"DELETE FROM Location WHERE Id = @id";
                    cmd.Parameters.AddWithValue("@id", locationId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}
