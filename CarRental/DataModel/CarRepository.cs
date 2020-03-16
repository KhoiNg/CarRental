using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace CarRental.DataModel
{
    public class CarRepository
    {
        CarRentalContext _context = new CarRentalContext();

        public List<Car> GetCars()
        {
            return _context.Cars.ToList();
        }

        public List<Car> GetAvailableCars()
        {
            return _context.Cars.Where(car => car.IsAvailable).Include(car => car.Bookings).ToList();
        }


        public void AddCar(Car car)
        {
            _context.Cars.Add(car);
            _context.SaveChanges();
        }

        public void UpdateCar(Car car)
        {
            var carToUpdate = _context.Cars.FirstOrDefault(c => c.CarId == car.CarId);
            if (carToUpdate != null)
            {
                _context.Entry(carToUpdate).CurrentValues.SetValues(car);
                _context.SaveChanges();
            }
        }

        public void RemoveCar(Car car)
        {
            var carToRemove = _context.Cars.FirstOrDefault(c => c.CarId == car.CarId);
            if (carToRemove != null)
            {
                _context.Cars.Remove(carToRemove);
                _context.SaveChanges();
            }
        }

        public void RemoveCar(int carId)
        {
            var carToRemove = _context.Cars.FirstOrDefault(c => c.CarId == carId);
            if (carToRemove != null)
            {
                _context.Cars.Remove(carToRemove);
                _context.SaveChanges();
            }
        }
    }
}