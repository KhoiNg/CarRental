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

        public List<GetAllCars_Result> GetCarsTest()
        {
            using (var context = new CarRentalEntities())
            {
                return context.GetAllCars().ToList();
            }
        }

        public List<Car> GetAvailableCars()
        {
            return _context.Cars.Where(car => car.IsAvailable).Include(car => car.Bookings).ToList();
        }

        public bool IsCarDeletable(int carId)
        {
            var car = _context.Cars.Include(c => c.Bookings).FirstOrDefault(c => c.CarId == carId);
            if (car == null || car.Bookings.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
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