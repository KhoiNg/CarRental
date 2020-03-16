using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CarRental.DataModel
{
    public class Car
    {
        public Car()
        {
            Bookings = new List<Booking>();
        }

        [Key]
        public int CarId { get; set; }

        public string Make { get; set; }

        public string Model { get; set; }

        public int Year { get; set; }
        
        public string Color { get; set; }

        public string VIN { get; set; }

        public int Mileage { get; set; }

        public string Type { get; set; }

        public double Price { get; set; }

        public bool IsAvailable { get; set; }

        public List<Booking> Bookings { get; set; }
    }

    public class Booking
    {
        [Key]
        public int BookingId { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string Status { get; set; }

        public Double Cost { get; set; }

        public int CarId { get; set; }
        [Required]
        public Car Car { get; set; }

        [Required]
        public string UserId { get; set; }
    }
}