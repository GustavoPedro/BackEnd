æj
:C:\Repositorio\Backend\Controllers\AtividadesController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
AtividadesController %
:& '
ControllerBase( 6
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public  
AtividadesController #
(# $
DatabaseContext$ 3
context4 ;
,; <
IMapper= D
mapperE K
)K L
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
[   	
HttpGet  	 
(   
$str   "
)  " #
]  # $
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
<!!& '
IEnumerable!!' 2
<!!2 3
	Atividade!!3 <
>!!< =
>!!= >
>!!> ?
GetAtividade!!@ L
(!!L M
)!!M N
{"" 	
return## 
await## 
_context## !
.##! "
	Atividade##" +
.##+ ,
ToListAsync##, 7
(##7 8
)##8 9
;##9 :
}$$ 	
['' 	
HttpGet''	 
('' 
$str'' '
)''' (
]''( )
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
<((& '
	Atividade((' 0
>((0 1
>((1 2
GetAtividade((3 ?
(((? @
int((@ C
id((D F
)((F G
{)) 	
var** 
	atividade** 
=** 
await** !
_context**" *
.*** +
	Atividade**+ 4
.**4 5
	FindAsync**5 >
(**> ?
id**? A
)**A B
;**B C
if,, 
(,, 
	atividade,, 
==,, 
null,, !
),,! "
{-- 
return.. 
NotFound.. 
(..  
new..  #
{..$ %
msg..& )
=..* +
$str.., T
}..U V
)..V W
;..W X
}// 
return11 
	atividade11 
;11 
}22 	
private55 
async55 
void55 
AtivAndamento55 (
(55( )
	Atividade55) 2
	atividade553 <
)55< =
{66 	
if77 
(77 
	atividade77 
.77 
StatusAtividade77 )
==77* ,
StatusAtividadeEnum77- @
.77@ A
Emand77A F
)77F G
{88 
List99 
<99 
UsuarioDisciplina99 &
>99& '
lista99( -
=99. /
await990 5
_context996 >
.99> ?
UsuarioDisciplina99? P
.99P Q
Where99Q V
(99V W
a99W X
=>99Y [
a99\ ]
.99] ^"
DisciplinaIdDisciplina99^ t
==99u w
	atividade	99x Å
.
99Å Ç
IdDisciplina
99Ç é
&&
99è ë
a
99í ì
.
99ì î"
UsuarioCpfNavigation
99î ®
.
99® ©
TipoUsuario
99© ¥
==
99µ ∑
TipoUsuarioEnum
99∏ «
.
99« »
Aluno
99» Õ
)
99Õ Œ
.
99Œ œ
ToListAsync
99œ ⁄
(
99⁄ €
)
99€ ‹
;
99‹ ›
List:: 
<:: 
AtividadeUsuario:: %
>::% &

atividades::' 1
=::2 3
await::4 9
_context::: B
.::B C
AtividadeUsuario::C S
.::S T
Where::T Y
(::Y Z
ativ::Z ^
=>::_ a
ativ::b f
.::f g*
IdUsuarioDisciplinaNavigation	::g Ñ
.
::Ñ Ö$
DisciplinaIdDisciplina
::Ö õ
==
::ú û
	atividade
::ü ®
.
::® ©
IdDisciplina
::© µ
&&
::∂ ∏
ativ
::π Ω
.
::Ω æ
IdAtividade
::æ …
==
::  Ã
	atividade
::Õ ÷
.
::÷ ◊
IdAtividade
::◊ ‚
)
::‚ „
.
::„ ‰
ToListAsync
::‰ Ô
(
::Ô 
)
:: Ò
;
::Ò Ú
foreach;; 
(;; 
UsuarioDisciplina;; *
usuarioDisc;;+ 6
in;;7 9
lista;;: ?
);;? @
{<< 
if== 
(== 
!== 

atividades== #
.==# $
Any==$ '
(==' (
usr==( +
=>==, .
usr==/ 2
.==2 3
IdUsuarioDisciplina==3 F
====G I
usuarioDisc==J U
.==U V
IdUsuarioDisciplina==V i
)==i j
)==j k
{>> 
AtividadeUsuario?? (
atividadeUsuario??) 9
=??: ;
new??< ?
AtividadeUsuario??@ P
(??P Q
)??Q R
;??R S
atividadeUsuario@@ (
.@@( )
IdAtividade@@) 4
=@@5 6
	atividade@@7 @
.@@@ A
IdAtividade@@A L
;@@L M
atividadeUsuarioAA (
.AA( )
IdUsuarioDisciplinaAA) <
=AA= >
usuarioDiscAA? J
.AAJ K
IdUsuarioDisciplinaAAK ^
;AA^ _
atividadeUsuarioBB (
.BB( )
StatusBB) /
=BB0 1
$strBB2 @
;BB@ A
atividadeUsuarioCC (
.CC( )
TotalCC) .
=CC/ 0
$numCC1 2
;CC2 3
_contextEE  
.EE  !
AtividadeUsuarioEE! 1
.EE1 2
AddEE2 5
(EE5 6
atividadeUsuarioEE6 F
)EEF G
;EEG H
}FF 
}HH 
}II 
}JJ 	
[OO 
HttpPutOO 
(OO 
$strOO &
)OO& '
]OO' (
[PP 	
	AuthorizePP	 
(PP 
RolesPP 
=PP 
$strPP +
)PP+ ,
]PP, -
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (
PutAtividadeQQ) 5
(QQ5 6
intQQ6 9
idQQ: <
,QQ< =
	AtividadeQQ> G
	atividadeQQH Q
)QQQ R
{RR 	
ifSS 
(SS 
idSS 
!=SS 
	atividadeSS 
.SS  
IdAtividadeSS  +
)SS+ ,
{TT 
returnUU 

BadRequestUU !
(UU! "
newUU" %
{UU& '
msgUU( +
=UU, -
$strUU. `
}UUa b
)UUb c
;UUc d
}VV 
_contextYY 
.YY 
EntryYY 
(YY 
	atividadeYY $
)YY$ %
.YY% &
StateYY& +
=YY, -
EntityStateYY. 9
.YY9 :
ModifiedYY: B
;YYB C
try[[ 
{\\ 
AtivAndamento]] 
(]] 
	atividade]] '
)]]' (
;]]( )
await__ 
_context__ 
.__ 
SaveChangesAsync__ /
(__/ 0
)__0 1
;__1 2
}`` 
catchaa 
(aa (
DbUpdateConcurrencyExceptionaa /
)aa/ 0
{bb 
ifcc 
(cc 
!cc 
AtividadeExistscc $
(cc$ %
idcc% '
)cc' (
)cc( )
{dd 
returnee 
NotFoundee #
(ee# $
newee$ '
{ee( )
msgee* -
=ee. /
$stree0 X
}eeY Z
)eeZ [
;ee[ \
}ff 
elsehh 
{ii 
throwjj 
;jj 
}kk 
}ll 
returnnn 

StatusCodenn 
(nn 
$numnn !
,nn! "
newnn# &
{nn' (
msgnn) ,
=nn- .
$"nn/ 1

Atividade nn1 ;
{nn; <
	atividadenn< E
.nnE F

Atividade1nnF P
}nnP Q!
 alterada com sucessonnQ f
"nnf g
}nnh i
)nni j
;nnj k
}oo 	
[tt 	
HttpPosttt	 
]tt 
[uu 	
Routeuu	 
(uu 
$struu  
)uu  !
]uu! "
[vv 	
	Authorizevv	 
(vv 
Rolesvv 
=vv 
$strvv *
)vv* +
]vv+ ,
publicww 
asyncww 
Taskww 
<ww 
dynamicww !
>ww! "
PostAtividadesww# 1
(ww1 2
[ww2 3
FromBodyww3 ;
]ww; <
AtividadeViewModelww= O
modelwwP U
)wwU V
{xx 	
intyy 
idyy 
;yy 
	Atividadezz 
	atividadezz 
=zz  !
_mapperzz" )
.zz) *
Mapzz* -
<zz- .
	Atividadezz. 7
>zz7 8
(zz8 9
modelzz9 >
)zz> ?
;zz? @
_context{{ 
.{{ 
	Atividade{{ 
.{{ 
Add{{ "
({{" #
	atividade{{# ,
){{, -
;{{- .
try}} 
{~~ 
await
ÄÄ 
_context
ÄÄ 
.
ÄÄ 
SaveChangesAsync
ÄÄ /
(
ÄÄ/ 0
)
ÄÄ0 1
;
ÄÄ1 2
}
ÅÅ 
catch
ÇÇ 
(
ÇÇ 
DbUpdateException
ÇÇ $
)
ÇÇ$ %
{
ÉÉ 
if
ÑÑ 
(
ÑÑ 
AtividadeExists
ÑÑ #
(
ÑÑ# $
	atividade
ÑÑ$ -
.
ÑÑ- .
IdAtividade
ÑÑ. 9
)
ÑÑ9 :
)
ÑÑ: ;
{
ÖÖ 
return
ÜÜ 
Conflict
ÜÜ #
(
ÜÜ# $
new
ÜÜ$ '
{
ÜÜ( )
msg
ÜÜ* -
=
ÜÜ. /
$str
ÜÜ0 S
}
ÜÜT U
)
ÜÜU V
;
ÜÜV W
}
áá 
else
ââ 
{
ää 
throw
ãã 
;
ãã 
}
åå 
}
çç 
try
èè 
{
êê 
AtivAndamento
ëë 
(
ëë 
	atividade
ëë '
)
ëë' (
;
ëë( )
}
íí 
catch
ìì 
(
ìì 
DbUpdateException
ìì #
)
ìì# $
{
îî 
return
ïï 

BadRequest
ïï !
(
ïï! "
new
ïï" %
{
ïï& '
msg
ïï( +
=
ïï, -
$str
ïï. J
}
ïïK L
)
ïïL M
;
ïïM N
}
ññ 
_context
òò 
.
òò 
SaveChanges
òò !
(
òò! "
)
òò" #
;
òò# $
return
ôô 
CreatedAtAction
ôô "
(
ôô" #
$str
ôô# 1
,
ôô1 2
new
ôô3 6
{
ôô7 8
id
ôô9 ;
=
ôô< =
	atividade
ôô> G
.
ôôG H
IdAtividade
ôôH S
,
ôôS T
msg
ôôT W
=
ôôW X
$"
ôôY [

Atividade 
ôô[ e
{
ôôe f
	atividade
ôôf o
.
ôôo p

Atividade1
ôôp z
}
ôôz {&
 cadastrada com sucessoôô{ í
"ôôí ì
}ôôî ï
,ôôï ñ
	atividadeôôó †
)ôô† °
;ôô° ¢
}
öö 	
[
ùù 	

HttpDelete
ùù	 
(
ùù 
$str
ùù *
)
ùù* +
]
ùù+ ,
public
ûû 
async
ûû 
Task
ûû 
<
ûû 
ActionResult
ûû &
<
ûû& '
	Atividade
ûû' 0
>
ûû0 1
>
ûû1 2
DeleteAtividade
ûû3 B
(
ûûB C
int
ûûC F
id
ûûG I
)
ûûI J
{
üü 	
var
†† 
	atividade
†† 
=
†† 
await
†† !
_context
††" *
.
††* +
	Atividade
††+ 4
.
††4 5
	FindAsync
††5 >
(
††> ?
id
††? A
)
††A B
;
††B C
if
°° 
(
°° 
	atividade
°° 
==
°° 
null
°° !
)
°°! "
{
¢¢ 
return
££ 
NotFound
££ 
(
££  
new
££  #
{
££$ %
msg
££& )
=
££* +
$str
££, X
}
££Y Z
)
££Z [
;
££[ \
}
§§ 
_context
¶¶ 
.
¶¶ 
	Atividade
¶¶ 
.
¶¶ 
Remove
¶¶ %
(
¶¶% &
	atividade
¶¶& /
)
¶¶/ 0
;
¶¶0 1
await
ßß 
_context
ßß 
.
ßß 
SaveChangesAsync
ßß +
(
ßß+ ,
)
ßß, -
;
ßß- .
return
©© 

StatusCode
©© 
(
©© 
$num
©© !
,
©©! "
new
©©" %
{
©©& '
msg
©©' *
=
©©* +
$str
©©+ K
,
©©K L
	atividade
©©L U
=
©©V W
	atividade
©©X a
}
©©a b
)
©©b c
;
©©c d
}
™™ 	
private
¨¨ 
bool
¨¨ 
AtividadeExists
¨¨ $
(
¨¨$ %
int
¨¨% (
id
¨¨) +
)
¨¨+ ,
{
≠≠ 	
return
ÆÆ 
_context
ÆÆ 
.
ÆÆ 
	Atividade
ÆÆ %
.
ÆÆ% &
Any
ÆÆ& )
(
ÆÆ) *
e
ÆÆ* +
=>
ÆÆ, .
e
ÆÆ/ 0
.
ÆÆ0 1
IdAtividade
ÆÆ1 <
==
ÆÆ= ?
id
ÆÆ@ B
)
ÆÆB C
;
ÆÆC D
}
ØØ 	
}
∞∞ 
}±± ÄZ
@C:\Repositorio\Backend\Controllers\AtividadeUsuarioController.cs
	namespace		 	
BackEnd		
 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class '
AtividadeUsuariosController ,
:- .
ControllerBase/ =
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
public '
AtividadeUsuariosController *
(* +
DatabaseContext+ :
context; B
)B C
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
( 
$str (
)( )
]) *
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
AtividadeUsuario3 C
>C D
>D E
>E F
GetAtividadeUsuarioG Z
(Z [
)[ \
{ 	
return 
await 
_context !
.! "
AtividadeUsuario" 2
.2 3
ToListAsync3 >
(> ?
)? @
;@ A
} 	
[ 	
HttpGet	 
( 
$str <
)< =
]= >
public 
async 
Task 
< 0
$AtividadeUsuarioEDisciplinaViewModel >
>> ?*
GetAtividadeUsuarioEDisciplina@ ^
(^ _
string_ e
emailf k
)k l
{ 	
List   
<   
AtividadeUsuario   !
>  ! "
atividadesUsuario  # 4
=  5 6
await  7 <
_context  = E
.  E F
AtividadeUsuario  F V
.!! 
Include!! 
(!! 
ativ!! 
=>!! 
ativ!! !
.!!! "!
IdAtividadeNavigation!!" 7
)!!7 8
."" 
Where"" 
("" 
ativ"" 
=>"" 
ativ"" 
.""  )
IdUsuarioDisciplinaNavigation""  =
.""= > 
UsuarioCpfNavigation""> R
.""R S
Email""S X
==""Y [
email""\ a
)""a b
.## 
ToListAsync## 
(## 
)## 
;## 
List$$ 
<$$ 

Disciplina$$ 
>$$ 
disciplinas$$ (
=$$) *
await$$+ 0
_context$$1 9
.%% 

Disciplina%% 
.&& 
Where&& 
(&& 
disc&& 
=>&& 
disc&& 
.&&  
UsuarioDisciplina&&  1
.&&1 2
Select&&2 8
(&&8 9
usrdisc&&9 @
=>&&A C
usrdisc&&D K
.&&K L 
UsuarioCpfNavigation&&L `
.&&` a
Email&&a f
)&&f g
.&&g h
Contains&&h p
(&&p q
email&&q v
)&&v w
)&&w x
.'' 
ToListAsync'' 
('' 
)'' 
;'' 0
$AtividadeUsuarioEDisciplinaViewModel(( 0
ativ((1 5
=((6 7
new((8 ;0
$AtividadeUsuarioEDisciplinaViewModel((< `
(((` a
)((a b
;((b c
ativ)) 
.)) 
AtividadesUsuario)) "
=))# $
atividadesUsuario))% 6
;))6 7
ativ** 
.** 
Disciplinas** 
=** 
disciplinas** *
;*** +
return++ 
ativ++ 
;++ 
},, 	
[// 	
HttpGet//	 
(// 
$str// -
)//- .
]//. /
[00 	
	Authorize00	 
]00 
public11 
async11 
Task11 
<11 
ActionResult11 &
<11& '
AtividadeUsuario11' 7
>117 8
>118 9
GetAtividadeUsuario11: M
(11M N
int11N Q
id11R T
)11T U
{22 	
var44 
	resultado44 
=44 
from44  
AtividadeUsuario44! 1
in442 4
_context445 =
.44= >
AtividadeUsuario44> N
join55  
UsuarioDisciplina55! 2
in553 5
_context556 >
.55> ?
UsuarioDisciplina55? P
on55Q S
AtividadeUsuario55T d
.55d e
IdUsuarioDisciplina55e x
equals55y 
UsuarioDisciplina
55Ä ë
.
55ë í!
IdUsuarioDisciplina
55í •
where66 !
AtividadeUsuario66" 2
.662 3
IdAtividade663 >
==66? A
id66B D
select77 "
new77# &
{88 
IdAtividadeUsuario99  2
=993 4
AtividadeUsuario995 E
.99E F
IdAtividadeUsuario99F X
,99X Y
IdAtividade::  +
=::, -
AtividadeUsuario::. >
.::> ?
IdAtividade::? J
,::J K
Nome;;  $
=;;% &
UsuarioDisciplina;;' 8
.;;8 9 
UsuarioCpfNavigation;;9 M
.;;M N
NomeSobrenome;;N [
,;;[ \
Cpf<<  #
=<<$ %
UsuarioDisciplina<<& 7
.<<7 8 
UsuarioCpfNavigation<<8 L
.<<L M
Cpf<<M P
,<<P Q
Status==  &
===' (
AtividadeUsuario==) 9
.==9 :
Status==: @
,==@ A
Total>>  %
=>>& '
AtividadeUsuario>>( 8
.>>8 9
Total>>9 >
,>>> ?
IdUsuarioDisciplina??  3
=??4 5
AtividadeUsuario??6 F
.??F G
IdUsuarioDisciplina??G Z
}@@ 
;@@ 
returnBB 
OkBB 
(BB 
	resultadoBB 
)BB  
;BB  !
}CC 	
[HH 	
HttpPutHH	 
(HH 
$strHH 
)HH 
]HH 
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' (
PutAtividadeUsuarioII) <
(II< =
intII= @
idIIA C
,IIC D
AtividadeUsuarioIIE U
AtividadeUsuarioIIV f
)IIf g
{JJ 	
ifKK 
(KK 
idKK 
!=KK 
AtividadeUsuarioKK &
.KK& '
IdAtividadeUsuarioKK' 9
)KK9 :
{LL 
returnMM 

BadRequestMM !
(MM! "
)MM" #
;MM# $
}NN 
_contextPP 
.PP 
EntryPP 
(PP 
AtividadeUsuarioPP +
)PP+ ,
.PP, -
StatePP- 2
=PP3 4
EntityStatePP5 @
.PP@ A
ModifiedPPA I
;PPI J
_contextQQ 
.QQ 
EntryQQ 
(QQ 
AtividadeUsuarioQQ +
)QQ+ ,
.QQ, -
PropertyQQ- 5
(QQ5 6
xQQ6 7
=>QQ8 :
xQQ; <
.QQ< =
IdAtividadeQQ= H
)QQH I
.QQI J

IsModifiedQQJ T
=QQU V
falseQQW \
;QQ\ ]
_contextRR 
.RR 
EntryRR 
(RR 
AtividadeUsuarioRR +
)RR+ ,
.RR, -
PropertyRR- 5
(RR5 6
xRR6 7
=>RR8 :
xRR; <
.RR< =
IdUsuarioDisciplinaRR= P
)RRP Q
.RRQ R

IsModifiedRRR \
=RR] ^
falseRR_ d
;RRd e
tryTT 
{UU 
awaitVV 
_contextVV 
.VV 
SaveChangesAsyncVV /
(VV/ 0
)VV0 1
;VV1 2
}WW 
catchXX 
(XX (
DbUpdateConcurrencyExceptionXX /
)XX/ 0
{YY 
ifZZ 
(ZZ 
!ZZ "
AtividadeUsuarioExistsZZ +
(ZZ+ ,
idZZ, .
)ZZ. /
)ZZ/ 0
{[[ 
return\\ 
NotFound\\ #
(\\# $
)\\$ %
;\\% &
}]] 
else^^ 
{__ 
throw`` 
;`` 
}aa 
}bb 
returndd 

StatusCodedd 
(dd 
$numdd !
,dd! "
newdd# &
{dd' (
msgdd) ,
=dd- .
$"dd/ 1
A atividade dd1 =
{dd= >
AtividadeUsuariodd> N
.ddN O
IdAtividadeUsuarioddO a
}dda b4
' alterada com sucesso para os usu√°rios	ddb à
"
ddà â
}
ddä ã
)
ddã å
;
ddå ç
}ee 	
[jj 	
HttpPostjj	 
]jj 
publickk 
asynckk 
Taskkk 
<kk 
ActionResultkk &
<kk& '
AtividadeUsuariokk' 7
>kk7 8
>kk8 9 
PostAtividadeUsuariokk: N
(kkN O
AtividadeUsuariokkO _
AtividadeUsuariokk` p
)kkp q
{ll 	
_contextmm 
.mm 
AtividadeUsuariomm %
.mm% &
Addmm& )
(mm) *
AtividadeUsuariomm* :
)mm: ;
;mm; <
awaitnn 
_contextnn 
.nn 
SaveChangesAsyncnn +
(nn+ ,
)nn, -
;nn- .
returnpp 
CreatedAtActionpp "
(pp" #
$strpp# 8
,pp8 9
newpp: =
{pp> ?
idpp@ B
=ppC D
AtividadeUsuarioppE U
.ppU V
IdAtividadeUsuarioppV h
}ppi j
,ppj k
AtividadeUsuarioppl |
)pp| }
;pp} ~
}qq 	
[tt 	

HttpDeletett	 
(tt 
$strtt 
)tt 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
ActionResultuu &
<uu& '
AtividadeUsuariouu' 7
>uu7 8
>uu8 9"
DeleteAtividadeUsuariouu: P
(uuP Q
intuuQ T
iduuU W
)uuW X
{vv 	
varww 
AtividadeUsuarioww  
=ww! "
awaitww# (
_contextww) 1
.ww1 2
AtividadeUsuarioww2 B
.wwB C
	FindAsyncwwC L
(wwL M
idwwM O
)wwO P
;wwP Q
ifxx 
(xx 
AtividadeUsuarioxx  
==xx! #
nullxx$ (
)xx( )
{yy 
returnzz 
NotFoundzz 
(zz  
)zz  !
;zz! "
}{{ 
_context}} 
.}} 
AtividadeUsuario}} %
.}}% &
Remove}}& ,
(}}, -
AtividadeUsuario}}- =
)}}= >
;}}> ?
await~~ 
_context~~ 
.~~ 
SaveChangesAsync~~ +
(~~+ ,
)~~, -
;~~- .
return
ÄÄ 
AtividadeUsuario
ÄÄ #
;
ÄÄ# $
}
ÅÅ 	
private
ÉÉ 
bool
ÉÉ $
AtividadeUsuarioExists
ÉÉ +
(
ÉÉ+ ,
int
ÉÉ, /
id
ÉÉ0 2
)
ÉÉ2 3
{
ÑÑ 	
return
ÖÖ 
_context
ÖÖ 
.
ÖÖ 
AtividadeUsuario
ÖÖ ,
.
ÖÖ, -
Any
ÖÖ- 0
(
ÖÖ0 1
e
ÖÖ1 2
=>
ÖÖ3 5
e
ÖÖ6 7
.
ÖÖ7 8 
IdAtividadeUsuario
ÖÖ8 J
==
ÖÖK M
id
ÖÖN P
)
ÖÖP Q
;
ÖÖQ R
}
ÜÜ 	
}
áá 
}àà ≥
4C:\Repositorio\Backend\Controllers\AuthController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AuthController 
:  !
ControllerBase" 0
{ 
public 
DatabaseContext 
_context '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
AuthController 
( 
DatabaseContext -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpPost	 
] 
[   	
AllowAnonymous  	 
]   
[!! 	
Route!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
dynamic"" !
>""! "
Login""# (
(""( )
["") *
FromBody""* 2
]""2 3
Usuario""3 :
model""; @
)""@ A
{## 	
Usuario$$ 
usuario$$ 
=$$ 
await$$ #
_context$$$ ,
.$$, -
Usuario$$- 4
.$$4 5
Where$$5 :
($$: ;
usr$$; >
=>$$? A
usr$$B E
.$$E F
Email$$F K
==$$L N
model$$O T
.$$T U
Email$$U Z
&&$$[ ]
usr$$^ a
.$$a b
Senha$$b g
==$$h j
model$$k p
.$$p q
Senha$$q v
)$$v w
.$$w x 
FirstOrDefaultAsync	$$x ã
(
$$ã å
)
$$å ç
;
$$ç é
if&& 
(&& 
usuario&& 
==&& 
null&& 
)&& 
{'' 
return(( 
NotFound(( 
(((  
new((  #
{(($ %
message((% ,
=((, -
$str((- I
}((J K
)((K L
;((L M
})) 
string** 
token** 
=** 
TokenService** '
.**' (
GenerateToken**( 5
(**5 6
usuario**6 =
)**= >
;**> ?
usuario++ 
.++ 
Senha++ 
=++ 
$str++ 
;++ 
return,, 
new,, 
{-- 
user.. 
=.. 
usuario.. 
,.. 
token// 
=// 
token// 
}00 
;00 
}11 	
}22 
}33 ∞û
;C:\Repositorio\Backend\Controllers\DisciplinasController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class !
DisciplinasController &
:' (
ControllerBase) 7
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public !
DisciplinasController $
($ %
DatabaseContext% 4
context5 <
,< =
IMapper> E
mapperF L
)L M
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
[   	
	Authorize  	 
]   
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
<!!& '
IEnumerable!!' 2
<!!2 3

Disciplina!!3 =
>!!= >
>!!> ?
>!!? @
GetDisciplina!!A N
(!!N O
)!!O P
{"" 	
var## 
result## 
=## 
from## 

Disciplina## (
in##) +
_context##, 4
.##4 5

Disciplina##5 ?
select$$ 
new$$  #
{%% 
id&& 
=&&  !

Disciplina&&" ,
.&&, -
IdDisciplina&&- 9
,&&9 :
	descricao'' &
=''' (

Disciplina'') 3
.''3 4
	Descricao''4 =
,''= >
mateira(( $
=((% &

Disciplina((' 1
.((1 2
Materia((2 9
,((9 :
turno)) "
=))# $

Disciplina))% /
.))/ 0
Turno))0 5
,))5 6 
professorResponsavel** 1
=**2 3

Disciplina**4 >
.**> ?
UsuarioDisciplina**? P
.**P Q
Where**Q V
(**V W
usrdisc**W ^
=>**_ a
usrdisc**b i
.**i j 
UsuarioCpfNavigation**j ~
.**~ 
TipoUsuario	** ä
==
**ã ç
TipoUsuarioEnum
**é ù
.
**ù û
	Professor
**û ß
)
**ß ®
.++ 
Select++ $
(++$ %
usr++% (
=>++) +
new++, /
{,, 
NomeSobrenome--! .
=--/ 0
usr--1 4
.--4 5 
UsuarioCpfNavigation--5 I
.--I J
NomeSobrenome--J W
,--W X
Cpf..! $
=..% &
usr..' *
...* + 
UsuarioCpfNavigation..+ ?
...? @
Cpf..@ C
}// 
)// 
.//  
FirstOrDefault//  .
(//. /
)/// 0
,//0 1
UsuarioDisciplina00 .
=00/ 0
_context001 9
.009 :
UsuarioDisciplina00: K
.111 2
Where112 7
(117 8
usr118 ;
=>11< >
usr11? B
.11B C"
DisciplinaIdDisciplina11C Y
==11Z \

Disciplina11] g
.11g h
IdDisciplina11h t
&&11u w
usr11x {
.11{ |!
UsuarioCpfNavigation	11| ê
.
11ê ë
TipoUsuario
11ë ú
==
11ù ü
TipoUsuarioEnum
11† Ø
.
11Ø ∞
Aluno
11∞ µ
)
11µ ∂
.221 2
Include222 9
(229 :
usrdisc22: A
=>22B D
usrdisc22E L
.22L M 
UsuarioCpfNavigation22M a
)22a b
.331 2
Select332 8
(338 9
usrdisc339 @
=>33A C
new33D G
{33H I
NomeSobrenome33J W
=33X Y
usrdisc33Z a
.33a b 
UsuarioCpfNavigation33b v
.33v w
NomeSobrenome	33w Ñ
,
33Ñ Ö
Cpf
33Ü â
=
33ä ã
usrdisc
33å ì
.
33ì î

UsuarioCpf
33î û
,
33û ü
TipoUsuario
33† ´
=
33¨ ≠
usrdisc
33Æ µ
.
33µ ∂"
UsuarioCpfNavigation
33∂  
.
33  À
TipoUsuario
33À ÷
}
33◊ ÿ
)
33ÿ Ÿ
.441 2
ToList442 8
(448 9
)449 :
}55 
;55 
return66 
Ok66 
(66 
result66 
)66 
;66 
}77 	
[:: 	
HttpGet::	 
(:: 
$str:: '
)::' (
]::( )
public;; 
async;; 
Task;; 
<;; 
ActionResult;; &
<;;& '

Disciplina;;' 1
>;;1 2
>;;2 3
GetDisciplina;;4 A
(;;A B
int;;B E
id;;F H
);;H I
{<< 	
var== 

disciplina== 
=== 
await== "
_context==# +
.==+ ,

Disciplina==, 6
.==6 7
	FindAsync==7 @
(==@ A
id==A C
)==C D
;==D E
if?? 
(?? 

disciplina?? 
==?? 
null?? "
)??" #
{@@ 
returnAA 
NotFoundAA 
(AA  
newAA  #
{AA$ %
msgAA& )
=AA* +
$strAA, U
}AAV W
)AAW X
;AAX Y
}BB 
returnDD 

disciplinaDD 
;DD 
}EE 	
[JJ 	
HttpPutJJ	 
(JJ 
$strJJ '
)JJ' (
]JJ( )
[KK 	
	AuthorizeKK	 
(KK 
RolesKK 
=KK 
$strKK *
)KK* +
]KK+ ,
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
PutDisciplinaLL) 6
(LL6 7
intLL7 :
idLL; =
,LL= >
DisciplinaViewModelLL? R
modelLLS X
)LLX Y
{MM 	
varNN 
existingParentNN 
=NN  
_contextNN! )
.NN) *

