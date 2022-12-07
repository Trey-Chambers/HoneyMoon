using HoneyMoon.Repositories;
using Microsoft.AspNetCore.Mvc;
using HoneyMoon.Models;

namespace HoneyMoon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController: ControllerBase
    {
        private readonly ILocationRepository _locationRepository;
        public LocationController(ILocationRepository locationRepository)
        {
            _locationRepository = locationRepository;
        }
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_locationRepository.GetAllLocations());
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var location = _locationRepository.GetLocationById(id);
            if (location == null)
            {
                return NotFound();
            }
            return Ok(location);
        }

    }
}
