using System;
using System.Collections.Generic;
using System.Linq;

namespace CarRental.DataModel
{
    public class BookingRepository
    {
        private readonly CarRentalContext _context = new CarRentalContext();

        public List<BookingInfo> GetAllBookingInfos()
        {
            var query = from booking in _context.Bookings
                        join personalUserInfo in _context.PersonalUserInfos on booking.UserId equals personalUserInfo.UserId
                        select new BookingInfo
                        {
                            BookingId = booking.BookingId,
                            StartDate = booking.StartDate,
                            EndDate = booking.EndDate,
                            Status = booking.Status,
                            Cost = booking.Cost,
                            CarId = booking.CarId,
                            FullName = personalUserInfo.FullName
                        };
            return query.ToList();
        }

        public List<Booking> GetBookingsByUser(string userId)
        {
            return _context.Bookings.Where(booking => booking.UserId == userId).ToList();
        }

        public List<BookingInfo> GetBookingInfosByCar(int carId)
        {
            var query = from booking in _context.Bookings.Where(booking => booking.CarId == carId)
                        join personalUserInfo in _context.PersonalUserInfos on booking.UserId equals personalUserInfo.UserId
                        select new BookingInfo
                        {
                            BookingId = booking.BookingId,
                            StartDate = booking.StartDate,
                            EndDate = booking.EndDate,
                            Status = booking.Status,
                            Cost = booking.Cost,
                            CarId = booking.CarId,
                            FullName = personalUserInfo.FullName
                        };
            return query.ToList();
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

    public class BookingInfo
    {
        public int BookingId { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string Status { get; set; }

        public Double Cost { get; set; }

        public int CarId { get; set; }

        public string FullName { get; set; }
    }
}