DisciplinaNN* 4
.OO  !
WhereOO! &
(OO& '
pOO' (
=>OO) +
pOO, -
.OO- .
IdDisciplinaOO. :
==OO; =
idOO> @
)OO@ A
.PP  !
IncludePP! (
(PP( )
pPP) *
=>PP+ -
pPP. /
.PP/ 0
UsuarioDisciplinaPP0 A
)PPA B
.QQ  !
SingleOrDefaultQQ! 0
(QQ0 1
)QQ1 2
;QQ2 3
ifSS 
(SS 
existingParentSS 
!=SS !
nullSS" &
)SS& '
{TT 
DisciplinaViewModelUU #
parentValuesUU$ 0
=UU1 2
newUU3 6
DisciplinaViewModelUU7 J
{VV 
	DescricaoWW 
=WW 
modelWW  %
.WW% &
	DescricaoWW& /
,WW/ 0
MateriaXX 
=XX 
modelXX #
.XX# $
MateriaXX$ +
,XX+ ,
TurnoYY 
=YY 
modelYY !
.YY! "
TurnoYY" '
,YY' (
IdDisciplinaZZ  
=ZZ! "
modelZZ# (
.ZZ( )
IdDisciplinaZZ) 5
}[[ 
;[[ 
_context]] 
.]] 
Entry]] 
(]] 
existingParent]] -
)]]- .
.]]. /
CurrentValues]]/ <
.]]< =
	SetValues]]= F
(]]F G
parentValues]]G S
)]]S T
;]]T U
foreach__ 
(__ 
var__ 
existingChild__ *
in__+ -
existingParent__. <
.__< =
UsuarioDisciplina__= N
.__N O
ToList__O U
(__U V
)__V W
)__W X
{`` 
ifaa 
(aa 
!aa 
modelaa 
.aa 
UsuarioDisciplinaaa 0
.aa0 1
Anyaa1 4
(aa4 5
caa5 6
=>aa7 9
caa: ;
.aa; <"
DisciplinaIdDisciplinaaa< R
==aaS U
existingChildaaV c
.aac d"
DisciplinaIdDisciplinaaad z
&&aa{ }
caa~ 
.	aa Ä

UsuarioCpf
aaÄ ä
==
aaã ç
existingChild
aaé õ
.
aaõ ú

UsuarioCpf
aaú ¶
)
aa¶ ß
)
aaß ®
_contextbb  
.bb  !
UsuarioDisciplinabb! 2
.bb2 3
Removebb3 9
(bb9 :
existingChildbb: G
)bbG H
;bbH I
}cc 
foreachdd 
(dd 
vardd 

childModeldd '
indd( *
modeldd+ 0
.dd0 1
UsuarioDisciplinadd1 B
)ddB C
{ee 
ifff 
(ff 
!ff 
_contextff !
.ff! "
UsuarioDisciplinaff" 3
.ff3 4
Anyff4 7
(ff7 8
usrff8 ;
=>ff< >
usrff? B
.ffB C"
DisciplinaIdDisciplinaffC Y
==ffZ \

childModelff] g
.ffg h"
DisciplinaIdDisciplinaffh ~
&&	ff Å
usr
ffÇ Ö
.
ffÖ Ü

UsuarioCpf
ffÜ ê
==
ffë ì

childModel
ffî û
.
ffû ü

UsuarioCpf
ffü ©
)
ff© ™
&&
ff´ ≠

childModel
ffÆ ∏
.
ff∏ π$
DisciplinaIdDisciplina
ffπ œ
!=
ff– “
$num
ff” ‘
)
ff‘ ’
{gg 
UsuarioDisciplinahh )
usrDischh* 1
=hh2 3
_mapperhh4 ;
.hh; <
Maphh< ?
<hh? @
UsuarioDisciplinahh@ Q
>hhQ R
(hhR S

childModelhhS ]
)hh] ^
;hh^ _
existingParentii &
.ii& '
UsuarioDisciplinaii' 8
.ii8 9
Addii9 <
(ii< =
usrDiscii= D
)iiD E
;iiE F
}jj 
}kk 
}ll 
trymm 
{nn 
awaitoo 
_contextoo 
.oo 
SaveChangesAsyncoo /
(oo/ 0
)oo0 1
;oo1 2
}pp 
catchqq 
(qq (
DbUpdateConcurrencyExceptionqq /
)qq/ 0
{rr 
ifss 
(ss 
!ss 
DisciplinaExistsss %
(ss% &
idss& (
)ss( )
)ss) *
{tt 
returnuu 
NotFounduu #
(uu# $
newuu$ '
{uu( )
msguu* -
=uu. /
$struu0 Y
}uuZ [
)uu[ \
;uu\ ]
}vv 
elseww 
{xx 
throwyy 
;yy 
}zz 
}{{ 
return|| 

StatusCode|| 
(|| 
$num|| !
,||! "
new||# &
{||' (
msg||) ,
=||- .
$"||/ 1
Disciplina ||1 <
{||< =
existingParent||= K
.||K L
Materia||L S
}||S T!
 alterada com sucesso||T i
"||i j
}||k l
)||l m
;||m n
}}} 	
[
ÖÖ 	
HttpPost
ÖÖ	 
]
ÖÖ 
[
ÜÜ 	
Route
ÜÜ	 
(
ÜÜ 
$str
ÜÜ  
)
ÜÜ  !
]
ÜÜ! "
[
áá 	
	Authorize
áá	 
(
áá 
Roles
áá 
=
áá 
$str
áá *
)
áá* +
]
áá+ ,
[
àà 	
TokenEmailFilter
àà	 
]
àà 
public
ââ 
async
ââ 
Task
ââ 
<
ââ 
dynamic
ââ !
>
ââ! "
PostDisciplina
ââ# 1
(
ââ1 2
[
ââ2 3
FromBody
ââ3 ;
]
ââ; <!
DisciplinaViewModel
ââ= P
model
ââQ V
)
ââV W
{
ää 	
ICollection
ãã 
<
ãã 
UsuarioDisciplina
ãã )
>
ãã) *
usuarioDisciplina
ãã+ <
=
ãã= >
new
ãã? B
List
ããC G
<
ããG H
UsuarioDisciplina
ããH Y
>
ããY Z
(
ããZ [
)
ãã[ \
;
ãã\ ]
if
åå 
(
åå 
model
åå 
.
åå 
UsuarioDisciplina
åå '
!=
åå( *
null
åå+ /
)
åå/ 0
{
çç 
foreach
éé 
(
éé 
var
éé 
item
éé !
in
éé" $
model
éé% *
.
éé* +
UsuarioDisciplina
éé+ <
)
éé< =
{
èè 
usuarioDisciplina
êê %
.
êê% &
Add
êê& )
(
êê) *
_mapper
êê* 1
.
êê1 2
Map
êê2 5
<
êê5 6
UsuarioDisciplina
êê6 G
>
êêG H
(
êêH I
item
êêI M
)
êêM N
)
êêN O
;
êêO P
}
ëë 
}
íí 
_mapper
îî 
.
îî 
Map
îî 
<
îî 
ICollection
îî #
<
îî# $
UsuarioDisciplina
îî$ 5
>
îî5 6
>
îî6 7
(
îî7 8
model
îî8 =
.
îî= >
UsuarioDisciplina
îî> O
)
îîO P
;
îîP Q

Disciplina
ïï 

disciplina
ïï !
=
ïï" #
_mapper
ïï$ +
.
ïï+ ,
Map
ïï, /
<
ïï/ 0

Disciplina
ïï0 :
>
ïï: ;
(
ïï; <
model
ïï< A
)
ïïA B
;
ïïB C

disciplina
ññ 
.
ññ 
UsuarioDisciplina
ññ (
=
ññ) *
usuarioDisciplina
ññ+ <
;
ññ< =
_context
óó 
.
óó 

