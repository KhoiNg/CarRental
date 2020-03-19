using System;
using System.Collections.Generic;
using System.Linq;

namespace CarRental.DataModel
{
    public class BookingRepository
    {
        private readonly CarRentalContext _context = new CarRentalContext();

        public List<Booking> GetBookings()
        {
            return _context.Bookings.ToList();
        }

        public List<Booking> GetBookingsByUser(string userId)
        {
            return _context.Bookings.Where(booking => booking.UserId == userId).ToList();
        }

        public List<Booking> GetBookingsByCar(int carId)
        {
            return _context.Bookings.Where(booking => booking.CarId == carId).ToList();
        }

        public void AddBooking(Booking booking)
        {
            var car = _context.Cars.FirstOrDefault(c => c.CarId == booking.CarId);
            _context.Bookings.Add(booking);
            car.Bookings.Add(booking);
            _context.SaveChanges();
        }

        public void CancelBooking(int bookingId)
        {
            var booking = _context.Bookings.Include("car").FirstOrDefault(b => b.BookingId == bookingId);
            if (booking != null)
            {
                booking.Status = nameof(BookingStatus.Canceled);
                _context.SaveChanges();
            }
        }

        public void UpdatingBooking(int bookingId, DateTime startDate, DateTime endDate, string status, double cost)
        {
            var booking = _context.Bookings.Include("car").FirstOrDefault(b => b.BookingId == bookingId);
            if (booking != null)
            {
                booking.StartDate = startDate;
                booking.EndDate = endDate;
                booking.Status = status;
                booking.Cost = cost;
                _context.SaveChanges();
            }
        }
    }
}