func @_BackEnd.Filters.TokenEmailFilter.OnActionExecuting$Microsoft.AspNetCore.Mvc.Filters.ActionExecutingContext$(none) -> () loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :12 :8) {
^entry (%_context : none):
%0 = cbde.alloca none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :12 :47)
cbde.store %_context, %0 : memref<none> loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :12 :47)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :14 :27) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :14 :27) // context.HttpContext (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :14 :27) // context.HttpContext.Request (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :14 :27) // context.HttpContext.Request.Headers (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :14 :63) // "Authorization" (StringLiteralExpression)
%6 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :14 :27) // context.HttpContext.Request.Headers["Authorization"] (ElementAccessExpression)
%8 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :15 :20) // Not a variable of known type: token
%9 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :15 :32) // ' ' (CharacterLiteralExpression)
%10 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :15 :20) // token.Split(' ') (InvocationExpression)
%11 = constant 1 : i32 loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :15 :37)
%12 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :15 :20) // token.Split(' ')[1] (ElementAccessExpression)
%13 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :16 :46) // new JwtSecurityTokenHandler() (ObjectCreationExpression)
%15 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :17 :31) // Not a variable of known type: handler
%16 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :17 :52) // Not a variable of known type: token
%17 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :17 :31) // handler.ReadJwtToken(token) (InvocationExpression)
%19 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :18 :27) // Not a variable of known type: tokenDecoded
%20 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :18 :27) // tokenDecoded.Payload (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :18 :66) // "email" (StringLiteralExpression)
%22 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :18 :27) // tokenDecoded.Payload.GetValueOrDefault("email") (InvocationExpression)
%23 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :18 :27) // tokenDecoded.Payload.GetValueOrDefault("email").ToString() (InvocationExpression)
%25 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :19 :12) // Not a variable of known type: context
%26 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :19 :12) // context.ActionArguments (SimpleMemberAccessExpression)
%27 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :19 :40) // "email" (StringLiteralExpression)
%28 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :19 :49) // Not a variable of known type: email
%29 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Filters\\TokenEmailFilter.cs" :19 :12) // context.ActionArguments.Add("email", email) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