Disciplina
óó 
.
óó  
Add
óó  #
(
óó# $

disciplina
óó$ .
)
óó. /
;
óó/ 0
try
òò 
{
ôô 
await
öö 
_context
öö 
.
öö 
SaveChangesAsync
öö /
(
öö/ 0
)
öö0 1
;
öö1 2
}
õõ 
catch
úú 
(
úú 
DbUpdateException
úú $
)
úú$ %
{
ùù 
if
ûû 
(
ûû 
DisciplinaExists
ûû $
(
ûû$ %

disciplina
ûû% /
.
ûû/ 0
IdDisciplina
ûû0 <
)
ûû< =
)
ûû= >
{
üü 
return
†† 
Conflict
†† #
(
††# $
new
††$ '
{
††( )
message
††* 1
=
††2 3
$str
††4 O
}
††P Q
)
††Q R
;
††R S
}
°° 
else
¢¢ 
{
££ 
throw
§§ 
;
§§ 
}
•• 
}
¶¶ 
return
®® 
CreatedAtAction
®® "
(
®®" #
$str
®®# 2
,
®®2 3
new
®®4 7
{
®®8 9
id
®®: <
=
®®= >

disciplina
®®? I
.
®®I J
IdDisciplina
®®J V
}
®®W X
,
®®X Y

disciplina
®®Z d
)
®®d e
;
®®e f
}
©© 	
[
≠≠ 	
HttpPost
≠≠	 
]
≠≠ 
[
ÆÆ 	
Route
ÆÆ	 
(
ÆÆ 
$str
ÆÆ -
)
ÆÆ- .
]
ÆÆ. /
[
ØØ 	
	Authorize
ØØ	 
(
ØØ 
Roles
ØØ 
=
ØØ 
$str
ØØ *
)
ØØ* +
]
ØØ+ ,
[
∞∞ 	
TokenEmailFilter
∞∞	 
]
∞∞ 
public
±± 
async
±± 
Task
±± 
<
±± 
dynamic
±± !
>
±±! "
PostInserirAluno
±±# 3
(
±±3 4
[
±±4 5
FromBody
±±5 =
]
±±= >7
)UsuarioDisciplinaCreateAndUpdateViewModel
±±? h
model
±±i n
)
±±n o
{
≤≤ 	
UsuarioDisciplina
≥≥ 
usuarioDisciplina
≥≥ /
=
≥≥0 1
_mapper
≥≥2 9
.
≥≥9 :
Map
≥≥: =
<
≥≥= >
UsuarioDisciplina
≥≥> O
>
≥≥O P
(
≥≥P Q
model
≥≥Q V
)
≥≥V W
;
≥≥W X
_context
¥¥ 
.
¥¥ 
UsuarioDisciplina
¥¥ &
.
¥¥& '
Add
¥¥' *
(
¥¥* +
usuarioDisciplina
¥¥+ <
)
¥¥< =
;
¥¥= >
try
∂∂ 
{
∑∑ 
await
∏∏ 
_context
∏∏ 
.
∏∏ 
SaveChangesAsync
∏∏ /
(
∏∏/ 0
)
∏∏0 1
;
∏∏1 2
}
ππ 
catch
∫∫ 
(
∫∫ 
DbUpdateException
∫∫ $
)
∫∫$ %
{
ªª 
if
ºº 
(
ºº 
!
ºº 
DisciplinaExists
ºº %
(
ºº% &
usuarioDisciplina
ºº& 7
.
ºº7 8$
DisciplinaIdDisciplina
ºº8 N
)
ººN O
)
ººO P
{
ΩΩ 
return
ææ 
NotFound
ææ #
(
ææ# $
new
ææ$ '
{
ææ( )
msg
ææ* -
=
ææ. /
$str
ææ0 Y
}
ææZ [
)
ææ[ \
;
ææ\ ]
}
øø 
else
¿¿ 
{
¡¡ 
throw
¬¬ 
;
¬¬ 
}
√√ 
}
ƒƒ 
CreatedAtAction
∆∆ 
(
∆∆ 
$str
∆∆ +
,
∆∆+ ,
new
∆∆- 0
{
∆∆1 2
id
∆∆3 5
=
∆∆6 7
usuarioDisciplina
∆∆8 I
.
∆∆I J!
IdUsuarioDisciplina
∆∆J ]
}
∆∆^ _
,
∆∆_ `
usuarioDisciplina
∆∆a r
)
∆∆r s
;
∆∆s t
return
«« 

StatusCode
«« 
(
«« 
$num
«« !
,
««! "
new
««# &
{
««' (
msg
««) ,
=
««- .
$"
««/ 1
Cpf 
««1 5
{
««5 6
usuarioDisciplina
««6 G
.
««G H

UsuarioCpf
««H R
}
««R S%
 cadastrado com sucesso
««S j
"
««j k
}
««l m
)
««m n
;
««n o
}
»» 	
[
ÀÀ 	

HttpDelete
ÀÀ	 
(
ÀÀ 
$str
ÀÀ *
)
ÀÀ* +
]
ÀÀ+ ,
[
ÃÃ 	
	Authorize
ÃÃ	 
(
ÃÃ 
Roles
ÃÃ 
=
ÃÃ 
$str
ÃÃ *
)
ÃÃ* +
]
ÃÃ+ ,
public
ÕÕ 
async
ÕÕ 
Task
ÕÕ 
<
ÕÕ 
ActionResult
ÕÕ &
<
ÕÕ& '

Disciplina
ÕÕ' 1
>
ÕÕ1 2
>
ÕÕ2 3
DeleteDisciplina
ÕÕ4 D
(
ÕÕD E
int
ÕÕE H
id
ÕÕI K
)
ÕÕK L
{
ŒŒ 	
try
œœ 
{
–– 
var
—— 

disciplina
—— 
=
——  
await
——! &
_context
——' /
.
——/ 0

Disciplina
——0 :
.
——: ;
	FindAsync
——; D
(
——D E
id
——E G
)
——G H
;
——H I
if
““ 
(
““ 

disciplina
““ 
==
““ !
null
““" &
)
““& '
{
”” 
return
‘‘ 
NotFound
‘‘ #
(
‘‘# $
new
‘‘$ '
{
‘‘( )
msg
‘‘* -
=
‘‘. /
$str
‘‘0 Y
}
‘‘Z [
)
‘‘[ \
;
‘‘\ ]
}
’’ 
_context
◊◊ 
.
◊◊ 

Disciplina
◊◊ #
.
◊◊# $
Remove
◊◊$ *
(
◊◊* +

disciplina
◊◊+ 5
)
◊◊5 6
;
◊◊6 7
await
ÿÿ 
_context
ÿÿ 
.
ÿÿ 
SaveChangesAsync
ÿÿ /
(
ÿÿ/ 0
)
ÿÿ0 1
;
ÿÿ1 2
return
⁄⁄ 

disciplina
⁄⁄ !
;
⁄⁄! "
}
€€ 
catch
‹‹ 
(
‹‹ 
DbUpdateException
‹‹ $
)
‹‹$ %
{
›› 
return
ﬁﬁ 

BadRequest
ﬁﬁ !
(
ﬁﬁ! "
$str
ﬁﬁ" ^
)
ﬁﬁ^ _
;
ﬁﬁ_ `
}
ﬂﬂ 
}
‡‡ 	
private
‚‚ 
bool
‚‚ 
DisciplinaExists
‚‚ %
(
‚‚% &
int
‚‚& )
id
‚‚* ,
)
‚‚, -
{
„„ 	
return
‰‰ 
_context
‰‰ 
.
‰‰ 

Disciplina
‰‰ &
.
‰‰& '
Any
‰‰' *
(
‰‰* +
e
‰‰+ ,
=>
‰‰- /
e
‰‰0 1
.
‰‰1 2
IdDisciplina
‰‰2 >
==
‰‰? A
id
‰‰B D
)
‰‰D E
;
‰‰E F
}
ÂÂ 	
}
ÊÊ 
}ÁÁ æC
7C:\Repositorio\Backend\Controllers\EscolasController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
EscolasController "
:# $
ControllerBase% 3
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public 
EscolasController  
(  !
DatabaseContext! 0
context1 8
,8 9
IMapper: A
mapperB H
)H I
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
[!! 	
HttpGet!!	 
]!! 
["" 	
Route""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
Escola##' -
>##- .
>##. /
	GetEscola##0 9
(##9 :
string##: @
cnpj##A E
)##E F
{$$ 	
var%% 
escola%% 
=%% 
await%% 
_context%% '
.%%' (
Escola%%( .
.%%. /
Where%%/ 4
(%%4 5
us%%5 7
=>%%8 :
us%%; =
.%%= >
Cnpj%%> B
==%%C E
cnpj%%F J
)%%J K
.%%K L
Select&& 
(&& 
us&& 
=>&& 
new&&  
Escola&&! '
{'' 
Cnpj(( 
=(( 
us(( 
.(( 
Cnpj(( "
,((" #
Nome)) 
=)) 
us)) 
.)) 
Nome)) "
,))" #
Telefone** 
=** 
us** !
.**! "
Telefone**" *
}++ 
)++ 
.++ 
FirstOrDefaultAsync++ &
(++& '
)++' (
;++( )
if-- 
(-- 
escola-- 
==-- 
null-- 
)-- 
{.. 
return// 
NotFound// 
(//  
new//  #
{//$ %
msg//% (
=//) *
$str//+ B
}//B C
)//C D
;//D E
}00 
return22 
escola22 
;22 
}33 	
[:: 	
HttpPut::	 
(:: 
$str:: 
):: 
]:: 
[;; 	
	Authorize;;	 
(;; 
Roles;; 
=;; 
$str;;  
);;  !
];;! "
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
	PutEscola<<) 2
(<<2 3
string<<3 9
cnpj<<: >
,<<> ?
Escola<<@ F
escola<<G M
)<<M N
{== 	
if>> 
(>> 
cnpj>> 
!=>> 
escola>> 
.>> 
Cnpj>> #
)>># $
{?? 
return@@ 

BadRequest@@ !
(@@! "
)@@" #
;@@# $
}AA 
_contextCC 
.CC 
EntryCC 
(CC 
escolaCC !
)CC! "
.CC" #
StateCC# (
=CC) *
EntityStateCC+ 6
.CC6 7
ModifiedCC7 ?
;CC? @
tryEE 
{FF 
awaitGG 
_contextGG 
.GG 
SaveChangesAsyncGG /
(GG/ 0
)GG0 1
;GG1 2
}HH 
catchII 
(II (
DbUpdateConcurrencyExceptionII /
)II/ 0
{JJ 
ifKK 
(KK 
!KK 
EscolaExistsKK !
(KK! "
cnpjKK" &
)KK& '
)KK' (
{LL 
returnMM 
NotFoundMM #
(MM# $
newMM$ '
{MM( )
msgMM) ,
=MM- .
$strMM/ g
}MMh i
)MMi j
;MMj k
}NN 
elseOO 
{PP 
throwQQ 
;QQ 
}RR 
}SS 
returnUU 
	NoContentUU 
(UU 
)UU 
;UU 
}VV 	
[]] 	
HttpPost]]	 
]]] 
[^^ 	
	Authorize^^	 
(^^ 
Roles^^ 
=^^ 
$str^^  
)^^  !
]^^! "
public__ 
async__ 
Task__ 
<__ 
dynamic__ !
>__! "

PostEscola__# -
(__- .
[__. /
FromBody__/ 7
]__7 8
EscolaViewModel__9 H
model__I N
)__N O
{`` 	
Escolaaa 
escolaaa 
=aa 
_mapperaa #
.aa# $
Mapaa$ '
<aa' (
Escolaaa( .
>aa. /
(aa/ 0
modelaa0 5
)aa5 6
;aa6 7
_contextbb 
.bb 
Escolabb 
.bb 
Addbb 
(bb  
escolabb  &
)bb& '
;bb' (
trydd 
{ee 
awaitff 
_contextff 
.ff 
SaveChangesAsyncff /
(ff/ 0
)ff0 1
;ff1 2
}gg 
catchhh 
(hh 
DbUpdateExceptionhh $
)hh$ %
{ii 
ifjj 
(jj 
EscolaExistsjj  
(jj  !
escolajj! '
.jj' (
Cnpjjj( ,
)jj, -
)jj- .
{kk 
returnll 
Conflictll #
(ll# $
newll$ '
{ll( )
msgll* -
=ll. /
$strll0 L
}llM N
)llN O
;llO P
}mm 
elsenn 
{oo 
throwpp 
;pp 
}qq 
}rr 
CreatedAtActiontt 
(tt 
$strtt '
,tt' (
newtt) ,
{tt- .
idtt/ 1
=tt2 3
escolatt4 :
.tt: ;
Cnpjtt; ?
}tt@ A
,ttA B
escolattC I
)ttI J
;ttJ K
returnuu 

StatusCodeuu 
(uu 
$numuu !
,uu! "
newuu# &
{uu' (
msguu) ,
=uu- .
$"uu/ 1
Escola uu1 8
{uu8 9
escolauu9 ?
.uu? @
Nomeuu@ D
}uuD E#
 cadastrada com sucessouuE \
"uu\ ]
}uu^ _
)uu_ `
;uu` a
}vv 	
[}} 	

HttpDelete}}	 
(}} 
$str}} 
)}} 
]}} 
[~~ 	
	Authorize~~	 
(~~ 
Roles~~ 
=~~ 
$str~~  
)~~  !
]~~! "
public 
async 
Task 
< 
ActionResult &
<& '
Escola' -
>- .
>. /
DeleteEscola0 <
(< =
string= C
cnpjD H
)H I
{
ÄÄ 	
var
ÅÅ 
escola
ÅÅ 
=
ÅÅ 
await
ÅÅ 
_context
ÅÅ '
.
ÅÅ' (
Escola
ÅÅ( .
.
ÅÅ. /
	FindAsync
ÅÅ/ 8
(
ÅÅ8 9
cnpj
ÅÅ9 =
)
ÅÅ= >
;
ÅÅ> ?
if
ÇÇ 
(
ÇÇ 
escola
ÇÇ 
==
ÇÇ 
null
ÇÇ 
)
ÇÇ 
{
ÉÉ 
return
ÑÑ 
NotFound
ÑÑ 
(
ÑÑ  
)
ÑÑ  !
;
ÑÑ! "
}
ÖÖ 
_context
áá 
.
áá 
Escola
áá 
.
áá 
Remove
áá "
(
áá" #
escola
áá# )
)
áá) *
;
áá* +
await
àà 
_context
àà 
.
àà 
SaveChangesAsync
àà +
(
àà+ ,
)
àà, -
;
àà- .
return
ää 
escola
ää 
;
ää 
}
ãã 	
private
çç 
bool
çç 
EscolaExists
çç !
(
çç! "
string
çç" (
cnpj
çç) -
)
çç- .
{
éé 	
return
èè 
_context
èè 
.
èè 
Escola
èè "
.
èè" #
Any
èè# &
(
èè& '
e
èè' (
=>
èè) +
e
èè, -
.
èè- .
Cnpj
èè. 2
==
èè3 5
cnpj
èè6 :
)
èè: ;
;
èè; <
}
êê 	
}
ëë 
}íí ∫;
7C:\Repositorio\Backend\Controllers\RankingController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
RankingController "
:# $
ControllerBase% 3
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
public 
RankingController  
(  !
DatabaseContext! 0
context1 8
)8 9
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
( 
$str !
)! "
]" #
[ 	
	Authorize	 
] 
[ 	
TokenEmailFilter	 
] 
public 
async 
Task 
< &
RankingAtividadesViewModel 4
>4 5

GetRanking6 @
(@ A
[A B
	FromQueryB K
]K L
stringM S
emailT Y
,Y Z
intZ ]
IdDisciplina^ j
)j k
{ 	
var 
ranking 
= 
from 
usuarioDisciplina 0
in1 3
_context4 <
.< =
UsuarioDisciplina= N
join   
atividadeUsuario   /
in  0 2
_context  3 ;
.  ; <
AtividadeUsuario  < L
on!!  
usuarioDisciplina!!! 2
.!!2 3
IdUsuarioDisciplina!!3 F
equals!!G M
atividadeUsuario!!N ^
.!!^ _
IdUsuarioDisciplina!!_ r
into"" "
grouping""# +
from## 
atividadeUsuario## /
in##0 2
grouping##3 ;
.##; <
DefaultIfEmpty##< J
(##J K
)##K L
where$$ 
usuarioDisciplina$$  1
.$$1 2"
DisciplinaIdDisciplina$$2 H
==$$I K
IdDisciplina$$L X
group%% 
atividadeUsuario%%  0
by%%1 3
new%%4 7
{%%8 9
atividadeUsuario%%: J
.%%J K
IdUsuarioDisciplina%%K ^
,%%^ _
usuarioDisciplina%%` q
.%%q r!
UsuarioCpfNavigation	%%r Ü
.
%%Ü á
NomeSobrenome
%%á î
,
%%î ï
usuarioDisciplina
%%ñ ß
.
%%ß ®"
UsuarioCpfNavigation
%%® º
.
%%º Ω
Email
%%Ω ¬
}
%%√ ƒ
into
%%≈ …
groupby
%%  —
orderby&& !
groupby&&" )
.&&) *
Sum&&* -
(&&- .
gb&&. 0
=>&&1 3
gb&&4 6
.&&6 7
Total&&7 <
)&&< =

descending&&> H
select''  
new''! $
RankingViewModel''% 5
{(( 
IdUsuarioDisciplina)) 1
=))2 3
groupby))4 ;
.)); <
Key))< ?
.))? @
IdUsuarioDisciplina))@ S
,))S T
Email** #
=**$ %
groupby**& -
.**- .
Key**. 1
.**1 2
Email**2 7
,**7 8
Nome++ "
=++# $
groupby++% ,
.++, -
Key++- 0
.++0 1
NomeSobrenome++1 >
,++> ?
Total,, #
=,,$ %
groupby,,& -
.,,- .
Sum,,. 1
(,,1 2
gb,,2 4
=>,,5 7
gb,,8 :
.,,: ;
Total,,; @
),,@ A
}-- 
;-- 
var// 

atividades// 
=// 
await// "
_context//# +
.//+ ,
AtividadeUsuario//, <
.00 
Include00 
(00 
ativUser00 
=>00  
ativUser00! )
.00) *!
IdAtividadeNavigation00* ?
)00? @
.11 
Where11 
(11 
ativUser11 
=>11 
ativUser11 '
.11' ()
IdUsuarioDisciplinaNavigation11( E
.11E F"
DisciplinaIdDisciplina11F \
==11] _
IdDisciplina11` l
&&11m o
ativUser11p x
.11x y*
IdUsuarioDisciplinaNavigation	11y ñ
.
11ñ ó"
UsuarioCpfNavigation
11ó ´
.
11´ ¨
Email
11¨ ±
==
11≤ ¥
email
11µ ∫
)
11∫ ª
.22 
ToListAsync22 
(22 
)22 
;22 
List44 
<44 
PremiacaoViewModel44 #
>44# $

premiacoes44% /
=440 1
await442 7
_context448 @
.44@ A
AtividadeUsuario44A Q
.55 
Where55 
(55 
ativ55 
=>55 
ativ55 #
.55# $
Status55$ *
==55+ -
$str55. 9
&&55: <
ativ66 
.66 !
IdAtividadeNavigation66 2
.662 3
IdDisciplina663 ?
==66@ B
IdDisciplina66C O
&&66P R
ativ77 
.77 !
IdAtividadeNavigation77 2
.772 3
DataEntrega773 >
.77> ?
Month77? D
==77E G
DateTime77H P
.77P Q
Now77Q T
.77T U
Month77U Z
&&77[ ]
ativ88 
.88 !
IdAtividadeNavigation88 2
.882 3
DataEntrega883 >
.88> ?
Year88? C
==88D F
DateTime88G O
.88O P
Now88P S
.88S T
Year88T X
&&88Y [
ativ99 
.99 !
IdAtividadeNavigation99 2
.992 3
	Premiacao993 <
!=99= ?
null99@ D
):: 
.;; 
Include;; 
(;; 
ativ;; 
=>;;  
ativ;;! %
.;;% &)
IdUsuarioDisciplinaNavigation;;& C
);;C D
.<< 
ThenInclude<<  
(<<  !
ativ<<! %
=><<& (
ativ<<) -
.<<- . 
UsuarioCpfNavigation<<. B
)<<B C
.== 
Include== 
(== 
ativ== 
=>==  
ativ==! %
.==% &!
IdAtividadeNavigation==& ;
)==; <
.>> 
Select>> 
(>> 
ativ>> 
=>>> 
new>>  #
PremiacaoViewModel>>$ 6
{?? 
IdAtividadeUsuario@@ &
=@@' (
ativ@@) -
.@@- .
IdAtividadeUsuario@@. @
,@@@ A
AlunoAA 
=AA 
ativAA  
.AA  !)
IdUsuarioDisciplinaNavigationAA! >
.AA> ? 
UsuarioCpfNavigationAA? S
.AAS T
NomeSobrenomeAAT a
,AAa b
	PremiacaoBB 
=BB 
ativBB  $
.BB$ %!
IdAtividadeNavigationBB% :
.BB: ;
	PremiacaoBB; D
}CC 
)CC 
.DD 
ToListAsyncDD 
(DD 
)DD 
.DD 
ConfigureAwaitDD -
(DD- .
trueDD. 2
)DD2 3
;DD3 4
returnFF 
newFF &
RankingAtividadesViewModelFF 1
{GG 
RankingHH 
=HH 
rankingHH !
.HH! "
ToListHH" (
(HH( )
)HH) *
,HH* +

AtividadesII 
=II 

atividadesII '
,II' (

PremiacoesJJ 
=JJ 

premiacoesJJ '
}KK 
;KK 
}MM 	
}NN 
}OO √Ì
8C:\Repositorio\Backend\Controllers\UsuariosController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
ApiController 
] 
public 

class 
UsuariosController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public 
UsuariosController !
(! "
DatabaseContext" 1
context2 9
,9 :
IMapper: A
mapperB H
)I J
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
( 
$str %
)% &
]& '
[ 	
	Authorize	 
( 
Roles 
= 
$str  
)  !
]! "
public 
async 
Task 
< 
ActionResult &
<& '
object' -
>- .
>. /

