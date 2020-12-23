using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Travel_Hub.Models;

namespace Travel_Hub.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SignUp()
        {
            return View();
        }

        public ActionResult HomePage()
        {

            return View();
        }

        public ActionResult Admin()
        {
            return View();
        }

        public ActionResult Ratings()
        {
            return View(Rate.getRatings());
        }

        public ActionResult Feedback()
        {
            return View();
        }

        public ActionResult Profile()
        {
            return View(PrevAreas.getPreviousAreas());
        }

        public ActionResult ViewAreas()
        {

            return View(ViewAllAreas.getAreaDetails());
        }
        public ActionResult ViewTours()
        {
            return View(ViewPlannedTours.getTourDetails());

        }
        public ActionResult CalculateBill()
        {
            return View();
        }
        public ActionResult YourBill()
        {
            return View(Bill.getBill());
        }

        public ActionResult CreateTour()
        {
            return View();
        }

        public ActionResult MoreOptions()
        {
            return View();
        }

        public ActionResult CurrencyConversion()
        {

            return View();
        }

        public ActionResult AddArea()
        {
            return View(Tour.getAreasWithSameLocation());
        }

        public ActionResult AuthenticateLogin(String username, String password)
        {
            int result = Authentication.Login(username, password);

            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("SignUp", (object)data);
            }
            else if (result == 2)
            {
                String data = "Incorrect Credentials";
                return View("Index", (object)data);
            }
            else if (result == 1)
            {
                String data = "No user present in the database";
                return View("Index", (object)data);
            }
            return RedirectToAction("Homepage");
        }
        public ActionResult AuthenticateSignUp(String name, String contact, String email, string cnic, String pwd, DateTime date, int age)
        {
            int result = Authentication.SignUp(name, contact, email, cnic, pwd, date, age);

            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("Index", (object)data);
            }
            else if (result == 2)
            {
                String data = "Incorrect Credentials";
                return View("Index", (object)data);
            }
            else if (result == 0)
            {
                String data = "Username already exists";
                return View("Homepage", (object)data);
            }
            return RedirectToAction("SignUp");
        }

        public ActionResult AuthenticateAdminLogin(String username, String password)
        {
            int result = Authentication.AdminLogin(username, password);

            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("SignUp", (object)data);
            }
            else if (result == 2)
            {
                String data = "Incorrect Credentials";
                return View("SignUp", (object)data);
            }
            else if (result == 1)
            {
                String data = "No user present in the database";
                return View("Index", (object)data);
            }
            return RedirectToAction("Homepage");
        }

        public ActionResult Rating(string areaName, int rate, string comments)
        {
            int result = Rate.AddRating(areaName, rate, comments);
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("HomePage", (object)data);
            }
            return RedirectToAction("Ratings");

        }
        public ActionResult signOut()
        {
           int result =  Authentication.SignOut();
           if (result == -2)
           {
               String data = "Something went wrong while connecting with the database.";
               return View("HomePage", (object)data);
           }
           return RedirectToAction("Index");

        }
        public ActionResult AddNewFeedback(string feedback)
        {
            int result = FeedbackClass.AddFeedback(feedback);
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("HomePage", (object)data);
            }
            return RedirectToAction("Feedback");

        }

        public ActionResult BillCalculation(int tour, int noOfPeople)
        {

            int result = Bill.FindBill(tour, noOfPeople);
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("HomePage", (object)data);
            }

            return RedirectToAction("YourBill");
        }
        public ActionResult CreateNewTour(DateTime tour, string vehicle, string area)
        {
            int result = Tour.CreateANewTour(tour, vehicle, area);
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("HomePage", (object)data);
            }
            else if (result == -1)
            {
                String data = "Area name not found";
                return View("CreateTour", (object)data);

            }
            return RedirectToAction("MoreOptions");
        }

        public ActionResult CheckNewTour()
        {
            int result = Tour.checkTour();
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("MoreOptions", (object)data);
            }
            return RedirectToAction("HomePage");

        }

        public ActionResult reserveTour(int noOfPeople)
        {
            int result = Tour.reserveNewTour(noOfPeople);
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("MoreOptions", (object)data);
            }
            return RedirectToAction("YourBill");

        }

        public ActionResult AddAreaToTour(string areaname)
        {
            int result = Tour.AddAnArea(areaname);
            if (result == -2)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("MoreOptions", (object)data);
            }

            return RedirectToAction("AddArea");
        }

    }
}
