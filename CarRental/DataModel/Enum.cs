using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarRental.DataModel
{
    enum RoleType
    {
        None,
        Admin,
        User
    }

    enum CarType
    {
        Car,
        SUV,
        Truck,
        Van,
        Other
    }

    enum BookingStatus
    {
        Booked,
        Canceled 
    }
}