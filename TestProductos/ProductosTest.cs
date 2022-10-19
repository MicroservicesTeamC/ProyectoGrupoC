using GrupoC.Producto.Controllers;
using GrupoC.Producto.DAL;
using Microsoft.AspNetCore.Mvc;

namespace TestProductos
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void GetAsyncReturnsOK()
        {
            var productosRepository = new ProductoRepositoryFake();
            var productsController = new ProductoController(productosRepository);

            var result = productsController.GetAsync(1).Result;

            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(OkObjectResult));
        }

        [TestMethod]
        public void GetAllAsyncReturnsOK()
        {
            var productosRepository = new ProductoRepositoryFake();
            var productsController = new ProductoController(productosRepository);

            var result = productsController.GetAllAsync().Result;

            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(OkObjectResult));
        }


        [TestMethod]
        public void GetAsyncReturnsNotOK()
        {
            var productosRepository = new ProductoRepositoryFake();
            var productosController = new ProductoController(productosRepository);

            var result = productosController.GetAsync(666).Result;

            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }


        [TestMethod]
        public void GetAllAsyncReturnsNotOK()
        {
            var productosRepository = new ProductoRepositoryFake("hola");

            var productosController = new ProductoController(productosRepository);

            var result = productosController.GetAllAsync().Result;

            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }
    }
}