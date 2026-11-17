----------------------------------------------------------------------------------
-- Company: MicroFPGA UG(h) 
-- Engineer: Antti Lukats 
-- 
-- Create Date: 13.11.2026 14:36:53
-- Design Name: 
-- Module Name: GPIO_I2C - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GPIO_I2C is
    Port (
          scl_i: in STD_LOGIC;          
          scl_o: out STD_LOGIC;          
          scl_t: out STD_LOGIC;          

          sda_i: in STD_LOGIC;          
          sda_o: out STD_LOGIC;          
          sda_t: out STD_LOGIC;          
          
          GPO : in STD_LOGIC_VECTOR (1 downto 0);
          GPI : out STD_LOGIC
          );
end GPIO_I2C;

architecture Behavioral of GPIO_I2C is
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO of GPO: SIGNAL is "xilinx.com:interface:gpio:1.0 GPIO TRI_O";
  ATTRIBUTE X_INTERFACE_INFO of GPI: SIGNAL is "xilinx.com:interface:gpio:1.0 GPIO TRI_I";
  
  ATTRIBUTE X_INTERFACE_INFO of scl_i: SIGNAL is "xilinx.com:interface:iic:1.0 I2C SCL_I";
  ATTRIBUTE X_INTERFACE_INFO of scl_o: SIGNAL is "xilinx.com:interface:iic:1.0 I2C SCL_O";
  ATTRIBUTE X_INTERFACE_INFO of scl_t: SIGNAL is "xilinx.com:interface:iic:1.0 I2C SCL_T";
  ATTRIBUTE X_INTERFACE_INFO of sda_i: SIGNAL is "xilinx.com:interface:iic:1.0 I2C SDA_I";
  ATTRIBUTE X_INTERFACE_INFO of sda_o: SIGNAL is "xilinx.com:interface:iic:1.0 I2C SDA_O";
  ATTRIBUTE X_INTERFACE_INFO of sda_t: SIGNAL is "xilinx.com:interface:iic:1.0 I2C SDA_T";  
  
  
begin
  -- Drive SCL always
  scl_o <= GPO(1);
  scl_t <= '0';
  -- SDA driven LOW when GPO(0) = 0
  sda_o <= '0';
  sda_t <= GPO(0);
  GPI <= sda_i;  
end Behavioral;
