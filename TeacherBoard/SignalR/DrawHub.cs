using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

namespace TeacherBoard.SignalR
{
    public class DrawHub : Hub
    {
        public Task Draw(int boardId, int prevX, int prevY, int currentX, int currentY, string color)
        {
            return Clients.Others.SendAsync("draw", boardId, prevX, prevY, currentX, currentY, color);
        }
        public Task UploadPdf(int prevX, byte[] pdfContent)
        {
            return Clients.Others.SendAsync("uploadPdf", pdfContent);
        }
    }
}
