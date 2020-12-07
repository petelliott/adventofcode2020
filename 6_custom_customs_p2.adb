with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure CustomCustoms is
    arr : array (Character range 'a'..'z') of Natural;
    total : Natural := 0;
    people : Natural := 0;
begin

    while not End_of_File loop

        for I in Character range 'a'..'z' loop
            arr(I) := 0;
        end loop;
        people := 0;

        loop
            declare line : String := Get_Line;
            begin
                exit when line = "";
                people := people + 1;
                for ch of line loop
                    arr(ch) := arr(ch) + 1;
                end loop;
            end;
        end loop;

        for I in Character range 'a'..'z' loop
            if arr(I) = people then
                total := total + 1;
            end if;
        end loop;

    end loop;

    Put(total);
end;