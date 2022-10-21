³+
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
)!!8 9
{"" 
foreach## #
(##$ %
var##% (
item##) -
in##. 0
albaran##1 8
.##8 9
	Productos##9 B
)##B C
{$$ 
var%%  #
product%%$ +
=%%, -
await%%. 3
productoService%%4 C
.%%C D
GetAsync%%D L
(%%L M
item%%M Q
.%%Q R

ProductoId%%R \
)%%\ ]
;%%] ^
if&&  "
(&&# $
product&&$ +
is&&, .
not&&/ 2
null&&3 7
)&&7 8
item''$ (
.''( )
Producto'') 1
=''2 3
product''4 ;
;''; <
}(( 
})) 
}-- 
return.. 
Ok.. 
(.. 
	albaranes.. '
)..' (
;..( )
}// 
else00 
{11 
return22 
NotFound22 #
(22# $
)22$ %
;22% &
}33 
}55 
catch66 
(66 
	Exception66 
)66 
{77 
return88 

BadRequest88 !
(88! "
)88" #
;88# $
}99 
}:: 	
[<< 	
HttpGet<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
CaducidadAsync==) 7
(==7 8
)==8 9
{>> 	
try?? 
{@@ 
varBB 
	productosBB 
=BB 
awaitBB  %
productoServiceBB& 5
.BB5 6
GetAllAsyncBB6 A
(BBA B
)BBB C
;BBC D
ifCC 
(CC 
	productosCC 
isCC 
notCC  #
nullCC$ (
)CC( )
{DD 
varEE 
	caducadosEE !
=EE" #
	productosEE$ -
.EE- .
FindAllEE. 5
(EE5 6
xEE6 7
=>EE8 :
xEE; <
.EE< =
	CaducidadEE= F
<=EEG I
DateTimeEEJ R
.EER S
NowEES V
)EEV W
.EEW X
ToListEEX ^
(EE^ _
)EE_ `
;EE` a
varFF 
noCaducadosFF #
=FF$ %
	productosFF& /
.FF/ 0
FindAllFF0 7
(FF7 8
xFF8 9
=>FF: <
xFF= >
.FF> ?
	CaducidadFF? H
>FFI J
DateTimeFFK S
.FFS T
NowFFT W
)FFW X
.FFX Y
ToListFFY _
(FF_ `
)FF` a
;FFa b
varGG 
	resultadoGG !
=GG" #
newGG$ '
{HH 
	caducadosII !
=II" #
	caducadosII$ -
,II- .
noCaducadosJJ #
=JJ$ %
noCaducadosJJ& 1
}KK 
;KK 
returnMM 
OkMM 
(MM 
	resultadoMM '
)MM' (
;MM( )
}OO 
elsePP 
{QQ 
returnRR 
NotFoundRR #
(RR# $
)RR$ %
;RR% &
}SS 
}UU 
catchVV 
(VV 
	ExceptionVV 
)VV 
{WW 
returnXX 

BadRequestXX !
(XX! "
)XX" #
;XX# $
}YY 
}ZZ" #
}[[ 
}\\ Ú
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
} ‚6
YD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
var 
retryPolicy 
= 
GetRetryPolicy  
(  !
)! "
;" #
var  
circuitBreakerPolicy 
= #
GetCircuitBreakerPolicy 2
(2 3
)3 4
;4 5
ConfigurationManager		 
configuration		 "
=		# $
builder		% ,
.		, -
Configuration		- :
;		: ;
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddHttpClient 
( 
$str 3
,3 4
c5 6
=>7 9
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
$str* @
]@ A
)A B
;B C
} 
) 
. 
SetHandlerLifetime 
( 
TimeSpan  
.  !
FromMinutes! ,
(, -
$num- .
). /
)/ 0
. 
AddPolicyHandler 
( 
retryPolicy !
)! "
. 
AddPolicyHandler 
(  
circuitBreakerPolicy *
)* +
;+ ,
builder 
. 
Services 
. 
AddHttpClient 
( 
$str 1
,1 2
c3 4
=>5 7
{ 
c 
. 
BaseAddress 
= 
new 
Uri 
( 
configuration )
[) *
$str* >
]> ?
)? @
;@ A
} 
) 
. 
SetHandlerLifetime 
( 
TimeSpan  
.  !
FromMinutes! ,
(, -
$num- .
). /
)/ 0
. 
AddPolicyHandler 
( 
retryPolicy !
)! "
. 
AddPolicyHandler 
(  
circuitBreakerPolicy *
)* +
;+ ,
;- .
builder 
. 
Services 
. 
AddHttpClient 
( 
$str /
,/ 0
c1 2
=>3 5
{   
c!! 
.!! 
BaseAddress!! 
=!! 
new!! 
Uri!! 
(!! 
configuration!! )
[!!) *
$str!!* >
]!!> ?
)!!? @
;!!@ A
}"" 
)"" 
.## 
SetHandlerLifetime## 
(## 
TimeSpan##  
.##  !
FromMinutes##! ,
(##, -
$num##- .
)##. /
)##/ 0
.$$ 
AddPolicyHandler$$ 
($$ 
retryPolicy$$ !
)$$! "
.%% 
AddPolicyHandler%% 
(%%  
circuitBreakerPolicy%% *
)%%* +
;%%+ ,
;%%- .
builder'' 
.'' 
Services'' 
.'' 
	AddScoped'' 
