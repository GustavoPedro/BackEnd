// Skipping function Up(none), it contains poisonous unsupported syntaxes

func @_BackEnd.Migrations.DeleteCascade.Down$Microsoft.EntityFrameworkCore.Migrations.MigrationBuilder$(none) -> () loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :190 :8) {
^entry (%_migrationBuilder : none):
%0 = cbde.alloca none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :190 :37)
cbde.store %_migrationBuilder, %0 : memref<none> loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :190 :37)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :192 :12) // Not a variable of known type: migrationBuilder
%2 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :193 :22) // "AtividadeUsuario" (StringLiteralExpression)
%3 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :192 :12) // migrationBuilder.DropTable(                  name: "AtividadeUsuario") (InvocationExpression)
%4 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :195 :12) // Not a variable of known type: migrationBuilder
%5 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :196 :22) // "Atividade" (StringLiteralExpression)
%6 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :195 :12) // migrationBuilder.DropTable(                  name: "Atividade") (InvocationExpression)
%7 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :198 :12) // Not a variable of known type: migrationBuilder
%8 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :199 :22) // "UsuarioDisciplina" (StringLiteralExpression)
%9 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :198 :12) // migrationBuilder.DropTable(                  name: "UsuarioDisciplina") (InvocationExpression)
%10 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :201 :12) // Not a variable of known type: migrationBuilder
%11 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :202 :22) // "Disciplina" (StringLiteralExpression)
%12 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :201 :12) // migrationBuilder.DropTable(                  name: "Disciplina") (InvocationExpression)
%13 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :204 :12) // Not a variable of known type: migrationBuilder
%14 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :205 :22) // "Usuario" (StringLiteralExpression)
%15 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :204 :12) // migrationBuilder.DropTable(                  name: "Usuario") (InvocationExpression)
%16 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :207 :12) // Not a variable of known type: migrationBuilder
%17 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :208 :22) // "Escola" (StringLiteralExpression)
%18 = cbde.unknown : none loc("C:\\Repositorio\\Backend\\Migrations\\20200606170743_Delete Cascade.cs" :207 :12) // migrationBuilder.DropTable(                  name: "Escola") (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
