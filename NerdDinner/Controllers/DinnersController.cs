using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using NerdDinner.Models;
using NerdDinner.Helpers;

namespace NerdDinner.Controllers
{
    public class DinnerFormViewModel
    {

        // Properties
        public Dinner Dinner { get; private set; }
        public SelectList Countries { get; private set; }

        // Constructor
        public DinnerFormViewModel(Dinner dinner)
        {

            Dinner = dinner;
            Countries = new SelectList(PhoneValidator.Countries, dinner.Country);
        }
    }

    public class DinnersController : Controller
    {

        DinnerRepository dinnerRepository = new DinnerRepository();

        //
        // GET: /Dinners/

        public ActionResult Index(int? page)
        {
            const int pageSize = 5;

            var upcomingDinners = dinnerRepository.FindUpcomingDinners();
            var paginatedDinners = new PaginatedList<Dinner>(upcomingDinners,
                                                             page ?? 0,
                                                             pageSize);
            return View(paginatedDinners);
        }

        //
        // GET: /Dinners/Details/2

        public ActionResult Details(int id)
        {
            Dinner dinner = dinnerRepository.GetDinner(id);

            if (dinner == null)
            {
                return View("NotFound");
            }
            else
            {
                return View(dinner);
            }
        }

        //
        // GET: /Dinners/Edit/2

        public ActionResult Edit(int id)
        {
            Dinner dinner = dinnerRepository.GetDinner(id);

            if (!dinner.IsHostedBy(User.Identity.Name))
            {
                return View("InvalidOwner", dinner);
            }

            if (dinner == null)
            {
                return View("NotFound");
            }
            else
            {
                return View(new DinnerFormViewModel(dinner));
            }
        }

        //
        // POST: /Dinners/Edit/2

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection formValues)
        {
            Dinner dinner = dinnerRepository.GetDinner(id);

            if (!dinner.IsHostedBy(User.Identity.Name))
            {
                return View("InvalidOwner", dinner);
            }

            try
            {

                UpdateModel(dinner);

                dinnerRepository.Save();

                return RedirectToAction("Details", new { id = dinner.DinnerID });
            }
            catch
            {
                ModelState.AddRuleViolations(dinner.GetRuleViolations());

                return View(new DinnerFormViewModel(dinner));
            }
        }

        //
        // GET: /Dinners/Create

        [Authorize]
        public ActionResult Create()
        {
            Dinner dinner = new Dinner()
            {
                EventDate = DateTime.Now.AddDays(7)
            };
            return View(new DinnerFormViewModel(dinner));
        }

        //
        // POST: /Dinners/Create

        [AcceptVerbs(HttpVerbs.Post), Authorize]
        public ActionResult Create(Dinner dinner)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    dinner.HostedBy = User.Identity.Name;

                    RSVP rsvp = new RSVP();
                    rsvp.AttendeeName = User.Identity.Name;
                    dinner.RSVPs.Add(rsvp);

                    dinnerRepository.Add(dinner);
                    dinnerRepository.Save();

                    return RedirectToAction("Details", new { id = dinner.DinnerID });
                }
                catch
                {
                    ModelState.AddRuleViolations(dinner.GetRuleViolations());
                }
            }

            return View(new DinnerFormViewModel(dinner));
        }

        //
        // GET: /Dinners/Delete/2

        public ActionResult Delete(int id)
        {
            Dinner dinner = dinnerRepository.GetDinner(id);

            if (dinner == null)
            {
                return View("NotFound");
            }

            return View(dinner);
        }

        //
        // POST: /Dinners/Delete/2

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Delete(int id, string dummy)
        {
            Dinner dinner = dinnerRepository.GetDinner(id);

            if (dinner == null)
            {
                return View("NotFound");
            }

            dinnerRepository.Delete(dinner);
            dinnerRepository.Save();

            return View("Deleted");

        }

    }
}