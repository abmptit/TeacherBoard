using Microsoft.AspNetCore.Mvc;
using TeacherBoard.Models;

namespace TeacherBoard.Controllers
{
    public class BoardsController : Controller
    {
        public IActionResult Index(int id)
        {
            var board = new BoardModel() { Id = id };
            return View(board);
        }
    }
}
