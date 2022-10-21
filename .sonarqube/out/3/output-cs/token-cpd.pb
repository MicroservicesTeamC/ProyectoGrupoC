À+
nD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Controllers\SearchController.cs
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
IProductoService )
productoService* 9
;9 :
private 
readonly 
IAlbaranService (
albaranService) 7
;7 8
public 
SearchController 
(  
IProductoService  0
productoService1 @
,@ A
IAlbaranServiceB Q
albaranServiceR `
)` a
{ 	
this 
. 
productoService  
=! "
productoService# 2
;2 3
this 
. 
albaranService 
=  !
albaranService" 0
;0 1
} 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
IActionResult '
>' (
AlbaranAsync) 5
(5 6
int6 9
estanteriaId: F
)F G
{ 	
try 
{ 
var 
	albaranes 
= 
await  %
albaranService& 4
.4 5
GetAsync5 =
(= >
estanteriaId> J
)J K
;K L
if 
( 
	albaranes 
!=  
null! %
)% &
{ 
foreach 
( 
var  
albaran! (
in) +
	albaranes, 5
.5 6
Where6 ;
(; <
x< =
=>> @
xA B
.B C
	ProductosC L
isM O
notP S
nullT X
)X Y
)Y Z
{   
foreach"" #
(""$ %
var""% (
item"") -
in"". 0
albaran""1 8
.""8 9
	Productos""9 B
)""B C
{## 
var$$  #
product$$$ +
=$$, -
await$$. 3
productoService$$4 C
.$$C D
GetAsync$$D L
($$L M
item$$M Q
.$$Q R

ProductoId$$R \
)$$\ ]
;$$] ^
if%%  "
(%%# $
product%%$ +
is%%, .
not%%/ 2
null%%3 7
)%%7 8
item&&$ (
.&&( )
Producto&&) 1
=&&2 3
product&&4 ;
;&&; <
}'' 
}** 
return++ 
Ok++ 
(++ 
	albaranes++ '
)++' (
;++( )
},, 
else-- 
{.. 
return// 
NotFound// #
(//# $
)//$ %
;//% &
}00 
}22 
catch33 
(33 
	Exception33 
)33 
{44 
return55 

BadRequest55 !
(55! "
)55" #
;55# $
}66 
}77 	
[99 	
HttpGet99	 
(99 
$str99 
)99 
]99 
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
CaducidadAsync::) 7
(::7 8
)::8 9
{;; 	
try<< 
{== 
var?? 
	productos?? 
=?? 
await??  %
productoService??& 5
.??5 6
GetAllAsync??6 A
(??A B
)??B C
;??C D
if@@ 
(@@ 
	productos@@ 
is@@ 
not@@  #
null@@$ (
)@@( )
{AA 
varBB 
	caducadosBB !
=BB" #
	productosBB$ -
.BB- .
FindAllBB. 5
(BB5 6
xBB6 7
=>BB8 :
xBB; <
.BB< =
	CaducidadBB= F
<=BBG I
DateTimeBBJ R
.BBR S
NowBBS V
)BBV W
.BBW X
ToListBBX ^
(BB^ _
)BB_ `
;BB` a
varCC 
noCaducadosCC #
=CC$ %
	productosCC& /
.CC/ 0
FindAllCC0 7
(CC7 8
xCC8 9
=>CC: <
xCC= >
.CC> ?
	CaducidadCC? H
>CCI J
DateTimeCCK S
.CCS T
NowCCT W
)CCW X
.CCX Y
ToListCCY _
(CC_ `
)CC` a
;CCa b
varDD 
	resultadoDD !
=DD" #
newDD$ '
{EE 
	caducadosFF !
=FF" #
	caducadosFF$ -
,FF- .
noCaducadosGG #
=GG$ %
noCaducadosGG& 1
}HH 
;HH 
returnJJ 
OkJJ 
(JJ 
	resultadoJJ '
)JJ' (
;JJ( )
}LL 
elseMM 
{NN 
returnOO 
NotFoundOO #
(OO# $
)OO$ %
;OO% &
}PP 
}RR 
catchSS 
(SS 
	ExceptionSS 
)SS 
{TT 
returnUU 

BadRequestUU !
(UU! "
)UU" #
;UU# $
}VV 
}WW" #
}XX 
}YY Ú
lD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Interfaces\IAlbaranService.cs
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
?! "
>" #
GetAsync$ ,
(, -
int- 0
estanteriaId1 =
)= >
;> ?
} 
}		 ¬
oD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Interfaces\IEstanteriaService.cs
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
(" #
int# &
estanteriaId' 3
)3 4
;4 5
} 
}		 ç
mD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Interfaces\IProductoService.cs
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
(  !
int! $
id% '
)' (
;( )
Task 
< 
List 
< 
Producto 
> 
? 
> 
GetAllAsync )
() *
)* +
;+ ,
}		 
}

 ÷
`D:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Models\Albaran.cs
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
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
DateTime 
AlbaranDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
EstanteriaId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List 
< 
AlbaranItem 
>  
?  !
	Productos" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
}		 
}

 Û
dD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Models\AlbaranItem.cs
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
public 
int 
	AlbaranId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 

ProductoId 
{ 
get  #
;# $
set% (
;( )
}* +
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
Producto		 
?		 
Producto		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} Ÿ
cD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Models\Estanteria.cs
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
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
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
 Ù
aD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Models\Producto.cs
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
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
? 
Nombre 
{ 
get  #
;# $
set% (
;( )
}* +
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
} ì
YD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Program.cs
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
¨
iD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Services\AlbaranService.cs
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
private		 
readonly		 
IHttpClientFactory		 +
httpClientFactory		, =
;		= >
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
?. /
>/ 0
GetAsync1 9
(9 :
int: =
estanteriaId> J
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
{? @
estanteriaId@ L
}L M
"M N
)N O
;O P
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
} Ì
lD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Services\EstanteriaService.cs
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
?$ %
>% &
GetAsync' /
(/ 0
int0 3
estanteriaId4 @
)@ A
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
}"" Í
kD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Services\ProductosService.cs
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
?" #
># $
GetAsync% -
(- .
int. 1
id2 4
)4 5
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
?( )
>) *
GetAllAsync+ 6
(6 7
)7 8
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
$str""3 F
"""F G
)""G H
;""H I
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