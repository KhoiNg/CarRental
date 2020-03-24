using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;

namespace CarRental.DataModel
{
    public class CarRentalContext : DbContext
    {
        public CarRentalContext() : base("DefaultConnection")
        {
        }

        public DbSet<Car> Cars { get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<PersonalUserInfo> PersonalUserInfos { get; set; }
    }
}