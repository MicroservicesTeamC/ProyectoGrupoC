è0
kC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Controllers\SearchController.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Controllers #
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
SearchController

 !
:

" #
ControllerBase

$ 2
{ 
private 
readonly 
IEstanteriaService +
estanteriaService, =
;= >
private 
readonly 
IProductoService )
productoService* 9
;9 :
private 
readonly 
IAlbaranService (
albaranService) 7
;7 8
public 
SearchController 
(  
IEstanteriaService  2
estanteriaService3 D
,D E
IProductoServiceF V
productoServiceW f
,f g
IAlbaranServiceh w
albaranService	x †
)
† ‡
{ 	
this 
. 
estanteriaService "
=# $
estanteriaService% 6
;6 7
this 
. 
productoService  
=! "
productoService# 2
;2 3
this 
. 
albaranService 
=  !
albaranService" 0
;0 1
} 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
IActionResult '
>' (
AlbaranAsync) 5
(5 6
string6 <
estanteriaId= I
)I J
{ 	
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *
estanteriaId* 6
)6 7
)7 8
return9 ?

BadRequest@ J
(J K
)K L
;L M
try 
{ 
var 

estanteria 
=  
await! &
estanteriaService' 8
.8 9
GetAsync9 A
(A B
estanteriaIdB N
)N O
;O P
var 
	albaranes 
= 
await  %
albaranService& 4
.4 5
GetAsync5 =
(= >
estanteriaId> J
)J K
;K L
if"" 
("" 
	albaranes"" 
!=""  
null""! %
)""% &
{## 
foreach$$ 
($$ 
var$$  
albaran$$! (
in$$) +
	albaranes$$, 5
)$$5 6
{%% 
foreach&& 
(&&  !
var&&! $
item&&% )
in&&* ,
albaran&&- 4
.&&4 5
	Productos&&5 >
)&&> ?
{'' 
var(( 
product((  '
=((( )
await((* /
productoService((0 ?
.((? @
GetAsync((@ H
(((H I
item((I M
.((M N

ProductoId((N X
)((X Y
;((Y Z
item))  
.))  !
Producto))! )
=))* +
product)), 3
;))3 4
}** 
}++ 
return,, 
Ok,, 
(,, 
	albaranes,, '
),,' (
;,,( )
}-- 
else.. 
{// 
return00 
NotFound00 #
(00# $
)00$ %
;00% &
}11 
}33 
catch44 
(44 
	Exception44 
)44 
{55 
return66 

BadRequest66 !
(66! "
)66" #
;66# $
}77 
}88 	
[:: 	
HttpGet::	 
(:: 
$str:: 
):: 
]:: 
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
CaducidadAsync;;) 7
(;;7 8
);;8 9
{<< 	
try== 
{>> 
var?? 
	productos?? 
=?? 
await??  %
productoService??& 5
.??5 6
GetAllAsync??6 A
(??A B
)??B C
;??C D
var@@ 
	caducados@@ 
=@@ 
	productos@@  )
.@@) *
FindAll@@* 1
(@@1 2
x@@2 3
=>@@4 6
x@@7 8
.@@8 9
	Caducidad@@9 B
<=@@C E
DateTime@@F N
.@@N O
Now@@O R
)@@R S
.@@S T
ToList@@T Z
(@@Z [
)@@[ \
;@@\ ]
varAA 
noCaducadosAA 
=AA  !
	productosAA" +
.AA+ ,
FindAllAA, 3
(AA3 4
xAA4 5
=>AA6 8
xAA9 :
.AA: ;
	CaducidadAA; D
>AAE F
DateTimeAAG O
.AAO P
NowAAP S
)AAS T
.AAT U
ToListAAU [
(AA[ \
)AA\ ]
;AA] ^
varBB 
	resultadoBB 
=BB 
newBB  #
{CC 
	caducadosDD 
=DD 
	caducadosDD  )
,DD) *
noCaducadosEE 
=EE  !
noCaducadosEE" -
}FF 
;FF 
ifHH 
(HH 
	resultadoHH 
.HH 
	caducadosHH '
.HH' (
CountHH( -
>HH. /
$numHH0 1
&&HH2 4
	resultadoHH5 >
.HH> ?
	caducadosHH? H
.HHH I
CountHHI N
>HHO P
$numHHQ R
)HHR S
{II 
returnJJ 
OkJJ 
(JJ 
	resultadoJJ '
)JJ' (
;JJ( )
}KK 
elseLL 
{MM 
returnNN 
NotFoundNN #
(NN# $
)NN$ %
;NN% &
}OO 
}QQ 
catchRR 
(RR 
	ExceptionRR 
)RR 
{SS 
returnTT 

BadRequestTT !
(TT! "
)TT" #
;TT# $
}UU 
}VV 	
}WW 
}XX Ë
iC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Interfaces\IAlbaranService.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Interfaces "
{ 
public 

	interface 
IAlbaranService $
{ 
Task 
< 
ICollection 
< 
Albaran  
>  !
>! "
GetAsync# +
(+ ,
string, 2
estanteriaId3 ?
)? @
;@ A
} 
}		 ¬
lC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Interfaces\IEstanteriaService.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Interfaces "
{ 
public 

	interface 
IEstanteriaService '
{ 
Task 
< 

Estanteria 
? 
> 
GetAsync "
(" #
string# )
estanteriaId* 6
)6 7
;7 8
} 
}		 Ø
jC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Interfaces\IProductoService.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Interfaces "
{ 
public 

	interface 
IProductoService %
{ 
Task 
< 
Producto 
? 
> 
GetAsync  
(  !
string! '
id( *
)* +
;+ ,
Task 
< 
List 
< 
Producto 
> 
> 
GetAllAsync (
(( )
)) *
;* +
}		 
}

 ë
]C:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Models\Albaran.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Models 
{ 
public 

class 
Albaran 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
DateTime 
AlbaranDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
EstanteriaId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
List 
< 
AlbaranItem 
>  
	Productos! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
}		 
}

 Ï
aC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Models\AlbaranItem.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Models 
{ 
public 

class 
AlbaranItem 
{ 
public 
string 
	AlbaranId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 

ProductoId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
Cantidad 
{ 
get !
;! "
set# &
;& '
}( )
public		 
Producto		 
Producto		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} 
`C:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Models\Estanteria.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Models 
{ 
public 

class 

Estanteria 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
	Capacidad 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 Ê
^C:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Models\Producto.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Models 
{ 
public 

class 
Producto 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
double 
Precio 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TipoProducto 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
DateTime		 
	Caducidad		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} é
VC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
ConfigurationManager 
configuration "
=# $
builder% ,
., -
Configuration- :
;: ;
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder

 
.

 
Services

 
.

 #
AddEndpointsApiExplorer

 (
(

( )
)

) *
;

* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddHttpClient 
( 
$str 3
,3 4
c5 6
=>7 9
{ 
c 
. 
BaseAddress 
= 
new 
Uri 
( 
configuration )
[) *
$str* @
]@ A
)A B
;B C
} 
) 
; 
builder 
. 
Services 
. 
AddHttpClient 
( 
$str 1
,1 2
c3 4
=>5 7
{ 
c 
. 
BaseAddress 
= 
new 
Uri 
( 
configuration )
[) *
$str* >
]> ?
)? @
;@ A
} 
) 
; 
builder 
. 
Services 
. 
AddHttpClient 
( 
$str /
,/ 0
c1 2
=>3 5
{ 
c 
. 
BaseAddress 
= 
new 
Uri 
( 
configuration )
[) *
$str* >
]> ?
)? @
;@ A
} 
) 
; 
builder 
. 
Services 
. 
	AddScoped 
< 
IEstanteriaService -
,- .
EstanteriaService/ @
>@ A
(A B
)B C
;C D
builder 
. 
Services 
. 
	AddScoped 
< 
IProductoService +
,+ ,
ProductosService- =
>= >
(> ?
)? @
;@ A
builder 
. 
Services 
. 
	AddScoped 
< 
IAlbaranService *
,* +
AlbaranService, :
>: ;
(; <
)< =
;= >
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if!! 
(!! 
app!! 
.!! 
Environment!! 
.!! 
IsDevelopment!! !
(!!! "
)!!" #
)!!# $
{"" 
app## 
.## 

UseSwagger## 
(## 
)## 
;## 
app$$ 
.$$ 
UseSwaggerUI$$ 
($$ 
)$$ 
;$$ 
}%% 
app(( 
.(( 
UseAuthorization(( 
((( 
)(( 
;(( 
app** 
.** 
MapControllers** 
(** 
)** 
;** 
app,, 
.,, 
Run,, 
(,, 
),, 	
;,,	 
ÿ
fC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Services\AlbaranService.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Services  
{ 
public 

class 
AlbaranService 
:  !
IAlbaranService" 1
{ 
private		 
IHttpClientFactory		 "
httpClientFactory		# 4
;		4 5
public

 
AlbaranService

 
(

 
IHttpClientFactory

 0
httpClientFactory

1 B
)

B C
{ 	
this 
. 
httpClientFactory "
=# $
httpClientFactory% 6
;6 7
} 	
public 
async 
Task 
< 
ICollection %
<% &
Albaran& -
>- .
>. /
GetAsync0 8
(8 9
string9 ?

customerId@ J
)J K
{ 	
var 
client 
= 
httpClientFactory *
.* +
CreateClient+ 7
(7 8
$str8 H
)H I
;I J
var 
response 
= 
await  
client! '
.' (
GetAsync( 0
(0 1
$"1 3
$str3 ?
{? @

customerId@ J
}J K
"K L
)L M
;M N
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{ 
var 
content 
= 
await #
response$ ,
., -
Content- 4
.4 5
ReadAsStringAsync5 F
(F G
)G H
;H I
var 
orders 
= 
JsonConvert (
.( )
DeserializeObject) :
<: ;
ICollection; F
<F G
AlbaranG N
>N O
>O P
(P Q
contentQ X
)X Y
;Y Z
return 
orders 
; 
} 
return 
null 
; 
} 	
} 
} ½
iC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Services\EstanteriaService.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Services  
{ 
public 

class 
EstanteriaService "
:# $
IEstanteriaService% 7
{ 
private		 
readonly		 
IHttpClientFactory		 +
httpClientFactory		, =
;		= >
public 
EstanteriaService  
(  !
IHttpClientFactory! 3
httpClientFactory4 E
)E F
{ 	
this 
. 
httpClientFactory "
=# $
httpClientFactory% 6
;6 7
} 	
public 
async 
Task 
< 

Estanteria $
>$ %
GetAsync& .
(. /
string/ 5
estanteriaId6 B
)B C
{ 	
var 
client 
= 
httpClientFactory *
.* +
CreateClient+ 7
(7 8
$str8 L
)L M
;M N
var 
response 
= 
await  
client! '
.' (
GetAsync( 0
(0 1
$"1 3
$str3 B
{B C
estanteriaIdC O
}O P
"P Q
)Q R
;R S
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{ 
var 
content 
= 
await #
response$ ,
., -
Content- 4
.4 5
ReadAsStringAsync5 F
(F G
)G H
;H I
var 
orders 
= 
JsonConvert (
.( )
DeserializeObject) :
<: ;

Estanteria; E
>E F
(F G
contentG N
)N O
;O P
return 
orders 
; 
} 
return 
null 
; 
}   	
}!! 
}"" ¯
hC:\Users\vikyr\source\Repos\MicroservicesTeamC\ProyectoGrupoC\GrupoC.Search\Services\ProductosService.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Services  
{ 
public 

class 
ProductosService !
:" #
IProductoService$ 4
{ 
private		 
readonly		 
IHttpClientFactory		 +
httpClientFactory		, =
;		= >
public 
ProductosService 
(  
IHttpClientFactory  2
httpClientFactory3 D
)D E
{ 	
this 
. 
httpClientFactory "
=# $
httpClientFactory% 6
;6 7
} 	
public 
async 
Task 
< 
Producto "
>" #
GetAsync$ ,
(, -
string- 3
id4 6
)6 7
{ 	
var 
client 
= 
httpClientFactory *
.* +
CreateClient+ 7
(7 8
$str8 J
)J K
;K L
var 
response 
= 
await  
client! '
.' (
GetAsync( 0
(0 1
$"1 3
$str3 @
{@ A
idA C
}C D
"D E
)E F
;F G
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{ 
var 
content 
= 
await #
response$ ,
., -
Content- 4
.4 5
ReadAsStringAsync5 F
(F G
)G H
;H I
var 
product 
= 
JsonConvert )
.) *
DeserializeObject* ;
<; <
Producto< D
>D E
(E F
contentF M
)M N
;N O
return 
product 
; 
} 
return 
null 
; 
} 	
public 
async 
Task 
< 
List 
< 
Producto '
>' (
>( )
GetAllAsync* 5
(5 6
)6 7
{ 	
var   
client   
=   
httpClientFactory   *
.  * +
CreateClient  + 7
(  7 8
$str  8 J
)  J K
;  K L
var"" 
response"" 
="" 
await""  
client""! '
.""' (
GetAsync""( 0
(""0 1
$"""1 3
$str""3 C
"""C D
)""D E
;""E F
if## 
(## 
response## 
.## 
IsSuccessStatusCode## ,
)##, -
{$$ 
var%% 
content%% 
=%% 
await%% #
response%%$ ,
.%%, -
Content%%- 4
.%%4 5
ReadAsStringAsync%%5 F
(%%F G
)%%G H
;%%H I
var&& 
products&& 
=&& 
JsonConvert&& *
.&&* +
DeserializeObject&&+ <
<&&< =
List&&= A
<&&A B
Producto&&B J
>&&J K
>&&K L
(&&L M
content&&M T
)&&T U
;&&U V
return(( 
products(( 
;((  
})) 
return** 
null** 
;** 
}++ 	
},, 
}-- 