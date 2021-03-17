using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Humanizer;
using KazerBariWeb.Models;
using KazerBariWeb.NewFolder;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
namespace KazerBariWeb.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly KazerBariDBContext _context;
        private readonly ITokenManager _tokenManager;

        public AdminController(KazerBariDBContext context,
                               IWebHostEnvironment hostingEnvironment,
                               ITokenManager tokenManager)
        {
            _hostingEnvironment = hostingEnvironment;
            _context = context;
            _tokenManager = tokenManager;
        }

        [AllowAnonymous]
        public IActionResult Login()
        {
            ViewBag.message = "";
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login(Adminnara admin)
        {
            ViewBag.message = "";
            if(ModelState.IsValid)
            {

                var rs = _context.Adminnaras.FirstOrDefault(a => a.Email == admin.Email && a.Password == admin.Password);
                if (rs == null)
                {
                    ViewBag.message = "Email or password not found!!!";

                    return View();

                }
                var token = _tokenManager.GenerateAccessToken(rs.Id, rs.Email, "Admin");
                if (token != null)
                {
                    //Save token in session object
                    HttpContext.Session.SetString("JWToken", token);
                }

                return RedirectToAction("Dashboard");
            }

            return View(admin);

            
        }

        public IActionResult Logoff()
        {
            HttpContext.Session.Clear();

            return RedirectToAction("Index", "Home");
        }

        public IActionResult Dashboard()
        {
            return View();
        }

        
        public IActionResult OrderSummary()
        {

            var order = _context.Orders 
                                .OrderByDescending(a=>a.Date)
                                .ToList();
            ViewData["order"] = order;
            return View();
        }

        public JsonResult GetOrderDetails(int orderId) 
        {
            var order = _context.Orders
                                .Include(o => o.OrderedServices)
                                    .ThenInclude(a=>a.Package)
                                .FirstOrDefault(o => o.Id == orderId);
            JsonResult a = Json(order);                                
            return a;
        }



        public IActionResult AddCategory()
        {
            ViewData["cat"] = _context.Categories.ToList();
            ViewBag.message = "";

            return View();
        }

        [HttpPost]
        public IActionResult AddCategory(CategoryViewModel c)
        {
            if (ModelState.IsValid == false)
            {
                ViewData["cat"] = _context.Categories.ToList();
                ViewBag.message = "Category Added faild";
                return View(c);
            }
            var cv = new Category();

            cv.Name = c.Name;
            cv.WhatIncluded = c.WhatIncluded;
            cv.WhatExcluded = c.WhatExcluded;
            string path = "";
            string fileName = "";

            if (c.Image != null)
            {
                this.Save(c.Image, "Catagory", out path, out fileName);
                if (path != null)
                {
                    cv.Banner = fileName;
                }
            }

            if (c.IconPNG != null)
            {

                path = "";
                this.Save(c.IconPNG, "Catagory", out path, out fileName);
                if (path != null)
                {
                    cv.Icon = fileName;
                }

            }
            _context.Categories.Add(cv);
            _context.SaveChanges();



            return RedirectToAction("AddCategory");
        }

        public IActionResult CategoryDelete(int categoryId)
        {
            var cat = _context.Categories.FirstOrDefault(a => a.Id == categoryId);
            if (cat == null)
            {
                return RedirectToAction("Error", "Home");
            }

            _context.Remove(cat);
            _context.SaveChanges();

            return RedirectToAction("AddCategory", "Admin");


        }



        public IActionResult AddService()
        {
            var serv = _context.Services
                                        .Include(a => a.Category)
                                        .ToList();
            ViewData["ser"] = serv;
            ViewData["cat"] = new SelectList(_context.Categories, "Id", "Name");
            ViewBag.message = "";


            return View();
        }

        [HttpPost]
        public IActionResult AddService(ServiceViewModel c)
        {
            var cv = new Service();

            if (ModelState.IsValid == false)
            {
                var serv = _context.Services
                                            .Include(a => a.Category)
                                            .ToList();
                ViewData["ser"] = serv;
                ViewData["cat"] = new SelectList(_context.Categories, "Id", "Name");
                ViewBag.message = "Service added faild";
                return View(c);
            }

            cv.Name = c.Name;
            cv.CategoryId = c.CategoryId;
            string path = "";
            string fileName = "";
            this.Save(c.ImageFile, "Services", out path, out fileName);
            if (path != null)
            {
                cv.Image = fileName;
            }
            _context.Services.Add(cv);
            _context.SaveChanges();



            return RedirectToAction("AddService");
        }
        public IActionResult ServiceDelete(int serviceId)
        {
            var cat = _context.Services.FirstOrDefault(a => a.Id == serviceId);
            if (cat == null)
            {
                return RedirectToAction("Error", "Home");
            }
            _context.Remove(cat);
            _context.SaveChanges();

            return RedirectToAction("AddService", "Admin");


        }


        public IActionResult AddPackage()
        {
            var pack = _context.Packages.Include(a=>a.Service).ToList();
            ViewData["pack"] = pack;
            ViewData["serv"] = new SelectList(_context.Services, "Id", "Name");

            ViewBag.message = "";

            return View();
        }

        [HttpPost]
        public IActionResult AddPackage(Package c)
        {
            if (ModelState.IsValid && c.ServiceId>0)
            {
                _context.Packages.Add(c);
                _context.SaveChanges();
            }
            else
            {
                ViewBag.message = "Package added faild";
                var pack = _context.Packages.Include(a=>a.Service).ToList();
                ViewData["pack"] = pack;
                ViewData["serv"] = new SelectList(_context.Services, "Id", "Name");

                return View(c);
            }
            return RedirectToAction("AddPackage");
        }

        public IActionResult PackageDelete(int packId)
        {
            var cat = _context.Packages.FirstOrDefault(a => a.Id == packId);
            if (cat == null)
            {
                return RedirectToAction("Error", "Home");
            }
            _context.Remove(cat);
            _context.SaveChanges();

            return RedirectToAction("AddPackage", "Admin");


        }


        public IActionResult AddCarouselBanner()
        {
            int CarouselBannerId = 1;


            var CBan = _context.Pictures.Where(a => a.BannerId == CarouselBannerId).ToList();
            ViewData["CBan"] = CBan;


            return View();
        }

        [HttpPost]
        public IActionResult AddCarouselBanner(BannerSave c)
        {
            if(ModelState.IsValid==false)
            {
                return RedirectToAction("AddCarouselBanner");
            }
            int CarouselBannerId = 1;

            var CBan = _context.Pictures.Where(a => a.BannerId == CarouselBannerId).ToList();
            ViewData["CBan"] = CBan;



            var cv = new Picture();
            cv.BannerId = CarouselBannerId;

            string path = "";
            string fileName = "";

            if (c.Banner != null)
            {
                this.Save(c.Banner, "AllBanner", out path, out fileName);
                if (path != null)
                {
                    cv.ImageName = fileName;
                }
            }


            _context.Pictures.Add(cv);
            _context.SaveChanges();



            return RedirectToAction("AddCarouselBanner");
        }

        public IActionResult CarouselBannerDelete(int banId)
        {
            var cat = _context.Pictures.FirstOrDefault(a => a.Id == banId);
            if (cat == null)
            {
                return RedirectToAction("Error", "Home");
            }
            _context.Remove(cat);
            _context.SaveChanges();

            return RedirectToAction("AddCarouselBanner", "Admin");


        }



        public IActionResult AddPostBanner()
        {
            int PostBannerId = 2;


            var CBan = _context.Pictures.Where(a => a.BannerId == PostBannerId).ToList();
            ViewData["CBan"] = CBan;


            return View();
        }

        [HttpPost]
        public IActionResult AddPostBanner(BannerSave c)
        {
            if(ModelState.IsValid==false)
            {
                return RedirectToAction("AddPostBanner");
            }
            int PostBannerId = 2;
            var cv = new Picture();
            cv.BannerId = PostBannerId;

            string path = "";
            string fileName = "";

            if (c.Banner != null)
            {
                this.Save(c.Banner, "AllBanner", out path, out fileName);
                if (path != null)
                {
                    cv.ImageName = fileName;
                }
            }


            _context.Pictures.Add(cv);
            _context.SaveChanges();



            return RedirectToAction("AddPostBanner");
        }

        public IActionResult PostannerDelete(int banId)
        {
            var cat = _context.Pictures.FirstOrDefault(a => a.Id == banId);
            if (cat == null)
            {
                return RedirectToAction("Error", "Home");
            }
            _context.Remove(cat);
            _context.SaveChanges();

            return RedirectToAction("AddPostBanner", "Admin");


        }






        private void Save(IFormFile Image, string folderName, out string path, out string fileName)
        {
            fileName = "";
            path = "";

            if (Image.Length > 0)
            {
                string uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, folderName);

                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }

                string uniqueFileName = Guid.NewGuid().ToString() + "_" + Image.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                Image.CopyTo(new FileStream(filePath, FileMode.Create));

                fileName = uniqueFileName;
                path = folderName + "\\" + uniqueFileName;

            }

        }


    }
}