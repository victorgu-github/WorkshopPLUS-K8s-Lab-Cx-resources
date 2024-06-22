using MathTrick3Step1.Services;
using MathTrickCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MathTrick3Step1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CalculationsController : ControllerBase
    {
        private readonly ICalculationService _calculationService;

        public CalculationsController(ICalculationService calculationService)
        {
            _calculationService = calculationService;
        }

        [HttpGet("{pickedNumber}")]
        public List<CalculationStepModel> Get(int pickedNumber)
        {
            return _calculationService.CalculateStep(pickedNumber, 0.0);           
        }     
    }
}
