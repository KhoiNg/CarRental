using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarRental.DataModel
{
    public class BookingRepository
    {
        readonly CarRentalContext _context = new CarRentalContext();

        public List<Booking> GetBookings()
        {
            return _context.Bookings.ToList();
        }

        public List<Booking> GetBookingsByUser(string userId)
        {
            return _context.Bookings.Where(booking => booking.UserId== userId).ToList();
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
            var booking = _context.Bookings.FirstOrDefault(b => b.BookingId == bookingId);
            booking.Status = nameof(BookingStatus.Canceled);
            _context.SaveChanges();
        }
    }
}