using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BooksStore.Models;

namespace BooksStore.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        BookDataSource bookData = new BookDataSource();

        public ActionResult Index()
        {
            return RedirectToAction("Create");
        }

        public ActionResult ViewBooks()
        {
            var model = bookData.GetBooks();
            return View(model);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(BookEntity newBook)
        {
            newBook.PartitionKey = Guid.NewGuid().ToString();
            newBook.RowKey = newBook.BookID.ToString();
            bookData.AddBook(newBook);
            ViewBag.Msg = "Save Compeleted";
            return View();
        }

        public ActionResult Delete(int rowKey, string partitionKey)
        {
            bookData.DeleteBook(rowKey, partitionKey);
            return RedirectToAction("ViewBooks");
        }

        public ActionResult Search(string search)
        {
            var model = bookData.Search(search);
            return View(model);
        }

        public ActionResult Update(string bkId, string upBkTitle, string upBkPrice)
        {
            return RedirectToAction("ViewBooks");
        }
    }
}