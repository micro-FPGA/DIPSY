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

entity GPIO_SPI is
    Port (
        m_ss_i : in std_logic; -- Slave Select Output (required)
        m_ss_o : out std_logic; -- Slave Select Output (required)
        m_ss_t : out std_logic; -- Slave Select Tri-State Control (required)
        
        m_sck_i : in std_logic; -- SPI Clock Input (required)
        m_sck_o : out std_logic; -- SPI Clock Output (required)
        m_sck_t : out std_logic; -- SPI Clock Tri-State Control (required)
        
        m_io0_i : in std_logic; -- IO0 Input Port (required)
        m_io0_o : out std_logic; -- IO0 Output Port (required)
        m_io0_t : out std_logic; -- IO0 Tri-State Control (required)
        
        m_io1_i : in std_logic; -- IO1 Input Port (required)
        m_io1_o : out std_logic; -- IO1 Output Port (required)
        m_io1_t : out std_logic; -- IO1 Tri-State Control (required)

        GPO : in STD_LOGIC_VECTOR (2 downto 0);
        GPI : out STD_LOGIC
        );
end GPIO_SPI;

architecture Behavioral of GPIO_SPI is
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO of GPO: SIGNAL is "xilinx.com:interface:gpio:1.0 GPIO TRI_O";
  ATTRIBUTE X_INTERFACE_INFO of GPI: SIGNAL is "xilinx.com:interface:gpio:1.0 GPIO TRI_I";
  
  ATTRIBUTE X_INTERFACE_INFO of m_ss_i: SIGNAL is "xilinx.com:interface:spi:1.0 SPI SS_I";
  ATTRIBUTE X_INTERFACE_INFO of m_ss_o: SIGNAL is "xilinx.com:interface:spi:1.0 SPI SS_O";
  ATTRIBUTE X_INTERFACE_INFO of m_ss_t: SIGNAL is "xilinx.com:interface:spi:1.0 SPI SS_T";
  ATTRIBUTE X_INTERFACE_INFO of m_sck_i: SIGNAL is "xilinx.com:interface:spi:1.0 SPI SCK_I";
  ATTRIBUTE X_INTERFACE_INFO of m_sck_o: SIGNAL is "xilinx.com:interface:spi:1.0 SPI SCK_O";
  ATTRIBUTE X_INTERFACE_INFO of m_sck_t: SIGNAL is "xilinx.com:interface:spi:1.0 SPI SCK_T";
  ATTRIBUTE X_INTERFACE_INFO of m_io0_i: SIGNAL is "xilinx.com:interface:spi:1.0 SPI IO0_I";
  ATTRIBUTE X_INTERFACE_INFO of m_io0_o: SIGNAL is "xilinx.com:interface:spi:1.0 SPI IO0_O";
  ATTRIBUTE X_INTERFACE_INFO of m_io0_t: SIGNAL is "xilinx.com:interface:spi:1.0 SPI IO0_T";
  ATTRIBUTE X_INTERFACE_INFO of m_io1_i: SIGNAL is "xilinx.com:interface:spi:1.0 SPI IO1_I";
  ATTRIBUTE X_INTERFACE_INFO of m_io1_o: SIGNAL is "xilinx.com:interface:spi:1.0 SPI IO1_O";
  ATTRIBUTE X_INTERFACE_INFO of m_io1_t: SIGNAL is "xilinx.com:interface:spi:1.0 SPI IO1_T";
  
begin
  m_io0_t <= '0'; -- output
  m_io0_o <= GPO(0); -- MOSI
  
  m_sck_t <= '0';
  m_sck_o <= GPO(1);
  
  m_ss_t <= '0';
  m_ss_o <= GPO(2);
  
  -- MISO
  m_io1_t <= '1'; -- configure as input
  GPI <= m_io1_i; -- read it  
end Behavioral;
