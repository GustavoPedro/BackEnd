// Skipping function GetUsuario(), it contains poisonous unsupported syntaxes

// Skipping function GetUsuario(none), it contains poisonous unsupported syntaxes

// Skipping function GetUsuarioNome(none), it contains poisonous unsupported syntaxes

// Skipping function PutUsuario(none), it contains poisonous unsupported syntaxes

// Skipping function PutCargoUsuario(none, none), it contains poisonous unsupported syntaxes

// Skipping function getAlunos(), it contains poisonous unsupported syntaxes

// Skipping function getProfessores(), it contains poisonous unsupported syntaxes

// Skipping function PostUsuario(none), it contains poisonous unsupported syntaxes

func @_BackEnd.Controllers.UsuariosController.GetUserLogged$BackEnd.Models.Usuario$(none) -> none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :243 :8) {
^entry (%_usuario : none):
%0 = cbde.alloca none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :243 :37)
cbde.store %_usuario, %0 : memref<none> loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :243 :37)
br ^0

^0: // JumpBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: TokenService
%1 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :245 :54) // Not a variable of known type: usuario
%2 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :245 :27) // TokenService.GenerateToken(usuario) (InvocationExpression)
%4 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :246 :12) // Not a variable of known type: usuario
%5 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :246 :12) // usuario.Senha (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :246 :28) // "" (StringLiteralExpression)
%7 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :249 :26) // Not a variable of known type: usuario
%8 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :250 :24) // Not a variable of known type: token
%9 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :247 :19) // new              {                  Usuario = usuario,                  token = token              } (AnonymousObjectCreationExpression)
return %9 : none loc("C:\\Repositorio\\Backend\\Controllers\\UsuariosController.cs" :247 :12)

^1: // ExitBlock
cbde.unreachable

}
// Skipping function Login(none), it contains poisonous unsupported syntaxes

// Skipping function DeleteUsuario(none), it contains poisonous unsupported syntaxes

// Skipping function UsuarioExists(none, none), it contains poisonous unsupported syntaxes

// Skipping function UsuarioExists(none), it contains poisonous unsupported syntaxes

// Skipping function AlterarSenha(none, none), it contains poisonous unsupported syntaxes