GetUsuario0 :
(: ;
); <
{   	
var!! 
usuario!! 
=!! 
await!! 
_context!!  (
.!!( )
Usuario!!) 0
."" 
Select"" 
("" 
us"" 
=>"" 
new"" !
{## 
Cpf$$ 
=$$ 
us$$ 
.$$ 
Cpf$$  
,$$  !
Email%% 
=%% 
us%% 
.%% 
Email%% $
,%%$ %
TipoUsuario&& 
=&&  !
us&&" $
.&&$ %
TipoUsuario&&% 0
,&&0 1
DataNascimento'' "
=''# $
us''% '
.''' (
DataNascimento''( 6
,''6 7
NomeSobrenome(( !
=((" #
us(($ &
.((& '
NomeSobrenome((' 4
,((4 5
Telefone)) 
=)) 
us)) !
.))! "
Telefone))" *
,))* +
Escola** 
=** 
us** 
.**   
EscolaCnpjNavigation**  4
.**4 5
Nome**5 9
}++ 
)++ 
.++ 
ToListAsync++ 
(++ 
)++  
;++  !
if-- 
(-- 
usuario-- 
==-- 
null-- 
)--  
{.. 
return// 
NotFound// 
(//  
new//  #
{//$ %
msg//& )
=//* +
$str//, P
}//Q R
)//R S
;//S T
}00 
return22 
usuario22 
;22 
}33 	
[99 	
HttpGet99	 
(99 
$str99 
)99  
]99  !
[:: 	
	Authorize::	 
]:: 
[;; 	
TokenEmailFilter;;	 
];; 
public<< 
async<< 
Task<< 
<<< 
ActionResult<< &
<<<& '
object<<' -
><<- .
><<. /

GetUsuario<<0 :
(<<: ;
[<<; <
	FromQuery<<< E
]<<E F
string<<G M
email<<N S
)<<S T
{== 	
var>> 
usuario>> 
=>> 
await>> 
_context>>  (
.>>( )
Usuario>>) 0
.?? 
Where?? 
(?? 
us?? 
=>?? 
us?? 
.??  
Email??  %
==??& (
email??) .
)??. /
.@@ 
Select@@ 
(@@ 
us@@ 
=>@@ 
new@@ !
{AA 
CpfBB 
=BB 
usBB 
.BB 
CpfBB  
,BB  !
EmailCC 
=CC 
usCC 
.CC 
EmailCC $
,CC$ %
TipoUsuarioDD 
=DD  !
usDD" $
.DD$ %
TipoUsuarioDD% 0
,DD0 1
DataNascimentoEE "
=EE# $
usEE% '
.EE' (
DataNascimentoEE( 6
,EE6 7
NomeSobrenomeFF !
=FF" #
usFF$ &
.FF& '
NomeSobrenomeFF' 4
,FF4 5
TelefoneGG 
=GG 
usGG !
.GG! "
TelefoneGG" *
,GG* +
EscolaHH 
=HH 
usHH 
.HH   
EscolaCnpjNavigationHH  4
.HH4 5
NomeHH5 9
}II 
)II 
.II 
FirstOrDefaultAsyncII &
(II& '
)II' (
;II( )
ifKK 
(KK 
usuarioKK 
==KK 
nullKK 
)KK  
{LL 
returnMM 
NotFoundMM 
(MM  
newMM  #
{MM$ %
msgMM& )
=MM* +
$strMM, P
}MMQ R
)MMR S
;MMS T
}NN 
returnPP 
usuarioPP 
;PP 
}QQ 	
[YY 	
HttpGetYY	 
(YY 
$strYY 0
)YY0 1
]YY1 2
[ZZ 	
	AuthorizeZZ	 
]ZZ 
public[[ 
async[[ 
Task[[ 
<[[ 
ActionResult[[ &
<[[& '
object[[' -
>[[- .
>[[. /
GetUsuarioNome[[0 >
([[> ?
string[[? E
nomeSobrenome[[F S
)[[S T
{\\ 	
nomeSobrenome^^ 
=^^ 
nomeSobrenome^^ '
.^^' (
ToUpper^^( /
(^^/ 0
)^^0 1
;^^1 2
List__ 
<__ 
Usuario__ 
>__ 
usuario__ "
=__# $
_context__& .
.__. /
Usuario__/ 6
.__6 7
Where__7 <
(__< =
usr__= @
=>__A C
usr__D G
.__G H
NomeSobrenome__H U
.__U V
ToUpper__V ]
(__] ^
)__^ _
.___ `
Contains__` h
(__h i
nomeSobrenome__i v
.__v w
ToUpper__w ~
(__~ 
)	__ Ä
)
__Ä Å
)
__Å Ç
.
__Ç É
Select
__É â
(
__â ä
us
__ä å
=>
__ç è
new
__ê ì
Usuario
__î õ
{`` 
Cpfaa 
=aa 
usaa 
.aa 
Cpfaa 
,aa 
Emailbb 
=bb 
usbb 
.bb 
Emailbb  
,bb  !
TipoUsuariocc 
=cc 
uscc  
.cc  !
TipoUsuariocc! ,
,cc, -
DataNascimentodd 
=dd  
usdd! #
.dd# $
DataNascimentodd$ 2
,dd2 3
NomeSobrenomeee 
=ee 
usee  "
.ee" #
NomeSobrenomeee# 0
,ee0 1
Telefoneff 
=ff 
usff 
.ff 
Telefoneff &
,ff& '

EscolaCnpjgg 
=gg 
usgg 
.gg  

EscolaCnpjgg  *
}hh 
)hh 
.hh 
ToListhh 
(hh 
)hh 
;hh 
ifjj 
(jj 
usuariojj 
==jj 
nulljj 
)jj  
{kk 
returnll 
NotFoundll 
(ll  
newll  #
{ll$ %
msgll& )
=ll* +
$strll, P
}llQ R
)llR S
;llS T
}mm 
returnoo 
usuariooo 
;oo 
}pp 	
[ww 	
HttpPutww	 
(ww 
$strww  
)ww  !
]ww! "
[xx 	
	Authorizexx	 
]xx 
publicyy 
asyncyy 
Taskyy 
<yy 
IActionResultyy '
>yy' (

PutUsuarioyy) 3
(yy3 4
UsuarioViewModelyy4 D
usuarioViewModelyyE U
)yyU V
{zz 	
Usuario{{ 
usuario{{ 
={{ 
_mapper{{ %
.{{% &
Map{{& )
<{{) *
Usuario{{* 1
>{{1 2
({{2 3
usuarioViewModel{{3 C
){{C D
;{{D E
_context}} 
.}} 
Entry}} 
(}} 
usuario}} "
)}}" #
.}}# $
State}}$ )
=}}* +
EntityState}}, 7
.}}7 8
Modified}}8 @
;}}@ A
_context~~ 
.~~ 
Entry~~ 
(~~ 
usuario~~ "
)~~" #
.~~# $
Property~~$ ,
(~~, -
x~~- .
=>~~/ 1
x~~2 3
.~~3 4
Senha~~4 9
)~~9 :
.~~: ;

IsModified~~; E
=~~F G
false~~H M
;~~M N
_context 
. 
Entry 
( 
usuario "
)" #
.# $
Property$ ,
(, -
x- .
=>/ 1
x2 3
.3 4
Cpf4 7
)7 8
.8 9

IsModified9 C
=D E
falseF K
;K L
_context
ÄÄ 
.
ÄÄ 
Entry
ÄÄ 
(
ÄÄ 
usuario
ÄÄ "
)
ÄÄ" #
.
ÄÄ# $
Property
ÄÄ$ ,
(
ÄÄ, -
x
ÄÄ- .
=>
ÄÄ/ 1
x
ÄÄ2 3
.
ÄÄ3 4

EscolaCnpj
ÄÄ4 >
)
ÄÄ> ?
.
ÄÄ? @

IsModified
ÄÄ@ J
=
ÄÄK L
false
ÄÄM R
;
ÄÄR S
try
ÇÇ 
{
ÉÉ 
await
ÑÑ 
_context
ÑÑ 
.
ÑÑ 
SaveChangesAsync
ÑÑ /
(
ÑÑ/ 0
)
ÑÑ0 1
;
ÑÑ1 2
}
ÖÖ 
catch
ÜÜ 
(
ÜÜ *
DbUpdateConcurrencyException
ÜÜ /
)
ÜÜ/ 0
{
áá 
if
àà 
(
àà 
!
àà 
UsuarioExists
àà "
(
àà" #
usuarioViewModel
àà# 3
.
àà3 4
Email
àà4 9
)
àà9 :
)
àà: ;
{
ââ 
return
ää 
NotFound
ää #
(
ää# $
new
ää$ '
{
ää( )
msg
ää) ,
=
ää- .
$str
ää/ S
}
ääT U
)
ääU V
;
ääV W
}
ãã 
else
åå 
{
çç 
throw
éé 
;
éé 
}
èè 
}
êê 
catch
ëë 
(
ëë 
DbUpdateException
ëë #
ex
ëë$ &
)
ëë& '
{
íí 
if
ìì 
(
ìì 
UsuarioExists
ìì !
(
ìì! "
usuario
ìì" )
.
ìì) *
Cpf
ìì* -
,
ìì- .
usuario
ìì/ 6
.
ìì6 7
Email
ìì7 <
)
ìì< =
)
ìì= >
{
îî 
return
ïï 
Conflict
ïï #
(
ïï# $
new
ïï$ '
{
ïï( )
msg
ïï* -
=
ïï. /
$str
ïï0 T
}
ïïU V
)
ïïV W
;
ïïW X
}
ññ 
else
óó 
{
òò 
throw
ôô 
;
ôô 
}
öö 
}
úú 
return
ûû 

StatusCode
ûû 
(
ûû 
$num
ûû !
,
ûû! "
new
ûû" %
{
ûû& '
msg
ûû' *
=
ûû+ ,
$"
ûû- /
	Usu√°rio 
ûû/ 7
{
ûû7 8
usuario
ûû8 ?
.
ûû? @
NomeSobrenome
ûû@ M
}
ûûM N#
 alterado com sucesso
ûûN c
"
ûûc d
}
ûûe f
)
ûûf g
;
ûûg h
}
üü 	
[
°° 	
HttpPut
°°	 
(
°° 
$str
°° ,
)
°°, -
]
°°- .
[
¢¢ 	
	Authorize
¢¢	 
(
¢¢ 
Roles
¢¢ 
=
¢¢ 
$str
¢¢  
)
¢¢  !
]
¢¢! "
public
££ 
async
££ 
Task
££ 
<
££ 
IActionResult
££ '
>
££' (
PutCargoUsuario
££) 8
(
££8 9
string
££9 ?
cpf
££@ C
,
££C D
Usuario
££E L
usuario
££M T
)
££T U
{
§§ 	
_context
¶¶ 
.
¶¶ 
Entry
¶¶ 
(
¶¶ 
usuario
¶¶ &
)
¶¶& '
.
¶¶' (
State
¶¶( -
=
¶¶. /
EntityState
¶¶0 ;
.
¶¶; <
Modified
¶¶< D
;
¶¶D E
_context
ßß 
.
ßß 
Entry
ßß 
(
ßß 
usuario
ßß &
)
ßß& '
.
ßß' (
Property
ßß( 0
(
ßß0 1
x
ßß1 2
=>
ßß3 5
x
ßß6 7
.
ßß7 8
Cpf
ßß8 ;
)
ßß; <
.
ßß< =

IsModified
ßß= G
=
ßßH I
false
ßßJ O
;
ßßO P
_context
®® 
.
®® 
Entry
®® 
(
®® 
usuario
®® &
)
®®& '
.
®®' (
Property
®®( 0
(
®®0 1
x
®®1 2
=>
®®3 5
x
®®6 7
.
®®7 8
DataNascimento
®®8 F
)
®®F G
.
®®G H

IsModified
®®H R
=
®®S T
false
®®U Z
;
®®Z [
_context
©© 
.
©© 
Entry
©© 
(
©© 
usuario
©© &
)
©©& '
.
©©' (
Property
©©( 0
(
©©0 1
x
©©1 2
=>
©©3 5
x
©©6 7
.
©©7 8
Email
©©8 =
)
©©= >
.
©©> ?

IsModified
©©? I
=
©©J K
false
©©L Q
;
©©Q R
_context
™™ 
.
™™ 
Entry
™™ 
(
™™ 
usuario
™™ &
)
™™& '
.
™™' (
Property
™™( 0
(
™™0 1
x
™™1 2
=>
™™3 5
x
™™6 7
.
™™7 8

EscolaCnpj
™™8 B
)
™™B C
.
™™C D

IsModified
™™D N
=
™™O P
false
™™Q V
;
™™V W
_context
´´ 
.
´´ 
Entry
´´ 
(
´´ 
usuario
´´ &
)
´´& '
.
´´' (
Property
´´( 0
(
´´0 1
x
´´1 2
=>
´´3 5
x
´´6 7
.
´´7 8
NomeSobrenome
´´8 E
)
´´E F
.
´´F G

IsModified
´´G Q
=
´´R S
false
´´T Y
;
´´Y Z
_context
¨¨ 
.
¨¨ 
Entry
¨¨ 
(
¨¨ 
usuario
¨¨ &
)
¨¨& '
.
¨¨' (
Property
¨¨( 0
(
¨¨0 1
x
¨¨1 2
=>
¨¨3 5
x
¨¨6 7
.
¨¨7 8
Senha
¨¨8 =
)
¨¨= >
.
¨¨> ?

IsModified
¨¨? I
=
¨¨J K
false
¨¨L Q
;
¨¨Q R
_context
≠≠ 
.
≠≠ 
Entry
≠≠ 
(
≠≠ 
usuario
≠≠ &
)
≠≠& '
.
≠≠' (
Property
≠≠( 0
(
≠≠0 1
x
≠≠1 2
=>
≠≠3 5
x
≠≠6 7
.
≠≠7 8
Telefone
≠≠8 @
)
≠≠@ A
.
≠≠A B

IsModified
≠≠B L
=
≠≠M N
false
≠≠O T
;
≠≠T U
_context
ÆÆ 
.
ÆÆ 
Entry
ÆÆ 
(
ÆÆ 
usuario
ÆÆ &
)
ÆÆ& '
.
ÆÆ' (
Property
ÆÆ( 0
(
ÆÆ0 1
x
ÆÆ1 2
=>
ÆÆ3 5
x
ÆÆ6 7
.
ÆÆ7 8
TipoUsuario
ÆÆ8 C
)
ÆÆC D
.
ÆÆD E

IsModified
ÆÆE O
=
ÆÆP Q
true
ÆÆR V
;
ÆÆV W
try
∞∞ 
{
±± 
await
≤≤ 
_context
≤≤ 
.
≤≤ 
SaveChangesAsync
≤≤ /
(
≤≤/ 0
)
≤≤0 1
;
≤≤1 2
}
≥≥ 
catch
¥¥ 
(
¥¥ 
DbUpdateException
¥¥ $
ex
¥¥% '
)
¥¥' (
{
µµ 
if
∂∂ 
(
∂∂ 
!
∂∂ 
UsuarioExists
∂∂ "
(
∂∂" #
cpf
∂∂# &
)
∂∂& '
)
∂∂' (
{
∑∑ 
return
∏∏ 
Conflict
∏∏ #
(
∏∏# $
new
∏∏$ '
{
∏∏( )
msg
∏∏* -
=
∏∏. /
$str
∏∏0 ]
}
∏∏^ _
)
∏∏_ `
;
∏∏` a
}
ππ 
else
∫∫ 
{
ªª 
throw
ºº 
;
ºº 
}
ΩΩ 
}
øø 
return
¡¡ 

StatusCode
¡¡ 
(
¡¡ 
$num
¡¡ !
,
¡¡! "
new
¡¡# &
{
¡¡' (
msg
¡¡) ,
=
¡¡- .
$"
¡¡/ 1 
Cargo do usu√°rio 
¡¡1 B
{
¡¡B C
usuario
¡¡C J
.
¡¡J K
NomeSobrenome
¡¡K X
}
¡¡X Y#
 alterado com sucesso
¡¡Y n
"
¡¡n o
}
¡¡p q
)
¡¡q r
;
¡¡r s
}
¬¬ 	
[
ƒƒ 	
HttpGet
ƒƒ	 
]
ƒƒ 
[
≈≈ 	
	Authorize
≈≈	 
]
≈≈ 
[
∆∆ 	
Route
∆∆	 
(
∆∆ 
$str
∆∆ 
)
∆∆ 
]
∆∆ 
public
«« 
async
«« 
Task
«« 
<
«« 
ActionResult
«« &
<
««& '
List
««' +
<
««+ ,
Usuario
««, 3
>
««3 4
>
««4 5
>
««5 6
	getAlunos
««7 @
(
««@ A
)
««A B
{
««B C
return
»» 
await
»» 
_context
»» !
.
»»! "
Usuario
»»" )
.
…… 
Where
…… 
(
…… 
usr
…… 
=>
…… 
usr
…… 
.
…… 
TipoUsuario
…… )
==
……) +
TipoUsuarioEnum
……, ;
.
……; <
Aluno
……< A
)
……A B
.
   
Select
   
(
   
usr
   
=>
   
new
   
Usuario
   &
{
  & '
Cpf
ÀÀ 
=
ÀÀ 
usr
ÀÀ 
.
ÀÀ 
Cpf
ÀÀ 
,
ÀÀ 
NomeSobrenome
ÃÃ 
=
ÃÃ 
usr
ÃÃ  #
.
ÃÃ# $
NomeSobrenome
ÃÃ$ 1
,
ÃÃ1 2
TipoUsuario
ÕÕ 
=
ÕÕ 
usr
ÕÕ !
.
ÕÕ! "
TipoUsuario
ÕÕ" -
}
ŒŒ 
)
ŒŒ 
.
œœ 
ToListAsync
œœ 
(
œœ 
)
œœ 
;
œœ 
}
–– 	
[
““ 	
HttpGet
““	 
]
““ 
[
”” 	
	Authorize
””	 
]
”” 
[
‘‘ 	
Route
‘‘	 
(
‘‘ 
$str
‘‘  
)
‘‘  !
]
‘‘! "
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
ActionResult
’’ &
<
’’& '
List
’’' +
<
’’+ ,
Usuario
’’, 3
>
’’3 4
>
’’4 5
>
’’5 6
getProfessores
’’7 E
(
’’E F
)
’’F G
{
’’G H
return
÷÷ 
await
÷÷ 
_context
÷÷ !
.
÷÷! "
Usuario
÷÷" )
.
÷÷) *
Where
÷÷* /
(
÷÷/ 0
usr
÷÷0 3
=>
÷÷4 6
usr
÷÷7 :
.
÷÷: ;
TipoUsuario
÷÷; F
==
÷÷F H
TipoUsuarioEnum
÷÷I X
.
÷÷X Y
	Professor
÷÷Y b
)
÷÷b c
.
÷÷c d
Select
÷÷d j
(
÷÷j k
usr
÷÷k n
=>
÷÷o q
new
÷÷r u
Usuario
÷÷v }
{
÷÷} ~
Cpf
◊◊ 
=
◊◊ 
usr
◊◊ 
.
◊◊ 
Cpf
◊◊ 
,
◊◊ 
NomeSobrenome
ÿÿ 
=
ÿÿ 
usr
ÿÿ  #
.
ÿÿ# $
NomeSobrenome
ÿÿ$ 1
,
ÿÿ1 2
TipoUsuario
ŸŸ 
=
ŸŸ 
usr
ŸŸ !
.
ŸŸ! "
TipoUsuario
ŸŸ" -
}
⁄⁄ 
)
⁄⁄ 
.
⁄⁄ 
ToListAsync
⁄⁄ 
(
⁄⁄ 
)
⁄⁄ 
;
⁄⁄ 
}
€€ 	
[
‚‚ 	
HttpPost
‚‚	 
]
‚‚ 
[
„„ 	
AllowAnonymous
„„	 
]
„„ 
[
‰‰ 	
Route
‰‰	 
(
‰‰ 
$str
‰‰ 
)
‰‰ 
]
‰‰ 
public
ÂÂ 
async
ÂÂ 
Task
ÂÂ 
<
ÂÂ 
dynamic
ÂÂ !
>
ÂÂ! "
PostUsuario
ÂÂ# .
(
ÂÂ. /
[
ÂÂ/ 0
FromBody
ÂÂ0 8
]
ÂÂ8 9
UsuarioViewModel
ÂÂ: J
usuarioViewModel
ÂÂK [
)
ÂÂ[ \
{
ÊÊ 	
usuarioViewModel
ÁÁ 
.
ÁÁ 
Cpf
ÁÁ  
=
ÁÁ! "
usuarioViewModel
ÁÁ# 3
.
ÁÁ3 4
Cpf
ÁÁ4 7
.
ÁÁ7 8
Replace
ÁÁ8 ?
(
ÁÁ? @
$str
ÁÁ@ C
,
ÁÁC D
$str
ÁÁE G
)
ÁÁG H
.
ÁÁH I
Replace
ÁÁI P
(
ÁÁP Q
$str
ÁÁQ T
,
ÁÁT U
$str
ÁÁU W
)
ÁÁW X
;
ÁÁX Y
Usuario
ËË 
usuario
ËË 
=
ËË 
_mapper
ËË %
.
ËË% &
Map
ËË& )
<
ËË) *
Usuario
ËË* 1
>
ËË1 2
(
ËË2 3
usuarioViewModel
ËË3 C
)
ËËC D
;
ËËD E
_context
ÈÈ 
.
ÈÈ 
Usuario
ÈÈ 
.
ÈÈ 
Add
ÈÈ  
(
ÈÈ  !
usuario
ÈÈ! (
)
ÈÈ( )
;
ÈÈ) *
try
ÍÍ 
{
ÎÎ 
await
ÏÏ 
_context
ÏÏ 
.
ÏÏ 
SaveChangesAsync
ÏÏ /
(
ÏÏ/ 0
)
ÏÏ0 1
;
ÏÏ1 2
}
ÌÌ 
catch
ÓÓ 
(
ÓÓ 
DbUpdateException
ÓÓ $
)
ÓÓ$ %
{
ÔÔ 
if
 
(
 
UsuarioExists
 !
(
! "
usuario
" )
.
) *
Cpf
* -
,
- .
usuario
. 5
.
5 6
Email
6 ;
)
; <
)
< =
{
ÒÒ 
return
ÚÚ 
Conflict
ÚÚ #
(
ÚÚ# $
new
ÚÚ$ '
{
ÚÚ( )
msg
ÚÚ) ,
=
ÚÚ, -
$str
ÚÚ. R
}
ÚÚS T
)
ÚÚT U
;
ÚÚU V
}
ÛÛ 
else
ÙÙ 
{
ıı 
throw
ˆˆ 
;
ˆˆ 
}
˜˜ 
}
¯¯ 
return
˘˘ 
GetUserLogged
˘˘  
(
˘˘  !
usuario
˘˘! (
)
˘˘( )
;
˘˘) *
}
˙˙ 	
private
¸¸ 
object
¸¸ 
GetUserLogged
¸¸ $
(
¸¸$ %
Usuario
¸¸% ,
usuario
¸¸- 4
)
¸¸4 5
{
˝˝ 	
string
˛˛ 
token
˛˛ 
=
˛˛ 
TokenService
˛˛ '
.
˛˛' (
GenerateToken
˛˛( 5
(
˛˛5 6
usuario
˛˛6 =
)
˛˛= >
;
˛˛> ?
usuario
ˇˇ 
.
ˇˇ 
Senha
ˇˇ 
=
ˇˇ 
$str
ˇˇ 
;
ˇˇ 
return
ÄÄ 
new
ÄÄ 
{
ÅÅ 
Usuario
ÇÇ 
=
ÇÇ 
usuario
ÇÇ !
,
ÇÇ! "
token
ÉÉ 
=
ÉÉ 
token
ÉÉ 
}
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
[
çç 	
HttpPost
çç	 
]
çç 
[
éé 	
AllowAnonymous
éé	 
]
éé 
[
èè 	
Route
èè	 
(
èè 
$str
èè 
)
èè 
]
èè 
public
êê 
async
êê 
Task
êê 
<
êê 
dynamic
êê !
>
êê! "
Login
êê# (
(
êê( )
[
êê) *
FromBody
êê* 2
]
êê2 3#
UsuarioLoginViewModel
êê3 H
model
êêI N
)
êêN O
{
ëë 	
Usuario
íí 
usuario
íí 
=
íí 
await
íí #
_context
íí$ ,
.
íí, -
Usuario
íí- 4
.
íí4 5
Where
íí5 :
(
íí: ;
usr
íí; >
=>
íí? A
usr
ííB E
.
ííE F
Email
ííF K
==
ííL N
model
ííO T
.
ííT U
Email
ííU Z
&&
íí[ ]
usr
íí^ a
.
íía b
Senha
ííb g
==
ííh j
model
íík p
.
ííp q
Senha
ííq v
)
íív w
.
ííw x"
FirstOrDefaultAsyncííx ã
(ííã å
)ííå ç
;ííç é
if
îî 
(
îî 
usuario
îî 
==
îî 
null
îî 
)
îî  
{
ïï 
return
ññ 
NotFound
ññ 
(
ññ  
new
ññ  #
{
ññ$ %
message
ññ& -
=
ññ. /
$str
ññ0 L
}
ññM N
)
ññN O
;
ññO P
}
óó 
return
òò 
GetUserLogged
òò  
(
òò  !
usuario
òò! (
)
òò( )
;
òò) *
}
ôô 	
[
°° 	

HttpDelete
°°	 
(
°° 
$str
°° #
)
°°# $
]
°°$ %
[
¢¢ 	
	Authorize
¢¢	 
]
¢¢ 
[
££ 	
TokenEmailFilter
££	 
]
££ 
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
ActionResult
§§ &
<
§§& '
Usuario
§§' .
>
§§. /
>
§§/ 0
DeleteUsuario
§§1 >
(
§§> ?
string
§§? E
email
§§F K
)
§§K L
{
•• 	
var
¶¶ 
usuario
¶¶ 
=
¶¶ 
await
¶¶ 
_context
¶¶  (
.
¶¶( )
Usuario
¶¶) 0
.
¶¶0 1
Where
¶¶1 6
(
¶¶6 7
usr
¶¶7 :
=>
¶¶; =
usr
¶¶> A
.
¶¶A B
Email
¶¶B G
==
¶¶H J
email
¶¶K P
)
¶¶P Q
.
¶¶Q R!
FirstOrDefaultAsync
¶¶R e
(
¶¶e f
)
¶¶f g
;
¶¶g h
if
ßß 
(
ßß 
usuario
ßß 
==
ßß 
null
ßß 
)
ßß  
{
®® 
return
©© 
NotFound
©© 
(
©©  
new
©©  #
{
©©$ %
msg
©©& )
=
©©* +
$str
©©, P
}
©©Q R
)
©©R S
;
©©S T
}
™™ 
_context
¨¨ 
.
¨¨ 
Usuario
¨¨ 
.
¨¨ 
Remove
¨¨ #
(
¨¨# $
usuario
¨¨$ +
)
¨¨+ ,
;
¨¨, -
await
≠≠ 
_context
≠≠ 
.
≠≠ 
SaveChangesAsync
≠≠ +
(
≠≠+ ,
)
≠≠, -
;
≠≠- .
return
ØØ 
usuario
ØØ 
;
ØØ 
}
∞∞ 	
private
≤≤ 
bool
≤≤ 
UsuarioExists
≤≤ "
(
≤≤" #
string
≤≤# )
id
≤≤* ,
,
≤≤, -
string
≤≤- 3
email
≤≤4 9
)
≤≤9 :
{
≥≥ 	
return
¥¥ 
_context
¥¥ 
.
¥¥ 
Usuario
¥¥ #
.
¥¥# $
Any
¥¥$ '
(
¥¥' (
e
¥¥( )
=>
¥¥* ,
e
¥¥- .
.
¥¥. /
Cpf
¥¥/ 2
==
¥¥3 5
id
¥¥6 8
||
¥¥9 ;
e
¥¥< =
.
¥¥= >
Email
¥¥> C
==
¥¥D F
email
¥¥G L
)
¥¥L M
;
¥¥M N
}
µµ 	
private
∂∂ 
bool
∂∂ 
UsuarioExists
∂∂ "
(
∂∂" #
string
∂∂# )
email
∂∂* /
)
∂∂/ 0
{
∑∑ 	
return
∏∏ 
_context
∏∏ 
.
∏∏ 
Usuario
∏∏ #
.
∏∏# $
Any
∏∏$ '
(
∏∏' (
e
∏∏( )
=>
∏∏* ,
e
∏∏- .
.
∏∏. /
Email
∏∏/ 4
==
∏∏5 7
email
∏∏8 =
)
∏∏= >
;
∏∏> ?
}
ππ 	
[
øø 	
HttpPost
øø	 
(
øø 
$str
øø '
)
øø' (
]
øø( )
[
¿¿ 	
	Authorize
¿¿	 
]
¿¿ 
[
¡¡ 	
TokenEmailFilter
¡¡	 
]
¡¡ 
public
¬¬ 
async
¬¬ 
Task
¬¬ 
<
¬¬ 
IActionResult
¬¬ '
>
¬¬' (
AlterarSenha
¬¬) 5
(
¬¬5 6*
UsuarioAlterarSenhaViewModel
¬¬6 R
usuario
¬¬S Z
,
¬¬[ \
[
¬¬\ ]
	FromQuery
¬¬] f
]
¬¬f g
string
¬¬g m
email
¬¬n s
)
¬¬s t
{
√√ 	
Usuario
≈≈ 
user
≈≈ 
=
≈≈ 
_context
≈≈ #
.
≈≈# $
Usuario
≈≈$ +
.
≈≈+ ,
Where
≈≈, 1
(
≈≈1 2
usr
≈≈2 5
=>
≈≈6 8
usr
≈≈9 <
.
≈≈< =
Email
≈≈= B
==
≈≈C E
email
≈≈F K
)
≈≈K L
.
≈≈L M
FirstOrDefault
≈≈M [
(
≈≈[ \
)
≈≈\ ]
;
≈≈] ^
if
«« 
(
«« 
usuario
«« 
.
«« 
Senha
«« 
==
««  
user
««! %
.
««% &
Senha
««& +
)
««+ ,
{
»» 
return
…… 

BadRequest
…… !
(
……! "
new
……" %
{
……& '
msg
……( +
=
……, -
$str
……. `
}
……a b
)
……b c
;
……c d
}
   
try
ÀÀ 
{
ÃÃ 
user
ÕÕ 
.
ÕÕ 
Senha
ÕÕ 
=
ÕÕ 
usuario
ÕÕ $
.
ÕÕ$ %
Senha
ÕÕ% *
;
ÕÕ* +
await
ŒŒ 
_context
ŒŒ 
.
ŒŒ 
SaveChangesAsync
ŒŒ /
(
ŒŒ/ 0
)
ŒŒ0 1
;
ŒŒ1 2
}
œœ 
catch
–– 
(
–– *
DbUpdateConcurrencyException
–– /
)
––/ 0
{
—— 
if
““ 
(
““ 
!
““ 
UsuarioExists
““ "
(
““" #
email
““# (
)
““( )
)
““) *
{
”” 
return
‘‘ 
NotFound
‘‘ #
(
‘‘# $
new
‘‘$ '
{
‘‘( )
msg
‘‘* -
=
‘‘. /
$str
‘‘0 T
}
‘‘U V
)
‘‘V W
;
‘‘W X
}
’’ 
}
÷÷ 
return
ÿÿ 

StatusCode
ÿÿ 
(
ÿÿ 
$num
ÿÿ !
,
ÿÿ! "
new
ÿÿ# &
{
ÿÿ' (
msg
ÿÿ) ,
=
ÿÿ- .
$"
ÿÿ/ 1(
Senha alterada com sucesso
ÿÿ1 K
"
ÿÿK L
}
ÿÿM N
)
ÿÿN O
;
ÿÿO P
}
ŸŸ 	
}
⁄⁄ 
}€€ ‘t
CC:\Repositorio\Backend\Controllers\UsuariosDisciplinasController.cs
	namespace 	
BackEnd
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class )
UsuariosDisciplinasController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
DatabaseContext (
_context) 1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public )
UsuariosDisciplinasController ,
(, -
DatabaseContext- <
context= D
,D E
IMapperF M
mapperN T
)T U
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
[   	
HttpGet  	 
]   
[!! 	
	Authorize!!	 
]!! 
public"" 
async"" 
Task"" 
<"" 
ActionResult"" &
<""& '
IEnumerable""' 2
<""2 3,
 UsuarioDisciplinaSearchViewModel""3 S
>""S T
>""T U
>""U V"
GetUsuariosDisciplinas""W m
(""m n
)""n o
{## 	
return%% 
await%% 
_context%% !
.%%! "
Usuario%%" )
.&& 
Select&& 
(&& 
usr&& 
=>&&  "
new&&# &,
 UsuarioDisciplinaSearchViewModel&&' G
{'' 
Email(( 
=(( 
usr((  #
.((# $
Email(($ )
,(() *
Nome)) 
=)) 
usr)) "
.))" #
NomeSobrenome))# 0
,))0 1
Disciplinas** #
=**$ %
_context**& .
.**. /

Disciplina**/ 9
.**9 :
Where**: ?
(**? @
disc**@ D
=>**E G
usr**H K
.**K L
UsuarioDisciplina**L ]
.**] ^
Select**^ d
(**d e
usrdisc**e l
=>**m o
usrdisc**p w
.**w x#
DisciplinaIdDisciplina	**x é
)
**é è
.
**è ê
Contains
**ê ò
(
**ò ô
disc
**ô ù
.
**ù û
IdDisciplina
**û ™
)
**™ ´
)
**´ ¨
.
**¨ ≠
ToList
**≠ ≥
(
**≥ ¥
)
**¥ µ
}++ 
),, 
.-- 
ToListAsync-- 
(-- 
)-- 
;-- 
}.. 	
[44 	
HttpGet44	 
(44 
$str44 
)44 
]44 
[55 	
	Authorize55	 
]55 
public66 
async66 
Task66 
<66 
ActionResult66 &
<66& '
object66' -
>66- .
>66. / 
GetUsuarioDisciplina660 D
(66D E
string66E K
email66L Q
)66Q R
{77 	
var99 
usuarioDisciplina99 !
=99" #
await99$ )
_context99* 2
.992 3
Usuario993 :
.:: 
Where:: 
(:: 
usr:: 
=>:: 
usr:: !
.::! "
Email::" '
==::( *
email::+ 0
)::0 1
.;; 
Select;; 
(;; 
usr;; 
=>;; 
new;; ",
 UsuarioDisciplinaSearchViewModel;;# C
{<< 
Email== 
=== 
usr== 
.==  
Email==  %
,==% &
Nome>> 
=>> 
usr>> 
.>> 
NomeSobrenome>> ,
,>>, -
Disciplinas?? 
=??  !
_context??" *
.??* +

Disciplina??+ 5
.??5 6
Where??6 ;
(??; <
disc??< @
=>??A C
usr??D G
.??G H
UsuarioDisciplina??H Y
.??Y Z
Select??Z `
(??` a
usrdisc??a h
=>??i k
usrdisc??l s
.??s t#
DisciplinaIdDisciplina	??t ä
)
??ä ã
.
??ã å
Contains
??å î
(
??î ï
disc
??ï ô
.
??ô ö
IdDisciplina
??ö ¶
)
??¶ ß
)
??ß ®
.
??® ©
ToList
??© Ø
(
??Ø ∞
)
??∞ ±
}@@ 
)AA 
.BB 
FirstOrDefaultAsyncBB $
(BB$ %
)BB% &
;BB& '
ifEE 
(EE 
usuarioDisciplinaEE !
==EE" $
nullEE% )
)EE) *
{FF 
returnGG 
NotFoundGG 
(GG  
newGG  #
{GG$ %
msgGG& )
=GG* +
$strGG, R
}GGS T
)GGT U
;GGU V
}HH 
returnJJ 
usuarioDisciplinaJJ $
;JJ$ %
}KK 	
[PP 	
HttpPutPP	 
(PP 
$strPP (
)PP( )
]PP) *
[QQ 	
	AuthorizeQQ	 
(QQ 
RolesQQ 
=QQ 
$strQQ *
)QQ* +
]QQ+ ,
publicRR 
asyncRR 
TaskRR 
<RR 
IActionResultRR '
>RR' ( 
PutUsuarioDisciplinaRR) =
(RR= >
[RR> ?
	FromQueryRR? H
]RRH I
intRRJ M
IdUsuarioDisciplinaRRN a
,RRa b
[RRc d
FromBodyRRd l
]RRl m
intRRn q
IdDisciplinaRRr ~
)RR~ 
{SS 	
UsuarioDisciplinaTT 
usuarioDisciplinaTT /
=TT0 1
awaitTT2 7
_contextTT8 @
.TT@ A
UsuarioDisciplinaTTA R
.TTR S
	FindAsyncTTS \
(TT\ ]
IdUsuarioDisciplinaTT] p
)TTp q
;TTq r
usuarioDisciplinaUU 
.UU "
DisciplinaIdDisciplinaUU 4
=UU5 6
IdDisciplinaUU7 C
;UUC D
tryVV 
{WW 
awaitXX 
_contextXX 
.XX 
SaveChangesAsyncXX /
(XX/ 0
)XX0 1
;XX1 2
}YY 
catchZZ 
(ZZ (
DbUpdateConcurrencyExceptionZZ /
)ZZ/ 0
{[[ 
if\\ 
(\\ 
!\\ #
UsuarioDisciplinaExists\\ ,
(\\, -
usuarioDisciplina\\- >
.\\> ?

UsuarioCpf\\? I
,\\I J
IdDisciplina\\K W
)\\W X
)\\X Y
{]] 
return^^ 
NotFound^^ #
(^^# $
new^^$ '
{^^( )
msg^^* -
=^^. /
$str^^0 V
}^^W X
)^^X Y
;^^Y Z
}__ 
else`` 
{aa 
throwbb 
;bb 
}cc 
}dd 
returnff 

StatusCodeff 
(ff 
$numff !
,ff! "
newff# &
{ff' (
msgff) ,
=ff- .
$"ff/ 1
	Usu√°rio ff1 9
{ff9 :
usuarioDisciplinaff: K
.ffK L 
UsuarioCpfNavigationffL `
.ff` a
NomeSobrenomeffa n
}ffn o0
# alterado de disciplina com sucesso	ffo í
"
ffí ì
}
ffî ï
)
ffï ñ
;
ffñ ó
}gg 	
[ll 	
HttpPostll	 
]ll 
[mm 	
	Authorizemm	 
(mm 
Rolesmm 
=mm 
$strmm *
)mm* +
]mm+ ,
publicnn 
asyncnn 
Tasknn 
<nn 
ActionResultnn &
<nn& '
UsuarioDisciplinann' 8
>nn8 9
>nn9 :!
PostUsuarioDisciplinann; P
(nnP Q5
)UsuarioDisciplinaCreateAndUpdateViewModelnnQ z'
usuarioDisciplinaViewModel	nn{ ï
)
nnï ñ
{oo 	
trypp 
{qq 
UsuarioDisciplinass !
usuarioDisciplinass" 3
=ss4 5
_mapperss6 =
.ss= >
Mapss> A
<ssA B
UsuarioDisciplinassB S
>ssS T
(ssT U&
usuarioDisciplinaViewModelssU o
)sso p
;ssp q
_contexttt 
.tt 
UsuarioDisciplinatt *
.tt* +
Addtt+ .
(tt. /
usuarioDisciplinatt/ @
)tt@ A
;ttA B
awaitvv 
_contextvv 
.vv 
SaveChangesAsyncvv /
(vv/ 0
)vv0 1
;vv1 2
usuarioDisciplinaxx !
.xx! " 
UsuarioCpfNavigationxx" 6
=xx7 8
awaitxx9 >
_contextxx? G
.xxG H
UsuarioxxH O
.xxO P
WherexxP U
(xxU V
usrxxV Y
=>xxZ \
usrxx] `
.xx` a
Cpfxxa d
==xxe g
usuarioDisciplinaxxh y
.xxy z

UsuarioCpf	xxz Ñ
)
xxÑ Ö
.
xxÖ Ü!
FirstOrDefaultAsync
xxÜ ô
(
xxô ö
)
xxö õ
;
xxõ ú
return{{ 
CreatedAtAction{{ &
({{& '
$str{{' =
,{{= >
new{{? B
{{{C D
email{{E J
={{K L
usuarioDisciplina{{M ^
.{{^ _ 
UsuarioCpfNavigation{{_ s
.{{s t
Email{{t y
}{{z {
,{{{ |
usuarioDisciplina	{{} é
)
{{é è
;
{{è ê
}|| 
catch}} 
(}} 
DbUpdateException}} $
)}}$ %
{~~ 
if 
( #
UsuarioDisciplinaExists +
(+ ,&
usuarioDisciplinaViewModel, F
.F G

UsuarioCpfG Q
,Q R&
usuarioDisciplinaViewModelS m
.m n#
DisciplinaIdDisciplina	n Ñ
)
Ñ Ö
)
Ö Ü
{
ÄÄ 
return
ÅÅ 
Conflict
ÅÅ #
(
ÅÅ# $
new
ÅÅ$ '
{
ÅÅ( )
msg
ÅÅ* -
=
ÅÅ. /
$str
ÅÅ0 ]
}
ÅÅ^ _
)
ÅÅ_ `
;
ÅÅ` a
}
ÇÇ 
else
ÉÉ 
if
ÉÉ 
(
ÉÉ 
!
ÉÉ &
CpfOrDisciplinaNotExists
ÉÉ 2
(
ÉÉ2 3(
usuarioDisciplinaViewModel
ÉÉ3 M
.
ÉÉM N

UsuarioCpf
ÉÉN X
,
ÉÉX Y(
usuarioDisciplinaViewModel
ÉÉZ t
.
ÉÉt u%
DisciplinaIdDisciplinaÉÉu ã
)ÉÉã å
)ÉÉå ç
{
ÑÑ 
return
ÖÖ 

BadRequest
ÖÖ %
(
ÖÖ% &
new
ÖÖ& )
{
ÖÖ* +
msg
ÖÖ, /
=
ÖÖ0 1
$str
ÖÖ2 `
}
ÖÖa b
)
ÖÖb c
;
ÖÖc d
}
ÜÜ 
else
áá 
{
àà 
throw
ââ 
;
ââ 
}
ää 
}
ãã 
}
çç 	
[
íí 	

HttpDelete
íí	 
(
íí 
)
íí 
]
íí 
[
ìì 	
	Authorize
ìì	 
(
ìì 
Roles
ìì 
=
ìì 
$str
ìì *
)
ìì* +
]
ìì+ ,
public
îî 
async
îî 
Task
îî 
<
îî 
ActionResult
îî &
<
îî& '
UsuarioDisciplina
îî' 8
>
îî8 9
>
îî9 :%
DeleteUsuarioDisciplina
îî; R
(
îîR S
string
îîS Y
cpf
îîZ ]
,
îî] ^
int
îî_ b
id
îîc e
)
îîe f
{
ïï 	
var
ññ 
usuarioDisciplina
ññ !
=
ññ" #
await
ññ$ )
_context
ññ* 2
.
ññ2 3
UsuarioDisciplina
ññ3 D
.
ññD E
Where
ññE J
(
ññJ K
usr
ññK N
=>
ññO Q
usr
ññR U
.
ññU V

UsuarioCpf
ññV `
==
ñña c
cpf
ññd g
&&
ññh j
usr
ññk n
.
ññn o%
DisciplinaIdDisciplinañño Ö
==ññÜ à
idññâ ã
)ññã å
.ññå ç#
FirstOrDefaultAsyncññç †
(ññ† °
)ññ° ¢
;ññ¢ £
if
óó 
(
óó 
usuarioDisciplina
óó !
==
óó" $
null
óó% )
)
óó) *
{
òò 
return
ôô 
NotFound
ôô 
(
ôô  
new
ôô  #
{
ôô$ %
msg
ôô& )
=
ôô* +
$str
ôô, R
}
ôôS T
)
ôôT U
;
ôôU V
}
öö 
_context
úú 
.
úú 
UsuarioDisciplina
úú &
.
úú& '
Remove
úú' -
(
úú- .
usuarioDisciplina
úú. ?
)
úú? @
;
úú@ A
await
ùù 
_context
ùù 
.
ùù 
SaveChangesAsync
ùù +
(
ùù+ ,
)
ùù, -
;
ùù- .
return
üü 
usuarioDisciplina
üü $
;
üü$ %
}
†† 	
private
¢¢ 
bool
¢¢ %
UsuarioDisciplinaExists
¢¢ ,
(
¢¢, -
string
¢¢- 3
cpf
¢¢4 7
,
¢¢7 8
int
¢¢9 <
idDisciplina
¢¢= I
)
¢¢I J
{
££ 	
return
§§ 
_context
§§ 
.
§§ 
UsuarioDisciplina
§§ -
.
§§- .
Any
§§. 1
(
§§1 2
e
§§2 3
=>
§§4 6
e
§§7 8
.
§§8 9

UsuarioCpf
§§9 C
==
§§D F
cpf
§§G J
&&
§§K M
e
§§N O
.
§§O P$
DisciplinaIdDisciplina
§§P f
==
§§g i
idDisciplina
§§j v
)
§§v w
;
§§w x
}
•• 	
private
ßß 
bool
ßß &
CpfOrDisciplinaNotExists
ßß -
(
ßß- .
string
ßß. 4
cpf
ßß5 8
,
ßß8 9
int
ßß: =
idDisciplina
ßß> J
)
ßßJ K
{
®® 	
bool
©© 
exists
©© 
=
©© 
true
©© 
;
©© 
if
™™ 
(
™™ 
!
™™ 
_context
™™ 
.
™™ 
Usuario
™™ !
.
™™! "
Any
™™" %
(
™™% &
usrdisc
™™& -
=>
™™. 0
usrdisc
™™1 8
.
™™8 9
Cpf
™™9 <
==
™™= ?
cpf
™™@ C
)
™™C D
)
™™D E
{
´´ 
exists
¨¨ 
=
¨¨ 
false
¨¨ 
;
¨¨ 
}
≠≠ 
if
ÆÆ 
(
ÆÆ 
!
ÆÆ 
_context
ÆÆ 
.
ÆÆ 

Disciplina
ÆÆ $
.
ÆÆ$ %
Any
ÆÆ% (
(
ÆÆ( )
usrdisc
ÆÆ) 0
=>
ÆÆ1 3
usrdisc
ÆÆ4 ;
.
ÆÆ; <
IdDisciplina
ÆÆ< H
==
ÆÆI K
idDisciplina
ÆÆL X
)
ÆÆX Y
)
ÆÆY Z
{
ØØ 
exists
∞∞ 
=
∞∞ 
false
∞∞ 
;
∞∞ 
}
±± 
return
≤≤ 
exists
≤≤ 
;
≤≤ 
}
≥≥ 	
}
¥¥ 
}µµ å
2C:\Repositorio\Backend\Filters\TokenEmailFilter.cs
	namespace		 	
BackEnd		
 
.		 
Filters		 
{

 
public 

class 
TokenEmailFilter !
:" #!
ActionFilterAttribute$ 9
{ 
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
contextF M
)M N
{ 	
string 
token 
= 
context "
." #
HttpContext# .
.. /
Request/ 6
.6 7
Headers7 >
[> ?
$str? N
]N O
;O P
token 
= 
token 
. 
Split 
(  
$char  #
)# $
[$ %
$num% &
]& '
;' (#
JwtSecurityTokenHandler #
handler$ +
=, -
new. 1#
JwtSecurityTokenHandler2 I
(I J
)J K
;K L
var 
tokenDecoded 
= 
handler &
.& '
ReadJwtToken' 3
(3 4
token4 9
)9 :
;: ;
string 
email 
= 
tokenDecoded '
.' (
Payload( /
./ 0
GetValueOrDefault0 A
(A B
$strB I
)I J
.J K
ToStringK S
(S T
)T U
;U V
context 
. 
ActionArguments #
.# $
Add$ '
(' (
$str( /
,/ 0
email1 6
)6 7
;7 8
} 	
} 
} ™Æ
BC:\Repositorio\Backend\Migrations\20200606170743_Delete Cascade.cs
	namespace 	
BackEnd
 
. 

Migrations 
{ 
public 

partial 
class 
DeleteCascade &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str "
," #
columns 
: 
table 
=> !
new" %
{ 
IdDisciplina  
=! "
table# (
.( )
Column) /
</ 0
int0 3
>3 4
(4 5
nullable5 =
:= >
false? D
)D E
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
	Descricao 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
nullable5 =
:= >
true? C
)C D
,D E
Materia 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
	maxLength3 <
:< =
$num> @
,@ A
nullableB J
:J K
trueL P
)P Q
,Q R
Turno 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
	maxLength1 :
:: ;
$num< >
,> ?
nullable@ H
:H I
trueJ N
)N O
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 4
,4 5
x6 7
=>8 :
x; <
.< =
IdDisciplina= I
)I J
;J K
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Cnpj 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
	maxLength0 9
:9 :
$num; =
,= >
nullable? G
:G H
falseI N
)N O
,O P
Nome 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
	maxLength0 9
:9 :
$num; =
,= >
nullable? G
:G H
trueI M
)M N
,N O
Telefone 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
	maxLength4 =
:= >
$num? A
,A B
nullableC K
:K L
trueM Q
)Q R
}   
,   
constraints!! 
:!! 
table!! "
=>!!# %
{"" 
table## 
.## 

PrimaryKey## $
(##$ %
$str##% .
,##. /
x##0 1
=>##2 4
x##5 6
.##6 7
Cnpj##7 ;
)##; <
;##< =
}$$ 
)$$ 
;$$ 
migrationBuilder&& 
.&& 
CreateTable&& (
(&&( )
name'' 
:'' 
$str'' !
,''! "
columns(( 
:(( 
table(( 
=>(( !
new((" %
{)) 
IdAtividade** 
=**  !
table**" '
.**' (
Column**( .
<**. /
int**/ 2
>**2 3
(**3 4
nullable**4 <
:**< =
false**> C
)**C D
.++ 

Annotation++ #
(++# $
$str++$ :
,++: ;
true++< @
)++@ A
,++A B
IdDisciplina,,  
=,,! "
table,,# (
.,,( )
Column,,) /
<,,/ 0
int,,0 3
>,,3 4
(,,4 5
nullable,,5 =
:,,= >
false,,? D
),,D E
,,,E F
	Descricao-- 
=-- 
table--  %
.--% &
Column--& ,
<--, -
string--- 3
>--3 4
(--4 5
nullable--5 =
:--= >
true--? C
)--C D
,--D E

Atividade1.. 
=..  
table..! &
...& '
Column..' -
<..- .
string... 4
>..4 5
(..5 6
	maxLength..6 ?
:..? @
$num..A C
,..C D
nullable..E M
:..M N
false..O T
)..T U
,..U V
Valor// 
=// 
table// !
.//! "
Column//" (
<//( )
float//) .
>//. /
(/// 0
nullable//0 8
://8 9
false//: ?
)//? @
,//@ A
StatusAtividade00 #
=00$ %
table00& +
.00+ ,
Column00, 2
<002 3
string003 9
>009 :
(00: ;
nullable00; C
:00C D
false00E J
)00J K
,00K L
DataEntrega11 
=11  !
table11" '
.11' (
Column11( .
<11. /
DateTime11/ 7
>117 8
(118 9
nullable119 A
:11A B
false11C H
)11H I
,11I J
TipoAtividade22 !
=22" #
table22$ )
.22) *
Column22* 0
<220 1
string221 7
>227 8
(228 9
	maxLength229 B
:22B C
$num22D F
,22F G
nullable22H P
:22P Q
false22R W
)22W X
,22X Y
	Premiacao33 
=33 
table33  %
.33% &
Column33& ,
<33, -
string33- 3
>333 4
(334 5
	maxLength335 >
:33> ?
$num33@ B
,33B C
nullable33D L
:33L M
false33N S
)33S T
,33T U
MoralAtividade44 "
=44# $
table44% *
.44* +
Column44+ 1
<441 2
string442 8
>448 9
(449 :
	maxLength44: C
:44C D
$num44E G
,44G H
nullable44I Q
:44Q R
false44S X
)44X Y
}55 
,55 
constraints66 
:66 
table66 "
=>66# %
{77 
table88 
.88 

PrimaryKey88 $
(88$ %
$str88% 3
,883 4
x885 6
=>887 9
x88: ;
.88; <
IdAtividade88< G
)88G H
;88H I
table99 
.99 

ForeignKey99 $
(99$ %
name:: 
::: 
$str:: F
,::F G
column;; 
:;; 
x;;  !
=>;;" $
x;;% &
.;;& '
IdDisciplina;;' 3
,;;3 4
principalTable<< &
:<<& '
$str<<( 4
,<<4 5
principalColumn== '
:==' (
$str==) 7
,==7 8
onDelete>>  
:>>  !
ReferentialAction>>" 3
.>>3 4
Cascade>>4 ;
)>>; <
;>>< =
}?? 
)?? 
;?? 
migrationBuilderAA 
.AA 
CreateTableAA (
(AA( )
nameBB 
:BB 
$strBB 
,BB  
columnsCC 
:CC 
tableCC 
=>CC !
newCC" %
{DD 
CpfEE 
=EE 
tableEE 
.EE  
ColumnEE  &
<EE& '
stringEE' -
>EE- .
(EE. /
	maxLengthEE/ 8
:EE8 9
$numEE: <
,EE< =
nullableEE> F
:EEF G
falseEEH M
)EEM N
,EEN O
EmailFF 
=FF 
tableFF !
.FF! "
ColumnFF" (
<FF( )
stringFF) /
>FF/ 0
(FF0 1
	maxLengthFF1 :
:FF: ;
$numFF< >
,FF> ?
nullableFF@ H
:FFH I
falseFFJ O
)FFO P
,FFP Q
TipoUsuarioGG 
=GG  !
tableGG" '
.GG' (
ColumnGG( .
<GG. /
stringGG/ 5
>GG5 6
(GG6 7
nullableGG7 ?
:GG? @
falseGGA F
)GGF G
,GGG H
DataNascimentoHH "
=HH# $
tableHH% *
.HH* +
ColumnHH+ 1
<HH1 2
DateTimeHH2 :
>HH: ;
(HH; <
nullableHH< D
:HHD E
falseHHF K
)HHK L
,HHL M
SenhaII 
=II 
tableII !
.II! "
ColumnII" (
<II( )
stringII) /
>II/ 0
(II0 1
	maxLengthII1 :
:II: ;
$numII< >
,II> ?
nullableII@ H
:IIH I
falseIIJ O
)IIO P
,IIP Q
NomeSobrenomeJJ !
=JJ" #
tableJJ$ )
.JJ) *
ColumnJJ* 0
<JJ0 1
stringJJ1 7
>JJ7 8
(JJ8 9
	maxLengthJJ9 B
:JJB C
$numJJD F
,JJF G
nullableJJH P
:JJP Q
falseJJR W
)JJW X
,JJX Y
TelefoneKK 
=KK 
tableKK $
.KK$ %
ColumnKK% +
<KK+ ,
stringKK, 2
>KK2 3
(KK3 4
	maxLengthKK4 =
:KK= >
$numKK? A
,KKA B
nullableKKC K
:KKK L
trueKKM Q
)KKQ R
,KKR S

EscolaCnpjLL 
=LL  
tableLL! &
.LL& '
ColumnLL' -
<LL- .
stringLL. 4
>LL4 5
(LL5 6
	maxLengthLL6 ?
:LL? @
$numLLA C
,LLC D
nullableLLE M
:LLM N
falseLLO T
)LLT U
}MM 
,MM 
constraintsNN 
:NN 
tableNN "
=>NN# %
{OO 
tablePP 
.PP 

PrimaryKeyPP $
(PP$ %
$strPP% .
,PP. /
xPP0 1
=>PP2 4
xPP5 6
.PP6 7
CpfPP7 :
)PP: ;
;PP; <
tableQQ 
.QQ 

ForeignKeyQQ $
(QQ$ %
nameRR 
:RR 
$strRR 1
,RR1 2
columnSS 
:SS 
xSS  !
=>SS" $
xSS% &
.SS& '

EscolaCnpjSS' 1
,SS1 2
principalTableTT &
:TT& '
$strTT( 0
,TT0 1
principalColumnUU '
:UU' (
$strUU) /
,UU/ 0
onDeleteVV  
:VV  !
ReferentialActionVV" 3
.VV3 4
CascadeVV4 ;
)VV; <
;VV< =
}WW 
)WW 
;WW 
migrationBuilderYY 
.YY 
CreateTableYY (
(YY( )
nameZZ 
:ZZ 
$strZZ )
,ZZ) *
columns[[ 
:[[ 
table[[ 
=>[[ !
new[[" %
{\\  
idUsuario_Disciplina]] (
=]]) *
table]]+ 0
.]]0 1
Column]]1 7
<]]7 8
int]]8 ;
>]]; <
(]]< =
nullable]]= E
:]]E F
false]]G L
)]]L M
.^^ 

Annotation^^ #
(^^# $
$str^^$ :
,^^: ;
true^^< @
)^^@ A
,^^A B

UsuarioCpf__ 
=__  
table__! &
.__& '
Column__' -
<__- .
string__. 4
>__4 5
(__5 6
	maxLength__6 ?
:__? @
$num__A C
,__C D
nullable__E M
:__M N
false__O T
)__T U
,__U V#
disciplina_idDisciplina`` +
=``, -
table``. 3
.``3 4
Column``4 :
<``: ;
int``; >
>``> ?
(``? @
nullable``@ H
:``H I
false``J O
)``O P
}aa 
,aa 
constraintsbb 
:bb 
tablebb "
=>bb# %
{cc 
tabledd 
.dd 

PrimaryKeydd $
(dd$ %
$strdd% ;
,dd; <
xdd= >
=>dd? A
xddB C
.ddC D 
idUsuario_DisciplinaddD X
)ddX Y
;ddY Z
tableee 
.ee 

ForeignKeyee $
(ee$ %
nameff 
:ff 
$strff E
,ffE F
columngg 
:gg 
xgg  !
=>gg" $
xgg% &
.gg& '#
disciplina_idDisciplinagg' >
,gg> ?
principalTablehh &
:hh& '
$strhh( 4
,hh4 5
principalColumnii '
:ii' (
$strii) 7
,ii7 8
onDeletejj  
:jj  !
ReferentialActionjj" 3
.jj3 4
Cascadejj4 ;
)jj; <
;jj< =
tablekk 
.kk 

ForeignKeykk $
(kk$ %
namell 
:ll 
$strll B
,llB C
columnmm 
:mm 
xmm  !
=>mm" $
xmm% &
.mm& '

UsuarioCpfmm' 1
,mm1 2
principalTablenn &
:nn& '
$strnn( 1
,nn1 2
principalColumnoo '
:oo' (
$stroo) .
,oo. /
onDeletepp  
:pp  !
ReferentialActionpp" 3
.pp3 4
Cascadepp4 ;
)pp; <
;pp< =
}qq 
)qq 
;qq 
migrationBuilderss 
.ss 
CreateTabless (
(ss( )
namett 
:tt 
$strtt (
,tt( )
columnsuu 
:uu 
tableuu 
=>uu !
newuu" %
{vv 
IdAtividadeUsuarioww &
=ww' (
tableww) .
.ww. /
Columnww/ 5
<ww5 6
intww6 9
>ww9 :
(ww: ;
nullableww; C
:wwC D
falsewwE J
)wwJ K
.xx 

Annotationxx #
(xx# $
$strxx$ :
,xx: ;
truexx< @
)xx@ A
,xxA B
IdAtividadeyy 
=yy  !
tableyy" '
.yy' (
Columnyy( .
<yy. /
intyy/ 2
>yy2 3
(yy3 4
nullableyy4 <
:yy< =
falseyy> C
)yyC D
,yyD E
IdUsuarioDisciplinazz '
=zz( )
tablezz* /
.zz/ 0
Columnzz0 6
<zz6 7
intzz7 :
>zz: ;
(zz; <
nullablezz< D
:zzD E
falsezzF K
)zzK L
,zzL M
Status{{ 
={{ 
table{{ "
.{{" #
Column{{# )
<{{) *
string{{* 0
>{{0 1
({{1 2
nullable{{2 :
:{{: ;
true{{< @
){{@ A
,{{A B
Total|| 
=|| 
table|| !
.||! "
Column||" (
<||( )
double||) /
>||/ 0
(||0 1
nullable||1 9
:||9 :
false||; @
)||@ A
}}} 
,}} 
constraints~~ 
:~~ 
table~~ "
=>~~# %
{ 
table
ÄÄ 
.
ÄÄ 

PrimaryKey
ÄÄ $
(
ÄÄ$ %
$str
ÄÄ% :
,
ÄÄ: ;
x
ÄÄ< =
=>
ÄÄ> @
x
ÄÄA B
.
ÄÄB C 
IdAtividadeUsuario
ÄÄC U
)
ÄÄU V
;
ÄÄV W
table
ÅÅ 
.
ÅÅ 

ForeignKey
ÅÅ $
(
ÅÅ$ %
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ N
,
ÇÇN O
column
ÉÉ 
:
ÉÉ 
x
ÉÉ  !
=>
ÉÉ" $
x
ÉÉ% &
.
ÉÉ& '
IdAtividade
ÉÉ' 2
,
ÉÉ2 3
principalTable
ÑÑ &
:
ÑÑ& '
$str
ÑÑ( 3
,
ÑÑ3 4
principalColumn
ÖÖ '
:
ÖÖ' (
$str
ÖÖ) 6
,
ÖÖ6 7
onDelete
ÜÜ  
:
ÜÜ  !
ReferentialAction
ÜÜ" 3
.
ÜÜ3 4
Cascade
ÜÜ4 ;
)
ÜÜ; <
;
ÜÜ< =
table
áá 
.
áá 

ForeignKey
áá $
(
áá$ %
name
àà 
:
àà 
$str
àà W
,
ààW X
column
ââ 
:
ââ 
x
ââ  !
=>
ââ" $
x
ââ% &
.
ââ& '!
IdUsuarioDisciplina
ââ' :
,
ââ: ;
principalTable
ää &
:
ää& '
$str
ää( ;
,
ää; <
principalColumn
ãã '
:
ãã' (
$str
ãã) ?
,
ãã? @
onDelete
åå  
:
åå  !
ReferentialAction
åå" 3
.
åå3 4
Cascade
åå4 ;
)
åå; <
;
åå< =
}
çç 
)
çç 
;
çç 
migrationBuilder
èè 
.
èè 

InsertData
èè '
(
èè' (
table
êê 
:
êê 
$str
êê 
,
êê  
columns
ëë 
:
ëë 
new
ëë 
[
ëë 
]
ëë 
{
ëë  
$str
ëë! '
,
ëë' (
$str
ëë) /
,
ëë/ 0
$str
ëë1 ;
}
ëë< =
,
ëë= >
values
íí 
:
íí 
new
íí 
object
íí "
[
íí" #
]
íí# $
{
íí% &
$str
íí' ,
,
íí, -
$str
íí. ;
,
íí; <
$str
íí= M
}
ííN O
)
ííO P
;
ííP Q
migrationBuilder
îî 
.
îî 
CreateIndex
îî (
(
îî( )
name
ïï 
:
ïï 
$str
ïï 1
,
ïï1 2
table
ññ 
:
ññ 
$str
ññ "
,
ññ" #
column
óó 
:
óó 
$str
óó &
)
óó& '
;
óó' (
migrationBuilder
ôô 
.
ôô 
CreateIndex
ôô (
(
ôô( )
name
öö 
:
öö 
$str
öö 7
,
öö7 8
table
õõ 
:
õõ 
$str
õõ )
,
õõ) *
column
úú 
:
úú 
$str
úú %
)
úú% &
;
úú& '
migrationBuilder
ûû 
.
ûû 
CreateIndex
ûû (
(
ûû( )
name
üü 
:
üü 
$str
üü ?
,
üü? @
table
†† 
:
†† 
$str
†† )
,
††) *
column
°° 
:
°° 
$str
°° -
)
°°- .
;
°°. /
migrationBuilder
££ 
.
££ 
CreateIndex
££ (
(
££( )
name
§§ 
:
§§ 
$str
§§ '
,
§§' (
table
•• 
:
•• 
$str
•• 
,
••  
column
¶¶ 
:
¶¶ 
$str
¶¶ "
,
¶¶" #
unique
ßß 
:
ßß 
true
ßß 
)
ßß 
;
ßß 
migrationBuilder
©© 
.
©© 
CreateIndex
©© (
(
©©( )
name
™™ 
:
™™ 
$str
™™ $
,
™™$ %
table
´´ 
:
´´ 
$str
´´  
,
´´  !
column
¨¨ 
:
¨¨ 
$str
¨¨ 
,
¨¨  
unique
≠≠ 
:
≠≠ 
true
≠≠ 
)
≠≠ 
;
≠≠ 
migrationBuilder
ØØ 
.
ØØ 
CreateIndex
ØØ (
(
ØØ( )
name
∞∞ 
:
∞∞ 
$str
∞∞ -
,
∞∞- .
table
±± 
:
±± 
$str
±±  
,
±±  !
column
≤≤ 
:
≤≤ 
$str
≤≤ $
)
≤≤$ %
;
≤≤% &
migrationBuilder
¥¥ 
.
¥¥ 
CreateIndex
¥¥ (
(
¥¥( )
name
µµ 
:
µµ 
$str
µµ A
,
µµA B
table
∂∂ 
:
∂∂ 
$str
∂∂ *
,
∂∂* +
column
∑∑ 
:
∑∑ 
$str
∑∑ 1
)
∑∑1 2
;
∑∑2 3
migrationBuilder
ππ 
.
ππ 
CreateIndex
ππ (
(
ππ( )
name
∫∫ 
:
∫∫ 
$str
∫∫ >
,
∫∫> ?
table
ªª 
:
ªª 
$str
ªª *
,
ªª* +
column
ºº 
:
ºº 
$str
ºº $
)
ºº$ %
;
ºº% &
}
ΩΩ 	
	protected
øø 
override
øø 
void
øø 
Down
øø  $
(
øø$ %
MigrationBuilder
øø% 5
migrationBuilder
øø6 F
)
øøF G
{
¿¿ 	
migrationBuilder
¡¡ 
.
¡¡ 
	DropTable
¡¡ &
(
¡¡& '
name
¬¬ 
:
¬¬ 
$str
¬¬ (
)
¬¬( )
;
¬¬) *
migrationBuilder
ƒƒ 
.
ƒƒ 
	DropTable
ƒƒ &
(
ƒƒ& '
name
≈≈ 
:
≈≈ 
$str
≈≈ !
)
≈≈! "
;
≈≈" #
migrationBuilder
«« 
.
«« 
	DropTable
«« &
(
««& '
name
»» 
:
»» 
$str
»» )
)
»») *
;
»»* +
migrationBuilder
   
.
   
	DropTable
   &
(
  & '
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ "
)
ÀÀ" #
;
ÀÀ# $
migrationBuilder
ÕÕ 
.
ÕÕ 
	DropTable
ÕÕ &
(
ÕÕ& '
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ 
)
ŒŒ  
;
ŒŒ  !
migrationBuilder
–– 
.
–– 
	DropTable
–– &
(
––& '
name
—— 
:
—— 
$str
—— 
)
—— 
;
——  
}
““ 	
}
”” 
}‘‘ Ñ$
*C:\Repositorio\Backend\Models\Atividade.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 
	Atividade "
{		 
public

 
	Atividade

 
(

 
)

 
{ 	&
AtividadeUsuarioDisciplina &
=' (
new) ,
HashSet- 4
<4 5
AtividadeUsuario5 E
>E F
(F G
)G H
;H I
} 	
[ 	
Key	 
] 
public 
int 
IdAtividade 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
( 
ErrorMessage 
=  
$str! L
)L M
]M N
public 
int 
IdDisciplina 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
( 
ErrorMessage 
=  
$str! E
)E F
]F G
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 

Atividade1  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
( 
ErrorMessage 
=  
$str! A
)A B
]B C
public 
float 
Valor 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! O
)O P
]P Q
public 
StatusAtividadeEnum "
StatusAtividade# 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
[ 	
Required	 
( 
ErrorMessage 
=  
$str! K
)K L
]L M
public 
DateTime 
DataEntrega #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[   	
Required  	 
(   
ErrorMessage   
=    
$str  ! M
)  M N
]  N O
[!! 	
StringLength!!	 
(!! 
$num!! 
)!! 
]!! 
public"" 
string"" 
TipoAtividade"" #
{""$ %
get""& )
;"") *
set""+ .
;"". /
}""0 1
[## 	
StringLength##	 
(## 
$num## 
)## 
]## 
public$$ 
string$$ 
	Premiacao$$ 
{$$  !
get$$" %
;$$% &
set$$' *
;$$* +
}$$, -
[%% 	
Required%%	 
(%% 
ErrorMessage%% 
=%%  
$str%%! N
)%%N O
]%%O P
[&& 	
StringLength&&	 
(&& 
$num&& 
)&& 
]&& 
public'' 
string'' 
MoralAtividade'' $
{''% &
get''' *
;''* +
set'', /
;''/ 0
}''1 2
public)) 
virtual)) 
ICollection)) "
<))" #
AtividadeUsuario))# 3
>))3 4&
AtividadeUsuarioDisciplina))5 O
{))P Q
get))R U
;))U V
set))W Z
;))Z [
}))\ ]
public** 
virtual** 

