using GrupoC.Search.Controllers;
using GrupoC.Search.Interfaces;
using GrupoC.Search.Services;
using Microsoft.AspNetCore.Mvc;

namespace SearchTest
{
    [TestClass]
    public class SearchTest
    {

        [TestMethod]
        public void GetAsyncReturnsOK()
        {
            IEstanteriaService estanteriaService = new EstanteriasFake();
            IProductoService productoService = new ProductosFake();
            IAlbaranService albaranService = new AlbaranFake();

            var searchController = new SearchController(
                estanteriaService,
                productoService,
                albaranService);

            var resultCaducidad = searchController.CaducidadAsync();
            var resultAlbaran = searchController.AlbaranAsync("1");
            Assert.IsNotNull(resultCaducidad);
            Assert.IsNotNull(resultAlbaran);
            Assert.IsInstanceOfType(resultCaducidad, typeof(OkObjectResult));
            Assert.IsInstanceOfType(resultAlbaran, typeof(OkObjectResult));
        }

        [TestMethod]
        public void GetAsyncReturnsNotOK()
        {
            IEstanteriaService estanteriaService = new EstanteriasFake();
            IProductoService productoService = new ProductosFake();
            IAlbaranService albaranService = new AlbaranFake();

            var searchController = new SearchController(
                estanteriaService,
                productoService,
                albaranService);

            var resultAlbaran = searchController.AlbaranAsync("666");
            var resultCaducidad = searchController.CaducidadAsync();

            Assert.IsNotNull(resultCaducidad);
            Assert.IsNotNull(resultAlbaran);
            Assert.IsInstanceOfType(resultCaducidad, typeof(NotFoundResult));
            Assert.IsInstanceOfType(resultAlbaran, typeof(NotFoundResult));
        }
    }
}