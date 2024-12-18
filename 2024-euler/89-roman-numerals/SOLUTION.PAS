(* Enter your code here. Read input from STDIN. Print output to STDOUT *)
program Solution;
type
  RomanValues = array[char] of 1..1000;
  InputLine = packed array[1..1000] of char;
var
  NumeralToInt: RomanValues;
  RomanPairs: array[1..13] of string;
  T: integer;
  Numerals: InputLine;
  I: integer;
  J: integer;
  C: char;
  Len: integer;
  RomanValue: longint;

  (* This is a dumb map. What! No map in Turbo Pascal! *)
  function RomanPairToInt(Pair: string): integer;
  begin
    if Pair = 'M' then
      RomanPairToInt := 1000
    else if Pair = 'CM' then
      RomanPairToInt := 900
    else if Pair = 'D' then
      RomanPairToInt := 500
    else if Pair = 'CD' then
      RomanPairToInt := 400
    else if Pair = 'C' then
      RomanPairToInt := 100
    else if Pair = 'XC' then
      RomanPairToInt := 90
    else if Pair = 'L'then
      RomanPairToInt := 50
    else if Pair = 'XL' then
      RomanPairToInt := 40
    else if Pair = 'X' then
      RomanPairToInt := 10
    else if Pair = 'IX'then
      RomanPairToInt := 9
    else if Pair = 'V' then
      RomanPairToInt := 5
    else if Pair = 'IV' then
      RomanPairToInt := 4
    else if Pair = 'I' then
      RomanPairToInt := 1;
  end;

  function RomanToInt(RomanNumerals: InputLine; Length: integer): longint;
  var
    Result: longint;
    Previous: integer;
    Current: integer;
    I: integer;
    Numeral: char;
  begin
    Previous := 0;
    Result := 0;
    (* writeln(RomanNumerals[1],'...',RomanNumerals[Length]);*)
    for I := Length downto 1 do
    begin
      Numeral := RomanNumerals[I];
      Current := NumeralToInt[Numeral];
      if Current < Previous then
        Result := Result - Current
      else
        Result := Result + Current;
      (* writeln(Numeral,',',Current,'=>', Result); *)
      Previous := Current;
    end;

    RomanToInt := Result;
  end;

  procedure OptimalRoman(Num: longint; var result: InputLine; var Len: integer);
  var
    Pair: string;
    I: integer;
    J: integer;
    Value: integer;
  begin
    Len := 0;
    for I := 1 to 13 do
    begin
      Pair := RomanPairs[I];
      Value := RomanPairToInt(Pair);
      while Num >= Value do
      begin
        for J := 1 to byte(Pair[0]) do
          Result[Len + J] := Pair[J];
        Len := Len + byte(Pair[0]);
        Num := Num - Value;
      end;
    end;
  end;

begin
  NumeralToInt['I'] := 1;
  NumeralToInt['V'] := 5;
  NumeralToInt['X'] := 10;
  NumeralToInt['L'] := 50;
  NumeralToInt['C'] := 100;
  NumeralToInt['D'] := 500;
  NumeralToInt['M'] := 1000;

  RomanPairs[1] := 'M';
  RomanPairs[2] := 'CM';
  RomanPairs[3] := 'D';
  RomanPairs[4] := 'CD';
  RomanPairs[5] := 'C';
  RomanPairs[6] := 'XC';
  RomanPairs[7] := 'L';
  RomanPairs[8] := 'XL';
  RomanPairs[9] := 'X';
  RomanPairs[10] := 'IX';
  RomanPairs[11] := 'V';
  RomanPairs[12] := 'IV';
  RomanPairs[13] := 'I';

  readln(T);
  for I := 1 to T do
  begin
    for J := 1 to 1000 do
    begin
      read(C);
      if (ord(C) = 10) or (ord(C) = 13) then
        break;
      Len := J;
      Numerals[J] := C;
    end;

    (* writeln('len=', Len); *)
    RomanValue := RomanToInt(Numerals, Len);
    (* writeln('value=', RomanValue); *)
    OptimalRoman(RomanValue, Numerals, Len);
    for J := 1 to Len do
      write(Numerals[J]);
    writeln('');
  end;

end. { solution }
