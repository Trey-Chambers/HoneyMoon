using HoneyMoon.Models;
using System.Collections.Generic;

namespace HoneyMoon.Repositories
{
    public interface ILocationRepository
    {
        List<Location> GetAllLocations();
        Location GetLocationById(int id);
    }
}