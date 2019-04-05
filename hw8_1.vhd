Library IEEE;
use IEEE.std_logic_1164.ALL;

Entity check is
	port (a,b : in std_logic;
		output : out std_logic);
	end entity;

Architecture check_arch of check is
	signal clk : bit := '0';
	constant x : integer := 2;
	begin
		clk <= not clk after 100ns;
	end check_arch;