°*
nD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Controllers\SearchController.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Controllers #
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
SearchController !
:" #
ControllerBase$ 2
{ 
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
IProductoService  0
productoService1 @
,@ A
IAlbaranServiceB Q
albaranServiceR `
)` a
{ 	
this 
. 
productoService  
=! "
productoService# 2
;2 3
this 
. 
albaranService 
=  !
albaranService" 0
;0 1
} 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
IActionResult '
>' (
AlbaranAsync) 5
(5 6
int6 9
estanteriaId: F
)F G
{ 	
var 
	albaranes 
= 
await  %
albaranService& 4
.4 5
GetAsync5 =
(= >
estanteriaId> J
)J K
;K L
if 
( 
	albaranes 
!=  
null! %
)% &
{ 
foreach 
( 
var  
albaran! (
in) +
	albaranes, 5
.5 6
Where6 ;
(; <
x< =
=>> @
xA B
.B C
	ProductosC L
isM O
notP S
nullT X
)X Y
.Y Z
SelectZ `
(` a
ya b
=>c e
yf g
.g h
	Productosh q
)q r
)r s
{ 
if   
(   
albaran   "
is  # %
not  & )
null  * .
)  . /
{!! 
foreach"" #
(""$ %
var""% (
item"") -
in"". 0
albaran""1 8
)""8 9
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
(%%" #
product%%# *
is%%+ -
not%%. 1
null%%2 6
)%%6 7
item&&$ (
.&&( )
Producto&&) 1
=&&2 3
product&&4 ;
;&&; <
}'' 
}(( 
})) 
return** 
Ok** 
(** 
	albaranes** '
)**' (
;**( )
}++ 
return-- 
NotFound-- 
(--  
)--  !
;--! "
}00 	
[22 	
HttpGet22	 
(22 
$str22 
)22 
]22 
public33 
async33 
Task33 
<33 
IActionResult33 '
>33' (
CaducidadAsync33) 7
(337 8
)338 9
{44 	
var77 
	productos77 
=77 
await77  %
productoService77& 5
.775 6
GetAllAsync776 A
(77A B
)77B C
;77C D
if88 
(88 
	productos88 
is88 
not88  #
null88$ (
&&88) +
	productos88, 5
.885 6
Count886 ;
>88< =
$num88> ?
)88? @
{99 
var:: 
	caducados:: !
=::" #
	productos::$ -
.::- .
FindAll::. 5
(::5 6
x::6 7
=>::8 :
x::; <
.::< =
	Caducidad::= F
<=::G I
DateTime::J R
.::R S
Now::S V
)::V W
.::W X
ToList::X ^
(::^ _
)::_ `
;::` a
var;; 
noCaducados;; #
=;;$ %
	productos;;& /
.;;/ 0
FindAll;;0 7
(;;7 8
x;;8 9
=>;;: <
x;;= >
.;;> ?
	Caducidad;;? H
>;;I J
DateTime;;K S
.;;S T
Now;;T W
);;W X
.;;X Y
ToList;;Y _
(;;_ `
);;` a
;;;a b
var<< 
	resultado<< !
=<<" #
new<<$ '
{== 
	caducados>> !
=>>" #
	caducados>>$ -
,>>- .
noCaducados?? #
=??$ %
noCaducados??& 1
}@@ 
;@@ 
returnBB 
OkBB 
(BB 
	resultadoBB '
)BB' (
;BB( )
}DD 
elseEE 
{FF 
returnGG 
NotFoundGG #
(GG# $
)GG$ %
;GG% &
}HH 
}LL 	
}MM 
}NN 
uD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Exceptions\AlbaranNotFoundException.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Exceptions "
{ 
[ 
Serializable 
] 
public 

class $
AlbaranNotFoundException )
:* +
	Exception, 5
{ 
public 
int 
ModuloId 
{ 
get !
;! "
}# $
public		 $
AlbaranNotFoundException		 '
(		' (
)		( )
{		* +
}		, -
public $
AlbaranNotFoundException '
(' (
string( .
message/ 6
)6 7
: 
base 
( 
message 
) 
{ 
} 
public $
AlbaranNotFoundException '
(' (
string( .
message/ 6
,6 7
	Exception8 A
innerB G
)G H
: 
base 
( 
message 
, 
inner !
)! "
{# $
}% &
public $
AlbaranNotFoundException '
(' (
string( .
message/ 6
,6 7
int8 ;
moduloId< D
)D E
:F G
thisH L
(L M
messageM T
)T U
{ 	
ModuloId 
= 
moduloId 
;  
} 	
} 
} ï
xD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Exceptions\DataBaseConnectionException.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Exceptions "
{ 
[ 
Serializable 
] 
public 

class '
DataBaseConnectionException ,
:- .
	Exception/ 8
{ 
public 
string 
RepositoryName $
{% &
get' *
;* +
}, -
=. /
String0 6
.6 7
Empty7 <
;< =
public '
DataBaseConnectionException *
(* +
)+ ,
{- .
}/ 0
public		 '
DataBaseConnectionException		 *
(		* +
string		+ 1
message		2 9
)		9 :
:

 
base

 
(

 
message

 
)

 
{

 
}

 
public '
DataBaseConnectionException *
(* +
string+ 1
message2 9
,9 :
	Exception; D
innerE J
)J K
: 
base 
( 
message 
, 
inner !
)! "
{# $
}% &
public '
DataBaseConnectionException *
(* +
string+ 1
message2 9
,9 :
string; A
repositoryNameB P
)P Q
:Q R
this 
( 
message 
) 
{ 	
this 
. 
RepositoryName 
=  !
repositoryName" 0
;0 1
} 	
} 
} Ã
xD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Exceptions\EstanteriaNotFoundException.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Exceptions "
{ 
[

 
Serializable

 
]

 
public 

class '
EstanteriaNotFoundException ,
:- .
	Exception/ 8
{ 
public 
int 
CursoId 
{ 
get  
;  !
}" #
public '
EstanteriaNotFoundException *
(* +
)+ ,
{- .
}/ 0
public '
EstanteriaNotFoundException *
(* +
string+ 1
message2 9
)9 :
: 
base 
( 
message 
) 
{ 
} 
public '
EstanteriaNotFoundException *
(* +
string+ 1
message2 9
,9 :
	Exception; D
innerE J
)J K
: 
base 
( 
message 
, 
inner !
)! "
{# $
}% &
public '
EstanteriaNotFoundException *
(* +
string+ 1
message2 9
,9 :
int; >
cursoId? F
)F G
: 	
this
 
( 
message 
) 
{ 	
CursoId 
= 
cursoId 
; 
} 	
public '
EstanteriaNotFoundException *
(* +
string+ 1
message2 9
,9 :
	Exception; D
innerE J
,J K
intL O
cursoIdP W
)W X
: 	
this
 
( 
message 
, 
inner 
) 
{ 	
CursoId 
= 
cursoId 
; 
}   	
}!! 
}"" ¬
pD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Exceptions\ExceptionMiddleware.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Exceptions "
{ 
public 

class 
ExceptionMiddleware $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILoggerManager '
_loggerManager( 6
;6 7
public		 
ExceptionMiddleware		 "
(		" #
RequestDelegate		# 2
next		3 7
,		7 8
ILoggerManager		9 G
loggerManager		H U
)		U V
{

 	
_next 
= 
next 
; 
_loggerManager 
= 
loggerManager *
;* +
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
httpContext2 =
)= >
{ 	
try 
{ 
await 
_next 
( 
httpContext '
)' (
;( )
} 
catch 
( 
	Exception 
ex 
)  
{ 
_loggerManager 
. 
LogError '
(' (
$"( *
$str* V
{V W
exW Y
.Y Z
ToStringZ b
(b c
)c d
}d e
"e f
)f g
;g h
httpContext 
. 
Response $
.$ %
Redirect% -
(- .
$str. 1
)1 2
;2 3
} 
} 	
} 
} Ω
zD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Exceptions\ExceptionMiddlewareExtensions.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Exceptions "
{ 
public 

static 
class )
ExceptionMiddlewareExtensions 5
{ 
public 
static 
IApplicationBuilder )"
UseExceptionMiddleware* @
(@ A
thisA E
IApplicationBuilderF Y
builderZ a
)a b
{ 	
return 
builder 
. 
UseMiddleware (
<( )
ExceptionMiddleware) <
>< =
(= >
)> ?
;? @
} 	
}		 
}

 ˆ
