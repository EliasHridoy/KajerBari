using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using KazerBariWeb.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace KazerBariWeb.Controllers
{
    public class OrderController : Controller
    {
        private readonly KazerBariDBContext _context;
        public OrderController(KazerBariDBContext context)
        {
            _context = context;

        }


        [HttpPost]
        public async Task<IActionResult> CreateOrder(OrderCreationDto orderCreationDto)
        {
            if (orderCreationDto != null)
            {
                var order = new Order();
                order.Name = orderCreationDto.Name;
                order.Address = orderCreationDto.Address;
                order.Area = orderCreationDto.Area;
                order.Date = orderCreationDto.Date;
                order.MobileNo = orderCreationDto.MobileNo;
                order.Subtotal = orderCreationDto.Subtotal;
                order.Comment = orderCreationDto.Comment;
                await _context.Orders.AddAsync(order);
                await _context.SaveChangesAsync();
                // return order;

                var cartPackages = orderCreationDto.Packages;
                foreach (var package in cartPackages)
                {
                    var orderDetail = new OrderedService();
                    orderDetail.OderId = order.Id;
                    orderDetail.PackageId = package.PakageId;
                    orderDetail.Quantity = package.Quantity;
                    _context.OrderedServices.Add(orderDetail);

                }

                await _context.SaveChangesAsync();
                return View(order);

            }
            else
            {
                return BadRequest();

            }

        }
        [HttpGet]
        // Get Service By CategoryId 
        public ActionResult GetServices(int categoryId)
        {
            var cat = _context.Categories.Find(categoryId);
            var whatIncluded = cat.WhatIncluded.Split('#');
            var whatExcluded = cat.WhatExcluded.Split('#');
            ViewBag.Category = cat;
            ViewBag.whatIncluded = whatIncluded;
            ViewBag.whatExcluded = whatExcluded;
            var services = _context.Services.Where(s => s.CategoryId == categoryId);
            return View(services.ToList());
        }


        // Get All Services 
        public ActionResult GetServices()
        {
            var services = _context.Services;
            return View(services.ToList());
        }

        //Get Package By ServiceId
        // [HttpGet("GetPackages/{serviceId}")]
        public JsonResult GetPackages(int serviceId)
        {
            var service = _context.Services.Find(serviceId);

            var packages = _context.Packages.Where(p => p.ServiceId == serviceId).ToList();
            var returnPackages = new List<PackageReturnDTO>();
            foreach (var package in packages)
            {
                var returnPackage = new PackageReturnDTO();
                returnPackage.Id = package.Id;
                returnPackage.Name = package.Name;
                returnPackage.Price = package.Price;
                returnPackage.ServiceName = service.Name;
                returnPackages.Add(returnPackage);
            }
            return Json(returnPackages);
        }

        [HttpPost]
        public IActionResult checkout( [FromBody] List<CheckoutVM> orderCreationDto)
        {          
            HttpContext.Session.SetString("pack", JsonConvert.SerializeObject(orderCreationDto));
                       
            return Ok();

        }

        [HttpGet]
        public IActionResult OrderConfirm()
        {
            ViewBag.modal = 0;
            var value = HttpContext.Session.GetString("pack");
            var packages = JsonConvert.DeserializeObject<List<CheckoutVM>>(value);

            int total = 0;
            string servName="";

            foreach(var pc in packages)
            {
                servName = pc.ServiceName;
                total = total + (pc.PackagePrice*pc.Packagequantity);
            }

            ViewData["packages"] = packages;
            ViewBag.ServiceName = servName;
            ViewBag.total = total;
            return View();
        }


        [HttpPost]
        public IActionResult OrderConfirm(Order obj)
        {
            ViewBag.modal = 1;

            var value = HttpContext.Session.GetString("pack");
            var packages = JsonConvert.DeserializeObject<List<CheckoutVM>>(value);

            int total = 0;
            string servName="";

            foreach(var pc in packages)
            {
                servName = pc.ServiceName;
                total = total + (pc.PackagePrice*pc.Packagequantity);
            }
            
            ViewData["packages"] = packages;
            ViewBag.ServiceName = "Service Name";
            ViewBag.total = total;

            if(ModelState.IsValid==false)
            {
            ViewBag.modal = 0;

                return View(obj);
            }

            foreach(var pc in packages)
            {
                OrderedService newServ = new OrderedService();

                var a = _context.Packages.Find(pc.PackageId);
                if(a==null)
                {
                    continue;
                }
                newServ.PackageId = a.Id;
                newServ.Quantity = pc.Packagequantity;
                obj.OrderedServices.Add(newServ);
            }
            obj.Subtotal = total;

            _context.Orders.Add(obj);
            try
            {
                _context.SaveChanges();
            }
            catch(DbUpdateException)
            {
                return RedirectToAction("Error", "Home");
            }

            return View(obj);
        }

    }
}