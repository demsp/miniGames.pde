 program ideone;
    var
     v: array [1..8] of integer; 
     i,z: integer;     
    
    //***************
procedure qSort(l,r:integer);
var i,j:integer;
    vTemp,vHalf:integer;
begin
 writeln("qSort");
  i := l; j := r;
  vHalf := v[(l+r) div 2];
  writeln("vHalf=",vHalf);
  repeat
    while (v[i] < vHalf) do begin
    inc(i);
    write("i= ",i);write(" ");
    end;
    while (vHalf < v[j]) do begin
    dec(j);
    write("j= ",j);write(" ");
    end;
    writeln;
    if (i <= j) then
    begin
    
      vTemp:=v[i]; writeln("vi = ", v[i]); writeln("vj = ", v[j]);  
      v[i]:=v[j]; v[j]:=vTemp;
    for z:=1 to 8 do begin
     write(v[z]); write(" ");
     end;
      inc(i); writeln("inc i=",i);
      dec(j);
      writeln("dec j=",j);
    end;
  until (i > j);
  if (l < j) then qSort(l,j);
  if (i < r) then qSort(i,r);
end;
    
    //*************** 
    begin
     v[1] := 1;
     v[2] := 2;
     v[3] := 3;
     v[4] := 4;
     v[5] := 5;
     v[6] := 6;
     v[7] := 7;
     v[8] := 8;
     //writeln;
     for z:=1 to 8 do begin
     write(v[z]); write(" ");
     end;
     writeln;
     qsort(1,8);
     writeln;
     for i:=z to 8 do begin
       write(v[z]); write(" ");
       end;
    	(* your code goes here *)
    end.
