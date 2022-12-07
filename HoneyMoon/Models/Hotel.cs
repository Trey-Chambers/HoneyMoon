using Microsoft.AspNetCore.Components.Routing;
using System.ComponentModel.DataAnnotations;

namespace HoneyMoon.Models
{
    public class Hotel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string HotelURL { get; set; }
        [Required]
        public string HotelImage { get; set; }
        [Required]
        public int LocationId{ get; set; }

        public Location Location { get; set; }
        


    }
}