Disciplina** "

Disciplina**# -
{**. /
get**0 3
;**3 4
set**5 8
;**8 9
}**: ;
}++ 
public-- 

enum-- 
StatusAtividadeEnum-- #
{.. 
[// 	

EnumMember//	 
(// 
Value// 
=// 
$str// &
)//& '
]//' (
Pendente00 
,00 
[11 	
Display11	 
(11 
Name11 
=11 
$str11 %
)11% &
]11& '
[22 	

EnumMember22	 
(22 
Value22 
=22 
$str22 *
)22* +
]22+ ,
Emand33 
}44 
}55 —
1C:\Repositorio\Backend\Models\AtividadeUsuario.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 
AtividadeUsuario )
{ 
[		 	
Key			 
]		 
public

 
int

 
IdAtividadeUsuario

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
[ 	
Required	 
] 
public 
int 
IdAtividade 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
int 
IdUsuarioDisciplina &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
double 
Total 
{ 
get !
;! "
set# &
;& '
}( )
public 
virtual 
	Atividade  !
IdAtividadeNavigation! 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
virtual 
UsuarioDisciplina ()
IdUsuarioDisciplinaNavigation) F
{G H
getI L
;L M
setN Q
;Q R
}S T
} 
} ã[
0C:\Repositorio\Backend\Models\DatabaseContext.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 
DatabaseContext (
:) *
	DbContext+ 4
{ 
public

 
DatabaseContext

 
(

 
DbContextOptions

 /
<

/ 0
DatabaseContext

0 ?
>

? @
options

A H
)

H I
: 
base 
( 
options 
) 
{ 	
} 	
public 
virtual 
DbSet 
< 
	Atividade &
>& '
	Atividade( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
virtual 
DbSet 
< 
AtividadeUsuario -
>- .
AtividadeUsuario/ ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
virtual 
DbSet 
< 

Disciplina '
>' (

Disciplina) 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
DbSet 
< 
Escola #
># $
Escola% +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
DbSet 
< 
Usuario $
>$ %
Usuario& -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
virtual 
DbSet 
< 
UsuarioDisciplina .
>. /
UsuarioDisciplina0 A
{B C
getD G
;G H
setI L
;L M
}N O
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
	Atividade  )
>) *
(* +
entity+ 1
=>2 4
{ 
entity 
. 
Property 
( 
c  
=>! #
c$ %
.% &
StatusAtividade& 5
)5 6
. 
HasConversion 
< 
string $
>$ %
(% &
)& '
;' (
entity 
. 
HasOne 
( 
d 
=>  "
d# $
.$ %

Disciplina% /
)/ 0
. 
WithMany 
( 
p 
=>  "
p# $
.$ %

Atividades% /
)/ 0
. 
HasForeignKey "
(" #
d# $
=>% '
d( )
.) *
IdDisciplina* 6
)6 7
. 
OnDelete 
( 
DeleteBehavior ,
., -
Cascade- 4
)4 5
.   
HasConstraintName   &
(  & '
$str  ' O
)  O P
;  P Q
}"" 
)"" 
;"" 
modelBuilder$$ 
.$$ 
Entity$$ 
<$$  
Escola$$  &
>$$& '
($$' (
entity$$( .
=>$$/ 1
{%% 
entity&& 
.&& 
HasKey&& 
(&& 
e&& 
=>&&  "
e&&# $
.&&$ %
Cnpj&&% )
)&&) *
.'' 
HasName'' 
('' 
$str'' &
)''& '
;''' (
entity)) 
.)) 
HasIndex)) 
())  
e))  !
=>))" $
e))% &
.))& '
Telefone))' /
)))/ 0
.** 
HasName** 
(** 
$str** .
)**. /
.++ 
IsUnique++ 
(++ 
)++ 
;++  
entity-- 
.-- 
HasData-- 
(-- 
new-- "
Escola--# )
{--* +
Cnpj.. 
=.. 
$str..  
,..  !
Nome// 
=// 
$str// (
,//( )
Telefone00 
=00 
$str00 /
}11 
)11 
;11 
}22 
)22 
;22 
modelBuilder44 
.44 
Entity44 
<44  
Usuario44  '
>44' (
(44( )
entity44) /
=>440 2
{55 
entity66 
.66 
Property66 
(66  
c66  !
=>66" $
c66% &
.66& '
TipoUsuario66' 2
)662 3
.77 
HasConversion77 
<77 
string77 %
>77% &
(77& '
)77' (
;77( )
entity99 
.99 
HasKey99 
(99 
e99 
=>99  "
e99# $
.99$ %
Cpf99% (
)99( )
.:: 
HasName:: 
(:: 
$str:: &
)::& '
;::' (
entity<< 
.<< 
HasIndex<< 
(<<  
e<<  !
=><<" $
e<<% &
.<<& '
Email<<' ,
)<<, -
.== 
HasName== 
(== 
$str== +
)==+ ,
.>> 
IsUnique>> 
(>> 
)>> 
;>>  
entity@@ 
.@@ 
HasIndex@@ 
(@@  
e@@  !
=>@@" $
e@@% &
.@@& '

EscolaCnpj@@' 1
)@@1 2
.AA 
HasNameAA 
(AA 
$strAA 4
)AA4 5
;AA5 6
entityCC 
.CC 
HasOneCC 
(CC 
dCC 
=>CC  "
dCC# $
.CC$ % 
EscolaCnpjNavigationCC% 9
)CC9 :
.DD 
WithManyDD 
(DD 
pDD 
=>DD  "
pDD# $
.DD$ %
UsuarioDD% ,
)DD, -
.EE 
HasForeignKeyEE "
(EE" #
dEE# $
=>EE% '
dEE( )
.EE) *

EscolaCnpjEE* 4
)EE4 5
.FF 
OnDeleteFF 
(FF 
DeleteBehaviorFF ,
.FF, -
CascadeFF- 4
)FF4 5
.GG 
HasConstraintNameGG &
(GG& '
$strGG' :
)GG: ;
;GG; <
}HH 
)HH 
;HH 
modelBuilderJJ 
.JJ 
EntityJJ 
<JJ  
AtividadeUsuarioJJ  0
>JJ0 1
(JJ1 2
entityJJ2 8
=>JJ9 ;
{KK 
entityLL 
.LL 
HasOneLL 
(LL 
dLL 
=>LL  "
dLL# $
.LL$ %!
IdAtividadeNavigationLL% :
)LL: ;
.MM$ %
WithManyMM% -
(MM- .
pMM. /
=>MM0 2
pMM3 4
.MM4 5&
AtividadeUsuarioDisciplinaMM5 O
)MMO P
.NN$ %
HasForeignKeyNN% 2
(NN2 3
dNN3 4
=>NN5 7
dNN8 9
.NN9 :
IdAtividadeNN: E
)NNE F
.OO$ %
OnDeleteOO% -
(OO- .
DeleteBehaviorOO. <
.OO< =
CascadeOO= D
)OOD E
.PP$ %
HasConstraintNamePP% 6
(PP6 7
$strPP7 g
)PPg h
;PPh i
entityRR 
.RR 
HasOneRR 
(RR 
dRR 
=>RR  "
dRR# $
.RR$ %)
IdUsuarioDisciplinaNavigationRR% B
)RRB C
.SS 
WithManySS 
(SS 
pSS 
=>SS  "
pSS# $
.SS$ %&
AtividadeUsuarioDisciplinaSS% ?
)SS? @
.TT 
HasForeignKeyTT "
(TT" #
dTT# $
=>TT% '
dTT( )
.TT) *
IdUsuarioDisciplinaTT* =
)TT= >
.UU 
OnDeleteUU 
(UU 
DeleteBehaviorUU ,
.UU, -
CascadeUU- 4
)UU4 5
.VV 
HasConstraintNameVV &
(VV& '
$strVV' `
)VV` a
;VVa b
}WW 
)WW 
;WW 
modelBuilderYY 
.YY 
EntityYY 
<YY  
UsuarioDisciplinaYY  1
>YY1 2
(YY2 3
entityYY3 9
=>YY: <
{ZZ 
entity\\ 
.\\ 
HasIndex\\ 
(\\  
e\\  !
=>\\" $
e\\% &
.\\& '"
DisciplinaIdDisciplina\\' =
)\\= >
.]] 
HasName]] 
(]] 
$str]] H
)]]H I
;]]I J
entity__ 
.__ 
HasIndex__ 
(__  
e__  !
=>__" $
e__% &
.__& '

UsuarioCpf__' 1
)__1 2
.`` 
HasName`` 
(`` 
$str`` E
)``E F
;``F G
entitybb 
.bb 
Propertybb 
(bb  
ebb  !
=>bb" $
ebb% &
.bb& '
IdUsuarioDisciplinabb' :
)bb: ;
.bb; <
HasColumnNamebb< I
(bbI J
$strbbJ `
)bb` a
;bba b
entitydd 
.dd 
Propertydd 
(dd  
edd  !
=>dd" $
edd% &
.dd& '"
DisciplinaIdDisciplinadd' =
)dd= >
.dd> ?
HasColumnNamedd? L
(ddL M
$strddM f
)ddf g
;ddg h
entitygg 
.gg 
HasOnegg 
(gg 
dgg 
=>gg  "
dgg# $
.gg$ %,
 DisciplinaIdDisciplinaNavigationgg% E
)ggE F
.hh 
WithManyhh 
(hh 
phh 
=>hh  "
phh# $
.hh$ %
UsuarioDisciplinahh% 6
)hh6 7
.ii 
HasForeignKeyii "
(ii" #
dii# $
=>ii% '
dii( )
.ii) *"
DisciplinaIdDisciplinaii* @
)ii@ A
.jj 
OnDeletejj 
(jj 
DeleteBehaviorjj ,
.jj, -
Cascadejj- 4
)jj4 5
.kk 
HasConstraintNamekk &
(kk& '
$strkk' N
)kkN O
;kkO P
entitymm 
.mm 
HasOnemm 
(mm 
dmm 
=>mm  "
dmm# $
.mm$ % 
UsuarioCpfNavigationmm% 9
)mm9 :
.nn 
WithManynn 
(nn 
pnn 
=>nn  "
pnn# $
.nn$ %
UsuarioDisciplinann% 6
)nn6 7
.oo 
HasForeignKeyoo "
(oo" #
doo# $
=>oo% '
doo( )
.oo) *

UsuarioCpfoo* 4
)oo4 5
.pp 
OnDeletepp 
(pp 
DeleteBehaviorpp ,
.pp, -
Cascadepp- 4
)pp4 5
.qq 
HasConstraintNameqq &
(qq& '
$strqq' K
)qqK L
;qqL M
}rr 
)rr 
;rr "
OnModelCreatingPartialtt "
(tt" #
modelBuildertt# /
)tt/ 0
;tt0 1
}uu 	
partialww 
voidww "
OnModelCreatingPartialww +
(ww+ ,
ModelBuilderww, 8
modelBuilderww9 E
)wwE F
;wwF G
}xx 
}yy ±
+C:\Repositorio\Backend\Models\Disciplina.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 

Disciplina #
{ 
public		 

Disciplina		 
(		 
)		 
{

 	

Atividades 
= 
new 
HashSet $
<$ %
	Atividade% .
>. /
(/ 0
)0 1
;1 2
UsuarioDisciplina 
= 
new  #
HashSet$ +
<+ ,
UsuarioDisciplina, =
>= >
(> ?
)? @
;@ A
} 	
[ 	
Key	 
] 
public 
int 
IdDisciplina 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Materia 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Turno 
{ 
get !
;! "
set# &
;& '
}( )
public 
virtual 
ICollection "
<" #
	Atividade# ,
>, -

Atividades. 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
virtual 
ICollection "
<" #
UsuarioDisciplina# 4
>4 5
UsuarioDisciplina6 G
{H I
getJ M
;M N
setO R
;R S
}T U
} 
} ¯
'C:\Repositorio\Backend\Models\Escola.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 
Escola 
{ 
public		 
Escola		 
(		 
)		 
{

 	
Usuario 
= 
new 
HashSet !
<! "
Usuario" )
>) *
(* +
)+ ,
;, -
} 	
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Cnpj 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Telefone 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
virtual 
ICollection "
<" #
Usuario# *
>* +
Usuario, 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
} œ
(C:\Repositorio\Backend\Models\Usuario.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 
Usuario  
{		 
public

 
Usuario

 
(

 
)

 
{ 	
UsuarioDisciplina 
= 
new  #
HashSet$ +
<+ ,
UsuarioDisciplina, =
>= >
(> ?
)? @
;@ A
} 	
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Cpf 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Required	 
( 
ErrorMessage 
=  
$str! A
)A B
]B C
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
TipoUsuarioEnum 
TipoUsuario *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
public 
DateTime 
DataNascimento &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
NomeSobrenome #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[   	
StringLength  	 
(   
$num   
)   
]   
public!! 
string!! 
Telefone!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
["" 	
StringLength""	 
("" 
$num"" 
)"" 
]"" 
[## 	
Required##	 
]## 
public$$ 
string$$ 

EscolaCnpj$$  
{$$! "
get$$# &
;$$& '
set$$( +
;$$+ ,
}$$- .
public&& 
virtual&& 
Escola&&  
EscolaCnpjNavigation&& 2
{&&3 4
get&&5 8
;&&8 9
set&&: =
;&&= >
}&&? @
public'' 
virtual'' 
ICollection'' "
<''" #
UsuarioDisciplina''# 4
>''4 5
UsuarioDisciplina''6 G
{''H I
get''J M
;''M N
set''O R
;''R S
}''T U
}(( 
public)) 

enum)) 
TipoUsuarioEnum)) 
{** 
[++ 	

EnumMember++	 
(++ 
Value++ 
=++ 
$str++ #
)++# $
]++$ %
Aluno,, 
,,, 
[-- 	

EnumMember--	 
(-- 
Value-- 
=-- 
$str-- '
)--' (
]--( )
	Professor.. 
,.. 
[// 	

EnumMember//	 
(// 
Value// 
=// 
$str// )
)//) *
]//* +
Responsavel00 
,00 
[11 	

EnumMember11	 
(11 
Value11 
=11 
$str11 !
)11! "
]11" #
Adm22 
}33 
}44 ¿
2C:\Repositorio\Backend\Models\UsuarioDisciplina.cs
	namespace 	
BackEnd
 
. 
Models 
{ 
public 

partial 
class 
UsuarioDisciplina *
{ 
public		 
UsuarioDisciplina		  
(		  !
)		! "
{

 	&
AtividadeUsuarioDisciplina &
=' (
new) ,
HashSet- 4
<4 5
AtividadeUsuario5 E
>E F
(F G
)G H
;H I
} 	
[ 	
Key	 
] 
public 
int 
IdUsuarioDisciplina &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
Required	 
] 
public 
string 

UsuarioCpf  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
int "
DisciplinaIdDisciplina )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 

Disciplina !,
 DisciplinaIdDisciplinaNavigation" B
{C D
getE H
;H I
setJ M
;M N
}O P
public 
virtual 
Usuario  
UsuarioCpfNavigation 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
ICollection "
<" #
AtividadeUsuario# 3
>3 4&
AtividadeUsuarioDisciplina5 O
{P Q
getR U
;U V
setW Z
;Z [
}\ ]
} 
} ˆ	
!C:\Repositorio\Backend\Program.cs
	namespace

 	
BackEnd


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ®
/C:\Repositorio\Backend\Services\TokenService.cs
	namespace 	
BackEnd
 
. 
Services 
{ 
public 

static 
class 
TokenService $
{ 
public 
static 
string 
GenerateToken *
(* +
Usuario+ 2
usuario3 :
): ;
{ 	
var 
tokenHandler 
= 
new "#
JwtSecurityTokenHandler# :
(: ;
); <
;< =
var 
key 
= 
Encoding 
. 
ASCII $
.$ %
GetBytes% -
(- .
Settings. 6
.6 7
Secret7 =
)= >
;> ?
var 
tokenDescriptor 
=  !
new" %#
SecurityTokenDescriptor& =
{ 
Issuer 
= 
Settings !
.! "
Issuer" (
,( )
Audience 
= 
Settings #
.# $
Audience$ ,
,, -
Subject 
= 
new 
ClaimsIdentity ,
(, -
new- 0
Claim1 6
[6 7
]7 8
{ 
new 
Claim 
( 

ClaimTypes (
.( )
Email) .
,. /
usuario0 7
.7 8
Email8 =
.= >
ToString> F
(F G
)G H
)H I
,I J
new 
Claim 
( 

ClaimTypes (
.( )
Role) -
,- .
usuario/ 6
.6 7
TipoUsuario7 B
.B C
ToStringC K
(K L
)L M
)M N
} 
) 
, 
Expires 
= 
DateTime "
." #
UtcNow# )
.) *
AddHours* 2
(2 3
$num3 4
)4 5
,5 6
SigningCredentials "
=# $
new% (
SigningCredentials) ;
(; <
new< ? 
SymmetricSecurityKey@ T
(T U
keyU X
)X Y
,Y Z
SecurityAlgorithmsZ l
.l m 
HmacSha256Signature	m Ä
)
Ä Å
} 
; 
var   
token   
=   
tokenHandler   $
.  $ %
CreateToken  % 0
(  0 1
tokenDescriptor  1 @
)  @ A
;  A B
return!! 
tokenHandler!! 
.!!  

WriteToken!!  *
(!!* +
token!!+ 0
)!!0 1
;!!1 2
}$$ 	
}%% 
}&& Ÿ
"C:\Repositorio\Backend\Settings.cs
	namespace 	
BackEnd
 
{ 
public 

static 
class 
Settings  
{		 
public

 
static

 
string

 
Secret

 #
=

$ %
$str

& 9
;

9 :
public 
static 
string 
Issuer #
=$ %
$str& /
;/ 0
public 
static 
string 
Audience %
=& '
$str( 4
;4 5
} 
} ™M
!C:\Repositorio\Backend\Startup.cs
	namespace   	
BackEnd  
 
{!! 
public"" 

class"" 
Startup"" 
{## 
public$$ 
Startup$$ 
($$ 
IConfiguration$$ %
configuration$$& 3
)$$3 4
{%% 	
Configuration&& 
=&& 
configuration&& )
;&&) *
}'' 	
public)) 
IConfiguration)) 
Configuration)) +
{)), -
get)). 1
;))1 2
}))3 4
public,, 
void,, 
ConfigureServices,, %
(,,% &
IServiceCollection,,& 8
services,,9 A
),,A B
{-- 	
services.. 
... 
AddCors.. 
(.. 
).. 
;.. 
services// 
.// 
	AddScoped// 
<// 
TokenEmailFilter// /
>/// 0
(//0 1
)//1 2
;//2 3
services00 
.00 
AddControllers00 #
(00# $
)00$ %
.00% &
AddNewtonsoftJson00& 7
(007 8
options008 ?
=>00@ B
{11 
options22 
.22 
SerializerSettings22 *
.22* +
ContractResolver22+ ;
=22< =
new22> A#
DefaultContractResolver22B Y
(22Y Z
)22Z [
;22[ \
options33 
.33 
SerializerSettings33 *
.33* +!
ReferenceLoopHandling33+ @
=33A B

Newtonsoft33C M
.33M N
Json33N R
.33R S!
ReferenceLoopHandling33S h
.33h i
Ignore33i o
;33o p
}44 
)44 
;44 
services66 
.66 
AddDbContextPool66 %
<66% &
DatabaseContext66& 5
>665 6
(666 7
options667 >
=>66? A
options66B I
.88 
UseMySql88 
(88 
Configuration88 '
.88' (
GetConnectionString88( ;
(88; <
$str88< C
)88C D
,88D E
mySqlOptions88F R
=>88S U
mySqlOptions88V b
.99 
ServerVersion99 "
(99" #
new99# &
ServerVersion99' 4
(994 5
new995 8
Version999 @
(99@ A
$num99A B
,99B C
$num99D E
,99E F
$num99G I
)99I J
,99J K

ServerType99L V
.99V W
MySql99W \
)99\ ]
)99] ^
):: 
):: 
;:: 
services@@ 
.@@ 
AddSwaggerGen@@ "
(@@" #
c@@# $
=>@@% '
{AA 
cBB 
.BB 

SwaggerDocBB 
(BB 
$strBB !
,BB! "
newBB# &
OpenApiInfoBB' 2
{BB3 4
TitleBB5 :
=BB; <
$strBB= E
,BBE F
VersionBBG N
=BBO P
$strBBQ U
,BBU V
DescriptionBBW b
=BBc d
$str	BBe î
,
BBî ï
Contact
BBñ ù
=
BBû ü
new
BB† £
OpenApiContact
BB§ ≤
{
BB≥ ¥
Email
BBµ ∫
=
BBª º
$str
BBΩ Ê
,
BBÊ Á
Name
BBË Ï
=
BBÌ Ó
$str
BBÔ ç
}
BBé è
}
BBê ë
)
BBë í
;
BBí ì
stringCC 
caminhoAplicacaoCC '
=CC( )
PlatformServicesDD !
.DD! "
DefaultDD" )
.DD) *
ApplicationDD* 5
.DD5 6
ApplicationBasePathDD6 I
;DDI J
stringEE 
nomeAplicacaoEE $
=EE% &
PlatformServicesFF $
.FF$ %
DefaultFF% ,
.FF, -
ApplicationFF- 8
.FF8 9
ApplicationNameFF9 H
;FFH I
stringGG 
caminhoXmlDocGG $
=GG% &
PathHH 
.HH 
CombineHH  
(HH  !
caminhoAplicacaoHH! 1
,HH1 2
$"HH3 5
{HH5 6
nomeAplicacaoHH6 C
}HHC D
.xmlHHD H
"HHH I
)HHI J
;HHJ K
cJJ 
.JJ 
IncludeXmlCommentsJJ $
(JJ$ %
caminhoXmlDocJJ% 2
)JJ2 3
;JJ3 4
}KK 
)KK 
;KK 
varMM 
keyMM 
=MM 
EncodingMM 
.MM 
ASCIIMM $
.MM$ %
GetBytesMM% -
(MM- .
SettingsMM. 6
.MM6 7
SecretMM7 =
)MM= >
;MM> ?
servicesNN 
.NN 
AddAuthenticationNN &
(NN& '
xNN' (
=>NN) +
{OO 
xPP 
.PP %
DefaultAuthenticateSchemePP +
=PP, -
JwtBearerDefaultsPP. ?
.PP? @ 
AuthenticationSchemePP@ T
;PPT U
xQQ 
.QQ "
DefaultChallengeSchemeQQ (
=QQ) *
JwtBearerDefaultsQQ+ <
.QQ< = 
AuthenticationSchemeQQ= Q
;QQQ R
}RR 
)RR 
.RR 
AddJwtBearerRR 
(RR 
xRR 
=>RR  
{SS 
xTT 
.TT  
RequireHttpsMetadataTT &
=TT' (
falseTT) .
;TT. /
xUU 
.UU 
	SaveTokenUU 
=UU 
trueUU "
;UU" #
xVV 
.VV %
TokenValidationParametersVV +
=VV, -
newVV. 1%
TokenValidationParametersVV2 K
{WW $
ValidateIssuerSigningKeyXX ,
=XX- .
trueXX/ 3
,XX3 4
IssuerSigningKeyYY $
=YY% &
newYY' * 
SymmetricSecurityKeyYY+ ?
(YY? @
keyYY@ C
)YYC D
,YYD E
ValidateIssuerZZ "
=ZZ# $
falseZZ% *
,ZZ* +
ValidateAudience[[ $
=[[% &
false[[' ,
}\\ 
;\\ 
}]] 
)]] 
;]] 
var__ 
config__ 
=__ 
new__ 

AutoMapper__ '
.__' (
MapperConfiguration__( ;
(__; <
cfg__< ?
=>__@ B
{`` 
cfgaa 
.aa 
	CreateMapaa 
<aa 
UsuarioViewModelaa .
,aa. /
Usuarioaa0 7
>aa7 8
(aa8 9
)aa9 :
;aa: ;
cfgbb 
.bb 
	CreateMapbb 
<bb 5
)UsuarioDisciplinaCreateAndUpdateViewModelbb G
,bbG H
UsuarioDisciplinabbI Z
>bbZ [
(bb[ \
)bb\ ]
;bb] ^
cfgcc 
.cc 
	CreateMapcc 
<cc 
DisciplinaViewModelcc 1
,cc1 2

Disciplinacc3 =
>cc= >
(cc> ?
)cc? @
;cc@ A
cfgdd 
.dd 
	CreateMapdd 
<dd 
AtividadeViewModeldd 0
,dd0 1
	Atividadedd2 ;
>dd; <
(dd< =
)dd= >
;dd> ?
cfgee 
.ee 
	CreateMapee 
<ee 
EscolaViewModelee -
,ee- .
Escolaee/ 5
>ee5 6
(ee6 7
)ee7 8
;ee8 9
cfgff 
.ff 
	CreateMapff 
<ff %
AtividadeUsuarioViewModelff 7
,ff7 8
AtividadeUsuarioff9 I
>ffI J
(ffJ K
)ffK L
;ffL M
}gg 
)gg 
;gg 
IMapperii 
mapperii 
=ii 
configii #
.ii# $
CreateMapperii$ 0
(ii0 1
)ii1 2
;ii2 3
serviceskk 
.kk 
AddSingletonkk !
(kk! "
mapperkk" (
)kk( )
;kk) *
}oo 	
publicrr 
voidrr 
	Configurerr 
(rr 
IApplicationBuilderrr 1
apprr2 5
,rr5 6
IWebHostEnvironmentrr7 J
envrrK N
)rrN O
{ss 	
apptt 
.tt 

UseSwaggertt 
(tt 
)tt 
;tt 
appvv 
.vv 
UseSwaggerUIvv 
(vv 
cvv 
=>vv !
{ww 
cxx 
.xx 
SwaggerEndpointxx !
(xx! "
$strxx" <
,xx< =
$strxx> I
)xxI J
;xxJ K
}yy 
)yy 
;yy 
if{{ 
({{ 
env{{ 
.{{ 
IsDevelopment{{ !
({{! "
){{" #
){{# $
{|| 
app}} 
.}} %
UseDeveloperExceptionPage}} -
(}}- .
)}}. /
;}}/ 0
}~~ 
app
ÄÄ 
.
ÄÄ 

UseRouting
ÄÄ 
(
ÄÄ 
)
ÄÄ 
;
ÄÄ 
app
ÇÇ 
.
ÇÇ 
UseCors
ÇÇ 
(
ÇÇ 
x
ÇÇ 
=>
ÇÇ 
x
ÇÇ 
.
ÉÉ 
AllowAnyOrigin
ÉÉ 
(
ÉÉ 
)
ÉÉ 
.
ÑÑ 
AllowAnyMethod
ÑÑ 
(
ÑÑ 
)
ÑÑ 
.
ÖÖ 
AllowAnyHeader
ÖÖ 
(
ÖÖ 
)
ÖÖ 
)
ÖÖ  
;
ÖÖ  !
app
áá 
.
áá 
UseAuthentication
áá !
(
áá! "
)
áá" #
;
áá# $
app
àà 
.
àà 
UseAuthorization
àà  
(
àà  !
)
àà! "
;
àà" #
app
ää 
.
ää 
UseEndpoints
ää 
(
ää 
	endpoints
ää &
=>
ää' )
{
ãã 
	endpoints
åå 
.
åå 
MapControllers
åå (
(
åå( )
)
åå) *
;
åå* +
}
çç 
)
çç 
;
çç 
}
éé 	
}
èè 
}êê ˛
YC:\Repositorio\Backend\ViewModel\AtividadeUsuario\AtividadeUsuarioEDisciplinaViewModel.cs
public 
class 0
$AtividadeUsuarioEDisciplinaViewModel 1
{ 
public 

List 
< 
AtividadeUsuario  
>  !
AtividadesUsuario# 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 

List 
< 

Disciplina 
> 
Disciplinas '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} –
NC:\Repositorio\Backend\ViewModel\AtividadeUsuario\AtividadeUsuarioViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
. &
AtividadeUsuarioDisciplina 6
{ 
public		 

class		 %
AtividadeUsuarioViewModel		 *
{

 
public 
int 
IdAtividade 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
IdUsuarioDisciplina &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
double 
Total 
{ 
get !
;! "
set# &
;& '
}( )
} 
} °
@C:\Repositorio\Backend\ViewModel\Atividade\AtividadeViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
. 
	Atividade %
{ 
public		 

class		 
AtividadeViewModel		 #
{

 
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

Atividade1  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 
Valor 
{ 
get "
;" #
set$ '
;' (
}) *
public 
BackEnd 
. 
Models 
. 
StatusAtividadeEnum 1
StatusAtividade2 A
{B C
getD G
;G H
setI L
;L M
}N O
public 
DateTime 
DataEntrega #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
TipoAtividade #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
	Premiacao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
MoralAtividade $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
IdDisciplina 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ø	
CC:\Repositorio\Backend\ViewModel\Disciplinas\DisciplinaViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
. 
Disciplinas '
{ 
public 

class 
DisciplinaViewModel $
{		 
public

 
int

 
IdDisciplina

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Materia 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Turno 
{ 
get !
;! "
set# &
;& '
}( )
public 
virtual 
ICollection "
<" #5
)UsuarioDisciplinaCreateAndUpdateViewModel# L
>L M
UsuarioDisciplinaN _
{` a
getb e
;e f
setg j
;j k
}l m
} 
} ˜
:C:\Repositorio\Backend\ViewModel\Escola\EscolaViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
. 
Escola "
{ 
public 

class 
EscolaViewModel  
{		 
public

 
string

 
Cnpj

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Telefone 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ê
@C:\Repositorio\Backend\ViewModel\Premiacao\PremiacaoViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
. 
	Premiacao %
{ 
public 

class 
PremiacaoViewModel #
{		 
public

 
string

 
Aluno

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
	Premiacao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
IdAtividadeUsuario %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ∂
FC:\Repositorio\Backend\ViewModel\Ranking\RankingAtividadesViewModel.cs
public 
class &
RankingAtividadesViewModel '
{ 
public 
List	 
< 
RankingViewModel 
> 
Ranking  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public		 
List			 
<		 
AtividadeUsuario		 
>		 

Atividades		  *
{		+ ,
get		- 0
;		0 1
set		2 5
;		5 6
}		7 8
public 

List 
< 
PremiacaoViewModel "
>" #

Premiacoes$ .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} â
<C:\Repositorio\Backend\ViewModel\Ranking\RankingViewModel.cs
public 
class 
RankingViewModel 
{ 
public 

int 
IdUsuarioDisciplina "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

string 
Nome 
{ 
get 
; 
set !
;! "
}# $
public 

double 
Total 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
} å
_C:\Repositorio\Backend\ViewModel\UsuarioDisciplina\UsuarioDisciplinaCreateAndUpdateViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
{ 
public		 

class		 5
)UsuarioDisciplinaCreateAndUpdateViewModel		 :
{

 
public 
string 

UsuarioCpf  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int "
DisciplinaIdDisciplina )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} —
VC:\Repositorio\Backend\ViewModel\UsuarioDisciplina\UsuarioDIsciplinaSearchViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
{ 
public		 

class		 ,
 UsuarioDisciplinaSearchViewModel		 1
{

 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Tipo 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 

Disciplina 
> 
Disciplinas  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} º
HC:\Repositorio\Backend\ViewModel\Usuario\UsuarioAlterarSenhaViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
{ 
public 

class (
UsuarioAlterarSenhaViewModel -
{		 
public

 
string

 
Senha

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
} 
} «
AC:\Repositorio\Backend\ViewModel\Usuario\UsuarioLoginViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
{ 
public 

class !
UsuarioLoginViewModel &
{		 
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ˚
<C:\Repositorio\Backend\ViewModel\Usuario\UsuarioViewModel.cs
	namespace 	
BackEnd
 
. 
	ViewModel 
{ 
public		 

class		 
UsuarioViewModel		 !
{

 
public 
string 
Cpf 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
TipoUsuarioEnum 
TipoUsuario *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DateTime 
DataNascimento &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
NomeSobrenome #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Telefone 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

EscolaCnpj  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} 