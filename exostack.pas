program exo1;

function SequenialFind(var x : integer, n : integer, T: array[1..20] of integer;):integer;
var i : integer;
begin
    for i := 1 to n do 
    begin
        if x = T[i] then
        begin
            SequenialFind := 1;
        end;
    end;
    SequenialFind := 0;
end;


function BinarySearch(var x : integer, n : integer, T: array[1..20] of integer): integer;

var i : integer;
    left , right , mid: integer;
begin
    left := 1;
    right := n;
    while left <= right do
    begin
        mid := (left + right) div 2;
        if T[mid] = x  then
        begin
            BinarySearch := 1;
        end;
        else if ( x > T[mid]) then
        begin
            left := mid + 1;
        end;
        else
        begin
            right := mid - 1;
        end;
    end;
      BinarySearch := 0; 
end;

// {This WORK GO TO NERMINE KIROUANE}
procedure Insert(var T: array[1..20] of integer, x : integer, n : integer);
var i : integer;
    pos: integer;
begin
i := n


    while (i >= 1) and (x < T[i])do
    begin
        T[i+ 1] := T[i];
        i := i - 1;
    end;
    T[i + 1] := x;
    n := n + 1;

end;

procedure Delete(var T: array[1..20] of integer, x : integer, n : integer);
var i , j , pos: integer;
begin

i := 1;
    for i := 1 to n do
    begin
        if x = T[i] then
        begin
            pos := i;
            break;
        end;
    end;

    if pos = 0 then
    begin
        exit;
    end;

    while pos  < n do
    begin
        T[pos] := T[pos + 1];
        pos := pos + 1;
    end;
    n := n -1;

end;


procedure sort(var T: array[1..100] of integer, n : integer);
var i , j : integer;
    temp : integer;
begin
    for i := 1 to n - 1 do
    begin
        for j := i + 1 to n do
        begin
            if T[i] > T[j] then
            begin
                temp := T[j];
                T[j] := T[i];
                T[i] := temp;
            end;
        end;
    end;
end;

procedure resort(var T: array[1..100] of integer, n : integer);
var i , j : integer;
begin
    for i := 2 to n do
    begin
        j := j - 1;
        temp := T[i];

        while (j >= 0 )and temp < T[j]do
        begin
            T[j + 1] := T[j];
            j := j - 1;
        end;
        T[j+1] := temp;
    end;
end;


function IsSubmatrix(A: array[1..10, 1..10] of integer; N, M: integer; B: array[1..2,1..2] of integer): boolean;
var
  i, j: integer;
  match: boolean;
begin
  IsSubmatrix := false;  
  for i := 1 to N - 1 do       
  begin
    for j := 1 to M - 1 do    
    begin
      match := (A[i, j] = B[1,1]) and (A[i, j+1] = B[1,2]) and
               (A[i+1, j] = B[2,1]) and (A[i+1, j+1] = B[2,2]);

      if match then
      begin
        IsSubmatrix := true;
        exit;  
      end;
    end;
  end;
end;



// td2

procedure Kajari(var C :^^integer, n : integer);
var i , j: integer;
begin
    C := Allocate(sizeof(integer)* n);
    for i := 1 to n do
    begin
        C^[i] := allocate(sizeof(integer)* n);
    end;

    for i := 1 to n do
    begin
        for j := 1 to n do
        begin
            if (i = j) or (j = 1) then
            begin
                C^[i]^[j] := 1;
            end;
            else if (i > j)and  (j > 1 )then
            begin
                C^[i]^[j] := C^[i - 1]^[j - 1] + C^[i - 1]^[j];
            end;
            else
            begin
                C^[i]^[j] := 0;
            end;
        end;
    end;

end;


//exo2

type Vector = record
    n : integer;
    T: ^integer;
    end;

function EmptyVector():Vector;
var v : Vector;
begin
    v.n := 0;
    v.T := null;
    EmptyVector := v;
end;

function AllocateVector(var nbr : integer): Vector;
var v : Vector;
begin
    v.n := nbr;
    v.T := allocate(nbr * SizoOf(integer));
    AllocateVector := v;
end;

procedure fillVector(var v : Vector);
var i : integer;
begin
    for i := 1 to v.n do
    begin
        read(v.T^[i]);
    end;
end;

procedure DisplayVector(var v : Vector);
var i : integer;
begin
    for i := 1 to n do
    begin
        write(' ', v.T^[i]);
    end;
end;

function ExitBoolean(var m1 , m2 : string , pos : integer): boolean;
var len1 , len2 : integer;
    i , j : integer;
begin
    len1 := length(m1);
    len2 := length(m2);
    i := pos;
    j := 1;
    while (i <= len1) and (j <= len2) and (m1[i] = m2[j]) do
    begin
        i := i + 1;
        j := j + 1;
    end;
    if (j > len2) then
    begin
        ExitBoolean := true;
    end;
    else
    begin
        ExitBoolean := false;
    end;