vD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Exceptions\ProductoNotFoundException.cs
	namespace 	
GrupoC
 
. 
Search 
. 

Exceptions "
{ 
[ 
Serializable 
] 
public 

class %
ProductoNotFoundException *
:+ ,
	Exception- 6
{ 
public 
int 
ModuloId 
{ 
get !
;! "
}# $
public %
ProductoNotFoundException (
(( )
)) *
{+ ,
}- .
public		 %
ProductoNotFoundException		 (
(		( )
string		) /
message		0 7
)		7 8
:

 
base

 
(

 
message

 
)

 
{

 
}

 
public %
ProductoNotFoundException (
(( )
string) /
message0 7
,7 8
	Exception9 B
innerC H
)H I
: 
base 
( 
message 
, 
inner !
)! "
{# $
}% &
public %
ProductoNotFoundException (
(( )
string) /
message0 7
,7 8
int9 <
moduloId= E
)E F
:G H
thisI M
(M N
messageN U
)U V
{ 	
ModuloId 
= 
moduloId 
;  
} 	
} 
} ⁄
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
}		 ¨
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
}		 Á
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
 “
nD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\LogsDirectory\ILoggerManager.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Logs 
{ 
public 

	interface 
ILoggerManager #
{ 
void 
LogInfo 
( 
string 
message #
)# $
;$ %
void 
LogWarn 
( 
string 
message #
)# $
;$ %
void 
LogDebug 
( 
string 
message $
)$ %
;% &
void 
LogError 
( 
string 
message $
)$ %
;% &
}		 
}

 ó
