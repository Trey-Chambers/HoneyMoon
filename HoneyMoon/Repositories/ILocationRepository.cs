using HoneyMoon.Models;
using System.Collections.Generic;

namespace HoneyMoon.Repositories
{
    public interface ILocationRepository
    {
        void AddLocation(Location location);
        List<Location> GetAllLocations();
        Location GetLocationById(int id);
    }
}