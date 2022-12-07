﻿using System.ComponentModel.DataAnnotations;

namespace HoneyMoon.Models
{
    public class Location
    {
        public int Id { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string Country { get; set; }
    }
}
