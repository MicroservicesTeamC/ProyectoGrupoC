Ý,
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
)5 6
{   
if!! 
(!! 
albaran!! "
.!!" #
	Productos!!# ,
is!!- /
not!!0 3
null!!4 8
)!!8 9
foreach"" 
(""  !
var""! $
item""% )
in""* ,
albaran""- 4
.""4 5
	Productos""5 >
)""> ?
{## 
var$$ 
product$$  '
=$$( )
await$$* /
productoService$$0 ?
.$$? @
GetAsync$$@ H
($$H I
item$$I M
.$$M N

ProductoId$$N X
)$$X Y
;$$Y Z
if%% 
(%% 
product%% &
is%%' )
not%%* -
null%%. 2
)%%2 3
item&&  $
.&&$ %
Producto&&% -
=&&. /
product&&0 7
;&&7 8
}'' 
}(( 
return)) 
Ok)) 
()) 
	albaranes)) '
)))' (
;))( )
}** 
else++ 
{,, 
return-- 
NotFound-- #
(--# $
)--$ %
;--% &
}.. 
}00 
catch11 
(11 
	Exception11 
)11 
{22 
return33 

BadRequest33 !
(33! "
)33" #
;33# $
}44 
}55 	
[77 	
HttpGet77	 
(77 
$str77 
)77 
]77 
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
CaducidadAsync88) 7
(887 8
)888 9
{99 	
try:: 
{;; 
var<< 
	productos<< #
=<<$ %
await<<& +
productoService<<, ;
.<<; <
GetAllAsync<<< G
(<<G H
)<<H I
;<<I J
var== 
	caducados== 
=== 
	productos==  )
.==) *
FindAll==* 1
(==1 2
x==2 3
=>==4 6
x==7 8
.==8 9
	Caducidad==9 B
<===C E
DateTime==F N
.==N O
Now==O R
)==R S
.==S T
ToList==T Z
(==Z [
)==[ \
;==\ ]
var>> 
noCaducados>> 
=>>  !
	productos>>" +
.>>+ ,
FindAll>>, 3
(>>3 4
x>>4 5
=>>>6 8
x>>9 :
.>>: ;
	Caducidad>>; D
>>>E F
DateTime>>G O
.>>O P
Now>>P S
)>>S T
.>>T U
ToList>>U [
(>>[ \
)>>\ ]
;>>] ^
var?? 
	resultado?? 
=?? 
new??  #
{@@ 
	caducadosAA 
=AA 
	caducadosAA  )
,AA) *
noCaducadosBB 
=BB  !
noCaducadosBB" -
}CC 
;CC 
ifEE 
(EE 
	resultadoEE 
.EE 
	caducadosEE '
.EE' (
CountEE( -
>EE. /
$numEE0 1
||EE2 4
	resultadoEE5 >
.EE> ?
noCaducadosEE? J
.EEJ K
CountEEK P
>EEQ R
$numEES T
)EET U
{FF 
returnGG 
OkGG 
(GG 
	resultadoGG '
)GG' (
;GG( )
}HH 
elseII 
{JJ 
returnKK 
NotFoundKK #
(KK# $
)KK$ %
;KK% &
}LL 
}NN 
catchOO 
(OO 
	ExceptionOO 
)OO 
{PP 
returnQQ 

BadRequestQQ !
(QQ! "
)QQ" #
;QQ# $
}RR 
}SS" #
}TT 
}UU Ú
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