mD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\LogsDirectory\LoggerManager.cs
	namespace 	
GrupoC
 
. 
Search 
. 
Logs 
{ 
public 

class 
LoggerManager 
:  
ILoggerManager! /
{ 
private 
static 
readonly 
ILogger  '
logger( .
=/ 0

LogManager1 ;
.; <!
GetCurrentClassLogger< Q
(Q R
)R S
;S T
public 
void 
LogDebug 
( 
string #
message$ +
)+ ,
=>- /
logger0 6
.6 7
Debug7 <
(< =
message= D
)D E
;E F
public		 
void		 
LogError		 
(		 
string		 #
message		$ +
)		+ ,
=>		- /
logger		0 6
.		6 7
Error		7 <
(		< =
message		= D
)		D E
;		E F
public

 
void

 
LogInfo

 
(

 
string

 "
message

# *
)

* +
=>

, .
logger

/ 5
.

5 6
Info

6 :
(

: ;
message

; B
)

B C
;

C D
public 
void 
LogWarn 
( 
string "
message# *
)* +
=>, .
logger/ 5
.5 6
Warn6 :
(: ;
message; B
)B C
;C D
} 
} ˜
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
 €
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
} ü
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
 Ÿ
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
} •?
YD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Program.cs
var

 
builder

 
=

 
WebApplication

 
.

 
CreateBuilder

 *
(

* +
args

+ /
)

/ 0
;

0 1

LogManager 

.
 
