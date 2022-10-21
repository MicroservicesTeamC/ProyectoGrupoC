”
vD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\Controllers\EstanteriaController.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
EstanteriaController %
:& '
ControllerBase( 6
{		 
private

 
readonly

 
IEstanteriaProvider

 ,
estanteriaProvider

- ?
;

? @
public  
EstanteriaController #
(# $
IEstanteriaProvider$ 7
estanteriaProvider8 J
)J K
{ 	
this 
. 
estanteriaProvider #
=$ %
estanteriaProvider& 8
;8 9
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAsync) 1
(1 2
int2 5
id6 8
)8 9
{ 	
var 
result 
= 
await 
estanteriaProvider 1
.1 2
GetAsnyc2 :
(: ;
id; =
)= >
;> ?
if 
( 
result 
!= 
null 
) 
return  &
Ok' )
() *
result* 0
)0 1
;1 2
return 
NotFound 
( 
) 
; 
} 	
} 
} ‰
kD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\DAL\EstanteriaContext.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 
DAL 
{ 
public 

class 
EstanteriaContext "
:" #
	DbContext# ,
{ 
public 
EstanteriaContext  
(  !
DbContextOptions! 1
<1 2
EstanteriaContext2 C
>C D
optionsE L
)L M
:		 	
base		
 
(		 
options		 
)		 
{

 	
} 	
public 
DbSet 
< 
Estanterias  
>  !
Estanterias" -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
} •
lD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\DAL\EstanteriaProvider.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 
DAL 
{ 
public 

class 
EstanteriaProvider #
:$ %
IEstanteriaProvider& 9
{ 
private 
readonly 
EstanteriaContext *
_context+ 3
;3 4
public 
EstanteriaProvider !
(! "
EstanteriaContext" 3
context4 ;
); <
{		 	
_context

 
=

 
context

 
;

 
} 	
public 
async 
Task 
< 
Estanterias %
?% &
>& '
GetAsnyc( 0
(0 1
int1 4
id5 7
)7 8
{ 	
if 
( 
_context 
. 
Estanterias #
is$ &
not' *
null+ /
)/ 0
{ 
return 
await 
_context %
.% &
Estanterias& 1
.1 2
	FindAsync2 ;
(; <
id< >
)> ?
;? @
} 
return 
null 
; 
} 	
} 
} ¤
pD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\DAL\EstanteriaProviderFake.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 
DAL 
{ 
public 

class "
EstanteriaProviderFake '
:( )
IEstanteriaProvider* =
{ 
private 
readonly 
List 
< 
Estanterias )
>) *
estanterias+ 6
=7 8
new9 <
(= >
)> ?
;? @
public "
EstanteriaProviderFake %
(% &
)& '
{		 	
estanterias

 
.

 
Add

 
(

 
new

 
Estanterias

  +
(

+ ,
)

, -
{

. /
Id

0 2
=

3 4
$num

5 6
,

6 7
Name

8 <
=

= >
$str

? U
,

U V
	Capacidad

W `
=

a b
$num

c d
}

e f
)

f g
;

g h
estanterias 
. 
Add 
( 
new 
Estanterias  +
(+ ,
), -
{. /
Id0 2
=3 4
$num5 6
,6 7
Name8 <
== >
$str? V
,V W
	CapacidadX a
=b c
$numd f
}f g
)g h
;h i
estanterias 
. 
Add 
( 
new 
Estanterias  +
(+ ,
), -
{. /
Id0 2
=3 4
$num5 6
,6 7
Name8 <
== >
$str? U
,U V
	CapacidadW `
=a b
$numc e
}e f
)f g
;g h
estanterias 
. 
Add 
( 
new 
Estanterias  +
(+ ,
), -
{. /
Id0 2
=3 4
$num5 6
,6 7
Name8 <
== >
$str? R
,R S
	CapacidadT ]
=^ _
$num` b
}b c
)c d
;d e
} 	
public 
async 
Task 
< 
Estanterias %
?% &
>& '
GetAsnyc( 0
(0 1
int1 4
id5 7
)7 8
{ 	
var 
customer 
= 
estanterias &
.& '
FirstOrDefault' 5
(5 6
x6 7
=>8 :
x; <
.< =
Id= ?
==@ B
idC E
)E F
;F G
return 
await 
Task 
. 

FromResult (
(( )
customer) 1
)1 2
;2 3
} 	
} 
} Ÿ
mD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\DAL\IEstanteriaProvider.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 
DAL 
{ 
public 

	interface 
IEstanteriaProvider (
{ 
Task 
< 
Estanterias 
? 
> 
GetAsnyc #
(# $
int$ '
id( *
)* +
;+ ,
} 
}		 Ø
}D:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\Migrations\20221020083250_InitialCreate.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 

Migrations &
{ 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
	Capacidad 
= 
table  %
.% &
Column& ,
<, -
int- 0
>0 1
(1 2
type2 6
:6 7
$str8 =
,= >
nullable? G
:G H
falseI N
)N O
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str #
)# $
;$ %
}   	
}!! 
}"" ©
hD:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\Models\Estanterias.cs
	namespace 	
GrupoC
 
. 

Estanteria 
. 
Models "
{ 
public 

class 
Estanterias 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
public		 
int		 
	Capacidad		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} º!
]D:\ProyectosProgramacion\VS\ProyectoMicroserviciosEquipoC\GrupoC\GrupoC.Estanteria\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
SecretClientOptions 
options 
= 
new !
SecretClientOptions" 5
(5 6
)6 7
{ 
Retry 	
=
 
{ 
Delay 
= 
TimeSpan 
. 
FromSeconds #
(# $
$num$ %
)% &
,& '
MaxDelay 
= 
TimeSpan 
. 
FromSeconds '
(' (
$num( *
)* +
,+ ,

MaxRetries 
= 
$num 
, 
Mode 
= 
	RetryMode 
. 
Exponential $
} 
} 
; 
string 
secretValue 
= 
$str 
; 
string 
? 
Uri 
= 
Environment 
. "
GetEnvironmentVariable 0
(0 1
$str1 D
,D E%
EnvironmentVariableTargetF _
._ `
User` d
)d e
;e f
if 
( 
Uri 
is 	
not
 
null 
) 
{ 
var 
client 
= 
new 
SecretClient !
(! "
new" %
Uri& )
() *
Uri* -
)- .
,. /
new0 3"
DefaultAzureCredential4 J
(J K
)K L
,L M
optionsN U
)U V
;V W
KeyVaultSecret 
secret 
= 
client "
." #
	GetSecret# ,
(, -
Environment- 8
.8 9"
GetEnvironmentVariable9 O
(O P
$strP c
,c d%
EnvironmentVariableTargete ~
.~ 
User	 ƒ
)
ƒ „
)
„ …
;
… †
secretValue 
= 
secret 
. 
Value 
; 
} 
builder"" 
."" 
Services"" 
."" 
AddControllers"" 
(""  
)""  !
;""! "
builder$$ 
.$$ 
Services$$ 
.$$ #
AddEndpointsApiExplorer$$ (
($$( )
)$$) *
;$$* +
builder%% 
.%% 
Services%% 
.%% 
AddSwaggerGen%% 
(%% 
)%%  
;%%  !
builder&& 
.&& 
Services&& 
.&& 
	AddScoped&& 
<&& 
IEstanteriaProvider&& .
,&&. /
EstanteriaProvider&&0 B
>&&B C
(&&C D
)&&D E
;&&E F
builder'' 
.'' 
Services'' 
.'' 
AddDbContext'' 
<'' 
EstanteriaContext'' /
>''/ 0
(''0 1
options''1 8
=>''9 ;
options(( 
.(( 
UseSqlServer(( (
(((( )
secretValue(() 4
)((4 5
))) 
;)) 
var,, 
app,, 
=,, 	
builder,,
 
.,, 
Build,, 
(,, 
),, 
;,, 
if// 
(// 
app// 
.// 
Environment// 
.// 
IsDevelopment// !
(//! "
)//" #
)//# $
{00 
app11 
.11 

UseSwagger11 
(11 
)11 
;11 
app22 
.22 
UseSwaggerUI22 
(22 
)22 
;22 
}33 
app66 
.66 
UseAuthorization66 
(66 
)66 
;66 
app88 
.88 
MapControllers88 
(88 
)88 
;88 
app:: 
.:: 
Run:: 
(:: 
):: 	
;::	 
