include "globals.mzn";

%datos
int: p;
constraint assert (p>0, "No hay población o es negativa");

int: Q;
constraint assert (Q>0, "No hay quasi-id o es negativo"); 

array[1..Q] of int: f;
constraint assert(forall (i in 1..Q) (f[i] > 0), 
                                              "Las frecuencias deben ser positivas");
constraint assert (sum(f) == p, "La suma de frecuencias tiene que ser igual a la población");
int: r;
constraint assert (r>0, "No hay recursos disponibles o son negativos");

array[1..r] of int: c;
constraint assert(forall (i in 1..r) (c[i] > 0), 
                                              "La capacidad de algun recurso no puede ser igual a 0 o negativa");

constraint assert(p <= sum(c), 
                                              "Hay más población que capacidad total de los recursos");
                                                                                                                                               
% Variables de decision


%Variable que representa el orden lexicográfico de los anonymity vector
var int: ordenLexicografico;


%Anonymity vector para todas las soluciones posibles
array[1..max(f)] of var int: anonymityVector;% of var 0..p, buscar una forma de poner un límite

% Asignación por quasi-id - recurso
array[1..p, 1..2] of var int: asignacionPacientePlaza;

%Array auxiliar para almacenar los individuos con el mismo identificador
array[1..p] of var int: contadorIguales;

% Funciones

%Función que comprueba si dos pacientes tienen el mismo identificador y la misma sala
function var bool: tuplasIguales(int: i, int: j) = 
  asignacionPacientePlaza[i, 1] == asignacionPacientePlaza[j, 1] /\
  asignacionPacientePlaza[i, 2] == asignacionPacientePlaza[j, 2];

% Constraints

%Constraint que asegura que todos los pacientes asignados tienen un quiasi-id real y que hay exactamente el mismo numero que al principio
constraint forall(i in 1..p) (
  1 <= asignacionPacientePlaza[i, 1] /\ asignacionPacientePlaza[i, 1] <= Q
);
constraint forall(g in 1..Q)(
  sum(i in 1..p)(asignacionPacientePlaza[i, 1] == g) == f[g]
);
 
%Constraint que asegura que todos los pacientes están en una plaza real y que están dentro de la capacidad de dicha plaza
constraint forall(i in 1..p) (
  1 <= asignacionPacientePlaza[i, 2] /\ asignacionPacientePlaza[i, 2] <= r
);
constraint forall(j in 1..r)(
  sum(i in 1..p)(asignacionPacientePlaza[i, 2] == j) <= c[j]
);
%Constraint para crear la matriz a


% Constraint para contabilizar cuantos hay repetidos
constraint forall(i in 1..p) (
  contadorIguales[i] == sum(j in 1..p)(bool2int(tuplasIguales(i, j)))
);

%Constraint para crear el anonymity vector 
constraint forall(k in 1..max(f)) (
  anonymityVector[k] == (sum(i in 1..p)(bool2int(contadorIguales[i] == k))) / k
);

% Constraint para calcular el orden lexicográfico
constraint ordenLexicografico == sum(k in 1..max(f)) (10^(k) * anonymityVector[k]);

% Función objetivo para maximizar el orden lexicográfico
solve maximize ordenLexicografico;

% Output resultados
%output ["Orden Lexicográfico: \(ordenLexicografico)\n"] ++
 %      ["Anonymity Vector: \(anonymityVector)\n"] ++
  %     ["Asignación de pacientes por plazas: \(asignacionPacientePlaza)"];
%