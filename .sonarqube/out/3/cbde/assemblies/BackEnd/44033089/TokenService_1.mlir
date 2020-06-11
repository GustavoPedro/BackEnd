func @_BackEnd.Services.TokenService.GenerateToken$BackEnd.Models.Usuario$(none) -> none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :14 :8) {
^entry (%_usuario : none):
%0 = cbde.alloca none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :14 :43)
cbde.store %_usuario, %0 : memref<none> loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :14 :43)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :16 :31) // new JwtSecurityTokenHandler() (ObjectCreationExpression)
// Entity from another assembly: Encoding
%3 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :17 :22) // Encoding.ASCII (SimpleMemberAccessExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: Settings
%4 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :17 :46) // Settings.Secret (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :17 :22) // Encoding.ASCII.GetBytes(Settings.Secret) (InvocationExpression)
%7 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :18 :34) // new SecurityTokenDescriptor              {                         Issuer = Settings.Issuer,                  Audience = Settings.Audience,                   Subject = new ClaimsIdentity(new Claim[]                  {                      new Claim(ClaimTypes.Email, usuario.Email.ToString()),                      new Claim(ClaimTypes.Role, usuario.TipoUsuario.ToString())                  }),                  Expires = DateTime.UtcNow.AddHours(2),                  SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key),SecurityAlgorithms.HmacSha256Signature)              } (ObjectCreationExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: Settings
%8 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :20 :25) // Settings.Issuer (SimpleMemberAccessExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: Settings
%9 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :21 :27) // Settings.Audience (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :22 :55) //  (OmittedArraySizeExpression)
%11 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :22 :49) // Claim[] (ArrayType)
%12 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :22 :45) // new Claim[]                  {                      new Claim(ClaimTypes.Email, usuario.Email.ToString()),                      new Claim(ClaimTypes.Role, usuario.TipoUsuario.ToString())                  } (ArrayCreationExpression)
// Entity from another assembly: ClaimTypes
%13 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :24 :30) // ClaimTypes.Email (SimpleMemberAccessExpression)
%14 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :24 :48) // Not a variable of known type: usuario
%15 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :24 :48) // usuario.Email (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :24 :48) // usuario.Email.ToString() (InvocationExpression)
%17 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :24 :20) // new Claim(ClaimTypes.Email, usuario.Email.ToString()) (ObjectCreationExpression)
// Entity from another assembly: ClaimTypes
%18 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :25 :30) // ClaimTypes.Role (SimpleMemberAccessExpression)
%19 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :25 :47) // Not a variable of known type: usuario
%20 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :25 :47) // usuario.TipoUsuario (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :25 :47) // usuario.TipoUsuario.ToString() (InvocationExpression)
%22 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :25 :20) // new Claim(ClaimTypes.Role, usuario.TipoUsuario.ToString()) (ObjectCreationExpression)
%23 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :22 :26) // new ClaimsIdentity(new Claim[]                  {                      new Claim(ClaimTypes.Email, usuario.Email.ToString()),                      new Claim(ClaimTypes.Role, usuario.TipoUsuario.ToString())                  }) (ObjectCreationExpression)
// Entity from another assembly: DateTime
%24 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :27 :26) // DateTime.UtcNow (SimpleMemberAccessExpression)
%25 = constant 2 : i32 loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :27 :51)
%26 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :27 :26) // DateTime.UtcNow.AddHours(2) (InvocationExpression)
%27 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :28 :85) // Not a variable of known type: key
%28 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :28 :60) // new SymmetricSecurityKey(key) (ObjectCreationExpression)
// Entity from another assembly: SecurityAlgorithms
%29 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :28 :90) // SecurityAlgorithms.HmacSha256Signature (SimpleMemberAccessExpression)
%30 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :28 :37) // new SigningCredentials(new SymmetricSecurityKey(key),SecurityAlgorithms.HmacSha256Signature) (ObjectCreationExpression)
%32 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :31 :24) // Not a variable of known type: tokenHandler
%33 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :31 :49) // Not a variable of known type: tokenDescriptor
%34 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :31 :24) // tokenHandler.CreateToken(tokenDescriptor) (InvocationExpression)
%36 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :32 :19) // Not a variable of known type: tokenHandler
%37 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :32 :43) // Not a variable of known type: token
%38 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :32 :19) // tokenHandler.WriteToken(token) (InvocationExpression)
return %38 : none loc("C:\\Repositorio\\Backend\\Services\\TokenService.cs" :32 :12)

^1: // ExitBlock
cbde.unreachable

}
