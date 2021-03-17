using System;
using System.Collections.Generic;
using KazerBariWeb.Models;
using Microsoft.AspNetCore.Mvc;

namespace KazerBariWeb.Controllers
{
    public class OrderController1 : Controller
    {
        private readonly KazerBariDBContext _context;

        public OrderController1(KazerBariDBContext context)
        {
            _context = context;
        }

        public IActionResult Order()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Order([FromBody] List<test> obj)
        {
            ViewData["package"] = obj;


            return View();
        }

    }
}