end;

function Position(var m1 , m2 : string): Vector;
var len1 , len2 : integer;
    i , j , cpt: integer;
    tab : Vector;
begin
    len1 := length(m1);
    len2 := length(m2);
cpt := 0;
    for i := 1 to len1 do
    begin
        if ExitBoolean(m1 , m2, i) = true then
        begin
            cpt := cpt +1;
        end;
    end;

    AllocateVector(cpt);
    j := 0;
    for i := 1 to len1 do
    begin
        if ExitBoolean(m1 , m2 , i) then
        begin
            j := j +1;
            tab.T^[j] := i;
        end;
    end;

    Position := tab;


end;

function SearchInPos(var m1 , m2 : string , k : integer): boolean;
var i : integer;
    v : Vector;

begin
    v := Position(m1, m2);
    for i := 1 to v.n do
    begin
        if v.T[i] = k then
        begin
            SearchInPos := true;
            break;
        end;
    end;
end;

{⭐ 1. Allocate & Display a Dynamic Matrix

    Write procedures to:

    Allocate an n × m matrix dynamically

    Fill it with values

    Display it

    Free all allocated memory

Goal: Learn allocation + pointer-to-pointer logic.}

//solution

procedure Allocate(var n : integer,m : integer, Mat :^^integer;);
var i : integer;
begin
    Mat := allocate(SizoOf(^integer)* n);
    for i := 1 to n do
    begin
        Mat^[i] := allocate(SizoOf(integer) * m);
    end;
end;

procedure Fill(var n , m : integer, Mat:^^integer);
var i , j : integer;
begin
    for i := 1 to n do
    begin
        for j := 1 to m do
        begin
            read(Mat^[i]^[j]);
        end;
    end;
end;

procedure Display(var n , m : integer, Mat:^^integer);
var i , j : integer;
begin
    for i := 1 to n do
    begin
        for j := 1 to m do
        begin
            write(Mat^[i]^[j]);
        end;
    end;
end;

procedure Free(var n , m : integer, Mat :^^integer);
var i , j : integer;
begin
    for i := 1 to n do
    begin
        free(Mat^[i]);
    end;
    free(Mat);
    mat := null;
end;


{⭐ 2. Convert a Static Matrix → Dynamic Matrix

    Given a static matrix A[1..n,1..m], write a procedure that:

    Allocates a dynamic matrix B

    Copies all elements of A into B

Goal: Understand indexing B^[i]^[j].}

//correction

procedure AllocateMatrix(var B : ^^integer, A: array[1..100][1..100] of integer, n , m : integer);

    var i , j: integer;

begin
    B := allocate(SizeOf(^integer) * n);
    for i := 1 to n do
    begin
        B^[i] := allocate(SizoOf(integer)* m);
    end;

    for i := 1 to n do
    begin
        for j := 1 to m do
        begin
            B^[i]^[j] := A[i][j];
        end;
    end;

end;

{⭐ 3. Sum Two Dynamic Matrices

Write a function that takes two dynamic n×n matrices and returns a new dynamically allocated matrix containing their sum.

Goal: Returning dynamic memory from a function.}

//correction

function DynamicMatricesSum(var A , B : ^^integer, n : integer):^^integer;
var C : ^^integer;
    i , j: integer;
begin
    C := allocate(n * SizeOf(^integer));
    for i := 1 to n do
    begin
        C^[i] := Allocate(n * SizeOf(integer));
    end;
    for i := 1 to n do
    begin
        for j := 1 to n do
        begin
            C^[i]^[j] := A^[i]^[j] + B^[i]^[j];
        end;
    end;

    DynamicMatricesSum := C;
end;


{⭐ 4. Transpose a Dynamic Matrix

Write a function:

Function Transpose(C : Matrix) : Matrix


that returns a new dynamic matrix with rows and columns swapped.

Goal: Manage multiple allocations + pointer stability.}


function Transpose(C: ^^Integer; n : integer): ^^integer;
var i , j : integer;
    h :^^integer;
begin
    h := alloacte(n * sizeof(^integer));
    for i := 1 to n do
    begin
        h^[i] := allocate(n * sizeof(integer));
    end;
    for i := 1 to n do
    begin
        for j := 1 to n do
        begin
            h^[j]^[i] := C^[i]^[j];
        end;
    end;
    Transpose := h;
end;

{⭐ 6. Resize a Dynamic Vector

Given a dynamic vector:

    type Vector = record
        n : integer;
        T : ^integer;
    end;


    Write Resize(var V : Vector; NewSize : integer) that:

    Allocates new space

    Copies old elements

    Frees old memory

Goal: Memory transfer + correct dispose.}

//correction
type Vector = record
        n : integer;
        T : ^integer;
    end;

