using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using KazerBariWeb.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;

namespace KazerBariWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly KazerBariDBContext _context;

        public HomeController(ILogger<HomeController> logger,
                                KazerBariDBContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            ViewData["Category"] = _context.Categories.ToList();
            ViewBag.services = _context.Categories.Include(s => s.Services).ToList();
            ViewBag.CaresolBanner = _context.Pictures.Where(pic => pic.BannerId == 1).ToList();
            ViewBag.PopupImage = _context.Pictures.FirstOrDefault( p => p.BannerId == 2);


            return View();
        }

        public IActionResult Privacy()
        {
            var s = HttpContext.Session.GetString("test");

            return View();
        }

        [HttpPost]
        public IActionResult ListTest(test obj)
        {

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
