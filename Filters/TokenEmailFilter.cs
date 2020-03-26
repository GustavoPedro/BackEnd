using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Filters
{
    public class TokenEmailFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            string token = context.HttpContext.Request.Headers["Authorization"];
            token = token.Split(' ')[1];
            JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();
            var tokenDecoded = handler.ReadJwtToken(token);
            string email = tokenDecoded.Payload.GetValueOrDefault("email").ToString();            
            context.ActionArguments.Add("email", email);
        }        
    }
}