LoadConfiguration 
( 
string #
.# $
Concat$ *
(* +
	Directory+ 4
.4 5
GetCurrentDirectory5 H
(H I
)I J
,J K
$strL Z
)Z [
)[ \
;\ ]
var 
retryPolicy 
= 
GetRetryPolicy  
(  !
)! "
;" #
var  
circuitBreakerPolicy 
= #
GetCircuitBreakerPolicy 2
(2 3
)3 4
;4 5
ConfigurationManager 
configuration "
=# $
builder% ,
., -
Configuration- :
;: ;
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddHttpClient 
( 
$str 3
,3 4
c5 6
=>7 9
{ 
c 
. 
BaseAddress 
= 
new 
Uri 
( 
configuration )
[) *
$str* @
]@ A
)A B
;B C
} 
) 
. 
SetHandlerLifetime 
( 
TimeSpan  
.  !
FromMinutes! ,
(, -
$num- .
). /
)/ 0
. 
AddPolicyHandler 
( 
retryPolicy !
)! "
.   
AddPolicyHandler   
(    
circuitBreakerPolicy   *
)  * +
;  + ,
builder!! 
.!! 
Services!! 
.!! 
AddHttpClient!! 
(!! 
$str!! 1
,!!1 2
c!!3 4
=>!!5 7
{"" 
c## 
.## 
BaseAddress## 
=## 
new## 
Uri## 
(## 
configuration## )
[##) *
$str##* >
]##> ?
)##? @
;##@ A
}$$ 
)$$ 
.%% 
SetHandlerLifetime%% 
(%% 
TimeSpan%%  
.%%  !
FromMinutes%%! ,
(%%, -
$num%%- .
)%%. /
)%%/ 0
.&& 
AddPolicyHandler&& 
(&& 
retryPolicy&& !
)&&! "
.'' 
AddPolicyHandler'' 
(''  
circuitBreakerPolicy'' *
)''* +
;''+ ,
builder(( 
.(( 
Services(( 
.(( 
AddHttpClient(( 
((( 
$str(( /
,((/ 0
c((1 2
=>((3 5
{)) 
c** 
.** 
BaseAddress** 
=** 
new** 
Uri** 
(** 
configuration** )
[**) *
$str*** >
]**> ?
)**? @
;**@ A
}++ 
)++ 
.,, 
SetHandlerLifetime,, 
(,, 
TimeSpan,,  
.,,  !
FromMinutes,,! ,
(,,, -
$num,,- .
),,. /
),,/ 0
.-- 
AddPolicyHandler-- 
(-- 
retryPolicy-- !
)--! "
... 
AddPolicyHandler.. 
(..  
circuitBreakerPolicy.. *
)..* +
;..+ ,

LogManager00 

.00
 
LoadConfiguration00 
(00 
string00 #
.00# $
Concat00$ *
(00* +
	Directory00+ 4
.004 5
GetCurrentDirectory005 H
(00H I
)00I J
,00J K
$str00L Z
)00Z [
)00[ \
;00\ ]
builder11 
.11 
Services11 
.11 
AddSingleton11 
<11 
ILoggerManager11 ,
,11, -
LoggerManager11. ;
>11; <
(11< =
)11= >
;11> ?
builder22 
.22 
Services22 
.22 
	AddScoped22 
<22 
IEstanteriaService22 -
,22- .
EstanteriaService22/ @
>22@ A
(22A B
)22B C
;22C D
builder33 
.33 
Services33 
.33 
	AddScoped33 
<33 
IProductoService33 +
,33+ ,
ProductosService33- =
>33= >
(33> ?
)33? @
;33@ A
builder44 
.44 
Services44 
.44 
	AddScoped44 
<44 
IAlbaranService44 *
,44* +
AlbaranService44, :
>44: ;
(44; <
)44< =
;44= >
var66 
app66 
=66 	
builder66
 
.66 
Build66 
(66 
)66 
;66 
if99 
(99 
app99 
.99 
Environment99 
.99 
IsDevelopment99 !
(99! "
)99" #
)99# $
{:: 
app;; 
.;; 

UseSwagger;; 
(;; 
);; 
;;; 
app<< 
.<< 
UseSwaggerUI<< 
(<< 
)<< 
;<< 
}== 
if?? 
(?? 
app?? 
.?? 
Environment?? 
.?? 
IsProduction??  
(??  !
)??! "
)??" #
{@@ 
appAA 
.AA "
UseExceptionMiddlewareAA 
(AA 
)AA  
;AA  !
}BB 
appEE 
.EE 
UseAuthorizationEE 
(EE 
)EE 
;EE 
appGG 
.GG 
MapControllersGG 
(GG 
)GG 
;GG 
appII 
.II 
RunII 
(II 
)II 	
;II	 

staticNN 
IAsyncPolicyNN 
<NN 
HttpResponseMessageNN '
>NN' (#
GetCircuitBreakerPolicyNN) @
(NN@ A
)NNA B
{OO 
returnPP 
 
HttpPolicyExtensionsPP 
.QQ 	$
HandleTransientHttpErrorQQ	 !
(QQ! "
)QQ" #
.RR 	
CircuitBreakerAsyncRR	 
(RR 
$numRR 
,RR 
TimeSpanRR  (
.RR( )
FromSecondsRR) 4
(RR4 5
$numRR5 6
)RR6 7
)RR7 8
;RR8 9
}SS 
staticUU 
IAsyncPolicyUU 
<UU 
HttpResponseMessageUU '
>UU' (
GetRetryPolicyUU) 7
(UU7 8
)UU8 9
{VV 
returnWW 
 
HttpPolicyExtensionsWW 
.XX 	$
HandleTransientHttpErrorXX	 !
(XX! "
)XX" #
.YY 	
OrResultYY	 
(YY 
msgYY 
=>YY 
msgYY 
.YY 

StatusCodeYY '
==YY( *
SystemYY+ 1
.YY1 2
NetYY2 5
.YY5 6
HttpStatusCodeYY6 D
.YYD E
NotFoundYYE M
)YYM N
.ZZ 	
WaitAndRetryAsyncZZ	 
(ZZ 
$numZZ 
,ZZ 
retryAttemptZZ *
=>ZZ+ -
TimeSpanZZ. 6
.ZZ6 7
FromSecondsZZ7 B
(ZZB C
MathZZC G
.ZZG H
PowZZH K
(ZZK L
$numZZL M
,ZZM N
retryAttempt[[ 
)[[ 
)[[ 
)[[ 
;[[ 
}\\ Ω
iD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Services\AlbaranService.cs
	namespace		 	
GrupoC		
 
.		 
Search		 
.		 
Services		  
{

 
public 

class 
AlbaranService 
:  !
IAlbaranService" 1
{ 
private 
IHttpClientFactory "
httpClientFactory# 4
;4 5
readonly 
ILoggerManager 
LoggerManager  -
;- .
readonly 
ResourceManager  
resourceManager! 0
=1 2
new3 6
(6 7
$str7 b
,b c
Assemblyd l
.l m!
GetExecutingAssembly	m Å
(
Å Ç
)
Ç É
)
É Ñ
;
Ñ Ö
public 
AlbaranService 
( 
IHttpClientFactory 0
httpClientFactory1 B
,B C
ILoggerManagerD R
loggerManagerS `
)` a
{ 	
this 
. 
LoggerManager 
=  
loggerManager! .
;. /
this 
. 
LoggerManager 
. 
LogInfo &
(& '
$str' B
)B C
;C D
this 
. 
httpClientFactory "
=# $
httpClientFactory% 6
;6 7
} 	
public 
async 
Task 
< 
ICollection %
<% &
Albaran& -
>- .
?. /
>/ 0
GetAsync1 9
(9 :
int: =
estanteriaId> J
)J K
{ 	
this 
. 
LoggerManager 
. 
LogInfo &
(& '
$str' ?
)? @
;@ A
var 
client 
= 
httpClientFactory *
.* +
CreateClient+ 7
(7 8
$str8 H
)H I
;I J
var 
response 
= 
await  
client! '
.' (
GetAsync( 0
(0 1
$"1 3
$str3 ?
{? @
estanteriaId@ L
}L M
"M N
)N O
;O P
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{ 
var 
content 
= 
await #
response$ ,
., -
Content- 4
.4 5
ReadAsStringAsync5 F
(F G
)G H
;H I
var!! 
orders!! 
=!! 
JsonConvert!! (
.!!( )
DeserializeObject!!) :
<!!: ;
ICollection!!; F
<!!F G
Albaran!!G N
>!!N O
>!!O P
(!!P Q
content!!Q X
)!!X Y
;!!Y Z
return"" 
orders"" 
;"" 
}## 
if$$ 
($$ 
resourceManager$$ 
is$$  "
not$$# &
null$$' +
)$$+ ,
{%% 
string&& 
?&& 
mensajeError&& $
=&&% &
resourceManager&&' 6
.&&6 7
	GetString&&7 @
(&&@ A
$str&&A R
)&&R S
;&&S T
if'' 
('' 
mensajeError''  
!=''! #
null''$ (
)''( )
{(( 
this)) 
.)) 
LoggerManager)) &
.))& '
LogWarn))' .
()). /
mensajeError))/ ;
))); <
;))< =
throw** 
new** $
AlbaranNotFoundException** 6
(**6 7
mensajeError**7 C
)**C D
;**D E
}++ 
}-- 
return.. 
null.. 
;.. 
}11 	
}22 
}33 ‰
lD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Services\EstanteriaService.cs
	namespace		 	
GrupoC		
 
.		 
Search		 
.		 
Services		  
{

 
public 

class 
EstanteriaService "
:# $
IEstanteriaService% 7
{ 
private 
readonly 
IHttpClientFactory +
httpClientFactory, =
;= >
readonly 
ILoggerManager 
LoggerManager  -
;- .
readonly 
ResourceManager  
resourceManager! 0
=1 2
new3 6
(6 7
$str7 b
,b c
Assemblyd l
.l m!
GetExecutingAssembly	m Å
(
Å Ç
)
Ç É
)
É Ñ
;
Ñ Ö
public 
EstanteriaService  
(  !
IHttpClientFactory! 3
httpClientFactory4 E
,E F
ILoggerManagerG U
loggerManagerV c
)c d
{ 	
this 
. 
LoggerManager 
=  
loggerManager! .
;. /
this 
. 
LoggerManager 
. 
LogInfo &
(& '
$str' E
)E F
;F G
this 
. 
httpClientFactory "
=# $
httpClientFactory% 6
;6 7
} 	
public 
async 
Task 
< 

Estanteria $
?$ %
>% &
GetAsync' /
(/ 0
int0 3
estanteriaId4 @
)@ A
{ 	
this 
. 
LoggerManager 
. 
LogInfo &
(& '
$str' B
)B C
;C D
var 
client 
= 
httpClientFactory *
.* +
CreateClient+ 7
(7 8
$str8 L
)L M
;M N
var 
response 
= 
await  
client! '
.' (
GetAsync( 0
(0 1
$"1 3
$str3 B
{B C
estanteriaIdC O
}O P
"P Q
)Q R
;R S
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{   
var!! 
content!! 
=!! 
await!! #
response!!$ ,
.!!, -
Content!!- 4
.!!4 5
ReadAsStringAsync!!5 F
(!!F G
)!!G H
;!!H I
var## 
orders## 
=## 
JsonConvert## (
.##( )
DeserializeObject##) :
<##: ;

Estanteria##; E
>##E F
(##F G
content##G N
)##N O
;##O P
return%% 
orders%% 
;%% 
}&& 
if'' 
('' 
resourceManager'' 
is'' !
not''" %
null''& *
)''* +
{(( 
string)) 
?)) 
mensajeError)) $
=))% &
resourceManager))' 6
.))6 7
	GetString))7 @
())@ A
$str))A U
)))U V
;))V W
if** 
(** 
mensajeError**  
is**! #
not**$ '
null**( ,
)**, -
{++ 
throw,, 
new,, '
EstanteriaNotFoundException,, 9
(,,9 :
mensajeError,,: F
),,F G
;,,G H
}-- 
}.. 
return// 
null// 
;// 
}00 	
}11 
}22 ”)
kD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Search\Services\ProductosService.cs
	namespace		 	
