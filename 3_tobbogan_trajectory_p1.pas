program TobboganTrajectory(output, input);

var line: string;
var x: integer = 0;
var width: integer;
var trees: integer = 0;

begin
   ReadLn(line);
   width := Length(line);
   while (line <> '') do
   begin
      if (line[x+1] = '#') then
         trees := trees + 1;

      x := (x + 3) mod width;

      ReadLn(line);
   end;

   WriteLn(trees)
end.
