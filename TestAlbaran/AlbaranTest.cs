using GrupoC.AlbaranDeEntrega.Controllers;
using GrupoC.AlbaranDeEntrega.DAL;
using Microsoft.AspNetCore.Mvc;

namespace TestEstanteria
{
    [TestClass]
    public class AlbaranTest
    {
        [TestMethod]
        public void GetAsyncReturnsOK()
        {
            var albaranRepository = new AlbaranProvider();
            var albaranController = new AlbaranController(albaranRepository);

            var result = albaranController.GetAsync("1").Result;

            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(OkObjectResult));
        }

        [TestMethod]
        public void GetAsyncReturnsNotOK()
        {
            var albaranRepository = new AlbaranProvider();
            var albaranController = new AlbaranController(albaranRepository);

            var result = albaranController.GetAsync("666").Result;

            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }
    }
}