GrupoC		
 
.		 
Search		 
.		 
Services		  
{

 
public 

class 
ProductosService !
:" #
IProductoService$ 4
{ 
private 
readonly 
IHttpClientFactory +
httpClientFactory, =
;= >
readonly 
ILoggerManager 
LoggerManager  -
;- .
readonly 
ResourceManager  
resourceManager! 0
=1 2
new3 6
(6 7
$str7 b
,b c
Assemblyd l
.l m!
GetExecutingAssembly	m Å
(
Å Ç
)
Ç É
)
É Ñ
;
Ñ Ö
public 
ProductosService 
(  
IHttpClientFactory  2
httpClientFactory3 D
,D E
ILoggerManagerF T
loggerManagerU b
)b c
{ 	
this 
. 
LoggerManager 
=  
loggerManager! .
;. /
this 
. 
LoggerManager 
. 
LogInfo &
(& '
$str' C
)C D
;D E
this 
. 
httpClientFactory "
=# $
httpClientFactory% 6
;6 7
} 	
public 
async 
Task 
< 
Producto "
?" #
># $
GetAsync% -
(- .
int. 1
id2 4
)4 5
{ 	
this 
. 
LoggerManager 
. 
LogInfo &
(& '
$str' ?
)? @
;@ A
var 
client 
= 
httpClientFactory *
.* +
CreateClient+ 7
(7 8
$str8 J
)J K
;K L
var 
response 
= 
await  
client! '
.' (
GetAsync( 0
(0 1
$"1 3
$str3 @
{@ A
idA C
}C D
"D E
)E F
;F G
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{ 
var 
content 
= 
await #
response$ ,
., -
Content- 4
.4 5
ReadAsStringAsync5 F
(F G
)G H
;H I
var 
product 
= 
JsonConvert )
.) *
DeserializeObject* ;
<; <
Producto< D
>D E
(E F
contentF M
)M N
;N O
return!! 
product!! 
;!! 
}"" 
return## 
null## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
<&& 
List&& 
<&& 
Producto&& '
>&&' (
?&&( )
>&&) *
GetAllAsync&&+ 6
(&&6 7
)&&7 8
{'' 	
this(( 
.(( 
LoggerManager(( 
.(( 
LogInfo(( &
(((& '
$str((' =
)((= >
;((> ?
var)) 
client)) 
=)) 
httpClientFactory)) *
.))* +
CreateClient))+ 7
())7 8
$str))8 J
)))J K
;))K L
var++ 
response++ 
=++ 
await++  
client++! '
.++' (
GetAsync++( 0
(++0 1
$"++1 3
$str++3 F
"++F G
)++G H
;++H I
if,, 
(,, 
response,, 
.,, 
IsSuccessStatusCode,, ,
),,, -
{-- 
var.. 
content.. 
=.. 
await.. #
response..$ ,
..., -
Content..- 4
...4 5
ReadAsStringAsync..5 F
(..F G
)..G H
;..H I
var// 
products// 
=// 
JsonConvert// *
.//* +
DeserializeObject//+ <
<//< =
List//= A
<//A B
Producto//B J
>//J K
>//K L
(//L M
content//M T
)//T U
;//U V
return11 
products11 
;11  
}22 
if33 
(33 
resourceManager33 
is33 !
not33" %
null33& *
)33* +
{44 
string55 
?55 
mensajeError55 $
=55% &
resourceManager55' 6
.556 7
	GetString557 @
(55@ A
$str55A S
)55S T
;55T U
if66 
(66 
mensajeError66  
!=66! #
null66$ (
)66( )
throw77 
new77 %
ProductoNotFoundException77 7
(777 8
mensajeError778 D
)77D E
;77E F
}88 
return99 
null99 
;99 
}:: 	
};; 
}<< 