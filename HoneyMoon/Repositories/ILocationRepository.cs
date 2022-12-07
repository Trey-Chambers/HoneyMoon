using HoneyMoon.Models;
using System.Collections.Generic;

namespace HoneyMoon.Repositories
{
    public interface ILocationRepository
    {
        void AddLocation(Location location);
        void DeleteLocation(int locationId);
        void EditLocation(Location location);
        List<Location> GetAllLocations();
        Location GetLocationById(int id);
    }
}