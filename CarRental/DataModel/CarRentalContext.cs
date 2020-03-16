using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CarRental.DataModel
{
    public class CarRentalContext:DbContext
    {
        public CarRentalContext(): base("DefaultConnection")
        {
        }

        public DbSet<Car> Cars { get; set; }
        public DbSet<Booking> Bookings { get; set; }
    }
}