<'' 
IEstanteriaService'' -
,''- .
EstanteriaService''/ @
>''@ A
(''A B
)''B C
;''C D
builder(( 
.(( 
Services(( 
.(( 
	AddScoped(( 
<(( 
IProductoService(( +
,((+ ,
ProductosService((- =
>((= >
(((> ?
)((? @
;((@ A
builder)) 
.)) 
Services)) 
.)) 
	AddScoped)) 
<)) 
IAlbaranService)) *
,))* +
AlbaranService)), :
>)): ;
()); <
)))< =
;))= >
var++ 
app++ 
=++ 	
builder++
 
.++ 
Build++ 
(++ 
)++ 
;++ 
if.. 
(.. 
app.. 
... 
Environment.. 
... 
IsDevelopment.. !
(..! "
).." #
)..# $
{// 
app00 
.00 

UseSwagger00 
(00 
)00 
;00 
app11 
.11 
UseSwaggerUI11 
(11 
)11 
;11 
}22 
app55 
.55 
UseAuthorization55 
(55 
)55 
;55 
app77 
.77 
MapControllers77 
(77 
)77 
;77 
app99 
.99 
Run99 
(99 
)99 	
;99	 

static>> 
IAsyncPolicy>> 
<>> 
HttpResponseMessage>> '
>>>' (#
GetCircuitBreakerPolicy>>) @
(>>@ A
)>>A B
{?? 
return@@ 
 
HttpPolicyExtensions@@ 
.AA 	$
HandleTransientHttpErrorAA	 !
(AA! "
)AA" #
.BB 	
CircuitBreakerAsyncBB	 
(BB 
$numBB 
,BB 
TimeSpanBB  (
.BB( )
FromSecondsBB) 4
(BB4 5
$numBB5 7
)BB7 8
)BB8 9
;BB9 :
}CC 
staticEE 
IAsyncPolicyEE 
<EE 
HttpResponseMessageEE '
>EE' (
GetRetryPolicyEE) 7
(EE7 8
)EE8 9
{FF 
returnGG 
 
HttpPolicyExtensionsGG 
.HH 	$
HandleTransientHttpErrorHH	 !
(HH! "
)HH" #
.II 	
OrResultII	 
(II 
msgII 
=>II 
msgII 
.II 

StatusCodeII '
==II( *
SystemII+ 1
.II1 2
NetII2 5
.II5 6
HttpStatusCodeII6 D
.IID E
NotFoundIIE M
)IIM N
.JJ 	
WaitAndRetryAsyncJJ	 
(JJ 
$numJJ 
,JJ 
retryAttemptJJ *
=>JJ+ -
TimeSpanJJ. 6
.JJ6 7
FromSecondsJJ7 B
(JJB C
MathJJC G
.JJG H
PowJJH K
(JJK L
$numJJL M
,JJM N
retryAttemptKK 
)KK 
)KK 
)KK 
;KK 
}LL ¨
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