function Resize(var V : Vector; NewSize : integer): Vector;
var i : integer;
    t : Vector;
begin

    t := Allocate(SizeOf(integer)* NewSize);

    for i := 1 to V.n do
    begin
        t^[i] := V.T^[i];
    end;

    free(V.T);
     V.T := Temp;
  V.n := NewSize;

end;

{⭐ 7. Insert & Delete From a Dynamic Vector

Create two procedures:

    InsertAt(var V : Vector; pos, x : integer)

    DeleteAt(var V : Vector; pos : integer)

    Must reallocate dynamically, not static shifts.

Goal: Manipulate dynamic sequences safely.}
//correction
type Vector = record
        n : integer;
        T : ^integer;
    end;

procedure InsertAt(var V : Vector; pos, x : integer);
var n , i: integer;
    temp :^integer;
begin

    temp := Allocate(SizeOf(integer)* V.n);
    for i := 1 to pos -1 do
    begin
        temp^[i] := V.T^[i];
    end;
    temp^[pos] := x;

    for i := pos to V.n do
    begin
        Temp^[i+1] := V.T^[i];
    end;
    free(V.T);
    V.T := temp;
    v.n := v.n + 1;

end;

procedure DeleteAt(var V : Vector; pos , x : integer);
var i : integer;
    temp :^integer;
begin

    temp := allocate(SizeOf(integer) * (V.n - 1));
    for i := 1 to pos - 1 do
    begin
        temp^[i] := V.T^[i];
    end;

    for i := pos + 1 to V.n do
    temp^[i - 1] := V.T^[i];

    free(V.T);
    V.T := temp;
    v.n := v.n - 1;
end;


{⭐ 8. Build a Dynamic Vector of Even Numbers

Write a function:

Function ExtractEven(A : Vector) : Vector


Returns a new dynamic vector containing only even numbers of A.

Goal: Count → allocate exact needed size → fill.}

Function ExtractEven(var A : Vector) : Vector;
var B : Vector;
    cpt : integer;
    i : integer;
begin

    cpt := 0;
    for i := 1 to A.n do
    begin
        if A.T^[i] div 2 = 0 then
        begin
            cpt := cpt + 1;
        end;
    end;

    B.T := Allocate(SizeOf(integer) * cpt);
    B.n := cpt;
    j := 1;
    for i := 1 to B.n do
    begin
        if A.T^[i] mod 2 = 0 then
        begin
            B.T^[j] := A.T^[i];
            j := j + 1;
        end;
    end;
    free(A.T);
    ExtractEven := B;
end;


{⭐ 9. Dynamic String Search → Position Vector

Given two strings M1 and M2, create a dynamic vector containing positions where M2 appears in M1.

    Goal:

    Build vector gradually

    Expand vector if needed

    Return empty vector if nothing found

(This is the advanced version of your exercise.)}

type Vector = record
        n : integer;
        T : ^integer;
    end;

function Booleanappaer(var m1 , m2 : string; pos : integer): boolean;
var n1 , n2 , i , j : integer;

begin
    
    n1 := length(m1);
    n2 := length(m2);

    i := pos;
    j := 1;
    while (i <= n1 )and (j <= n2) and (m1[i] = m2[j]) do
    begin
         i := i +1;
         j := j+1;
    end;
    if j > n2 then
    begin
        Booleanappaer := true;
    end;
    else
    begin
        Booleanappaer := false;
    end;

end;

function Position (var m1 , m2 : string): Vector;
var n1 , n2 , i , j : integer;
    cpt : integer;
    tab : Vector;

begin
    cpt := 0;
        n1 := length(m1);
    n2 := length(m2);
    for i := 1 to n1 do
    begin
        if Booleanappaer(m1 , m2, i) then
        begin
            cpt := cpt + 1;
        end;
    end;
    tab.n := cpt;
    
      if cpt > 0 then
        tab.T := Allocate(cpt * SizeOf(Integer))
    else
        tab.T := nil; 

     j := 0;
    for i := 1 to n1 do
    begin
        if Booleanappaer(m1 , m2, i) then
        begin
            j := j + 1;
            tab.T^[j] := i;
        end;
    end;

    Position := tab;



end;


{⭐ 10. Freeing a Complete Dynamic Structure

Given a dynamic matrix and a dynamic vector, write:

DisposeMatrix(var C : Matrix)

DisposeVector(var V : Vector)

Make sure no memory leak happens.

Goal: cleanup + pointer nulling.}

procedure DisposeMatrix(var C : ^^integer; n , m : integer);

var i , j : integer;

begin
    for i := 1 to n do
    begin
        free(C^[i]);
    end;
    free(C);
    C := null;
end;

procedure DisposeVector(var V : Vector);
begin
    V.n := 0;
    free(V.T);
    V.T := null;
end;