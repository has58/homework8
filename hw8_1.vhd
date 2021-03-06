Library IEEE;
use IEEE.std_logic_1164.ALL;

Entity check is
	port (a,b : in integer;
		output, output1 : out integer);
	end entity;

Architecture check_arch of check is
	signal clk : bit := '0';
	constant x : integer := 2;
	begin
		clk <= not clk after 100ns;
		process(clk)
			-- here it consider x under process
			constant x : integer :=3;
			begin
				-- For rising edge trigger
				if (clk='1') then
						if x=2 then
							output<=a+b;
						elsif x=3 then
							output<= a-b;
						else
							output<=a*b;
						end if;
				end if;
			end process;
	end check_arch;

	Architecture check_arch_2 of check is
		signal clk : bit := '0';
		constant x : integer := 2;
		begin
			clk <= not clk after 100ns;
			p1: process(clk)
						-- here it consider x under process
						constant x : integer :=3;
						begin
						-- For rising edge trigger
						if (clk='1') then
							output<=a+b+check_arch_2.x;
						else
							output<=a+b+x;
							output1<= a-b+p1.x;
						end if;

					end process;
		end check_arch_2;
