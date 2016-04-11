/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xintc.h"
#include "intc_header.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "gpio_intr_header.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "iic_header.h"
#include "xspi.h"
#include "spi_header.h"
#include "xtmrctr.h"
#include "tmrctr_header.h"
#include "tmrctr_intr_header.h"

#define GPIO_CHANNEL1 1
#define GPIO_CHANNEL2 2
int main() 
{
   static XIntc intc;
   static XGpio axi_gpio_1_Gpio;
   static XTmrCtr axi_timer_0_Timer;
   Xil_ICacheEnable();
   Xil_DCacheEnable();
   print("---Entering main---\n\r");
   

   {
      int status;

      print("\r\n Running IntcSelfTestExample() for axi_intc_0...\r\n");

      status = IntcSelfTestExample(XPAR_AXI_INTC_0_DEVICE_ID);

      if (status == 0) {
         print("IntcSelfTestExample PASSED\r\n");
      }
      else {
         print("IntcSelfTestExample FAILED\r\n");
      }
   }

   {
       int Status;

       Status = IntcInterruptSetup(&intc, XPAR_AXI_INTC_0_DEVICE_ID);
       if (Status == 0) {
          print("Intc Interrupt Setup PASSED\r\n");
       }
       else {
         print("Intc Interrupt Setup FAILED\r\n");
      }
   }
   

   {
      u32 status;
      
      print("\r\nRunning GpioInputExample() for axi_gpio_1...\r\n");

      u32 DataRead;
      
      status = GpioInputExample(XPAR_AXI_GPIO_1_DEVICE_ID, &DataRead);
      
      if (status == 0) {
         xil_printf("GpioInputExample PASSED. Read data:0x%X\r\n", DataRead);
      }
      else {
         print("GpioInputExample FAILED.\r\n");
      }
   }
   {
      
      int Status;
        
      u32 DataRead;
      
      print(" Press button to Generate Interrupt\r\n");
      
      Status = GpioIntrExample(&intc, &axi_gpio_1_Gpio, \
                               XPAR_AXI_GPIO_1_DEVICE_ID, \
                               XPAR_AXI_INTC_0_AXI_GPIO_1_IP2INTC_IRPT_INTR, \
                               GPIO_CHANNEL1 | GPIO_CHANNEL2, &DataRead);
	
      if (Status == 0 ){
             if(DataRead == 0)
                print("No button pressed. \r\n");
             else
                print("Gpio Interrupt Test PASSED. \r\n"); 
      } 
      else {
         print("Gpio Interrupt Test FAILED.\r\n");
      }
	
   }
   

   {
      u32 status;
      
      print("\r\nRunning GpioOutputExample() for axi_gpio_2...\r\n");

      status = GpioOutputExample(XPAR_AXI_GPIO_2_DEVICE_ID,20);
      
      if (status == 0) {
         print("GpioOutputExample PASSED.\r\n");
      }
      else {
         print("GpioOutputExample FAILED.\r\n");
      }
   }
   

   {
      u32 status;
      
      print("\r\nRunning GpioOutputExample() for axi_gpio_3...\r\n");

      status = GpioOutputExample(XPAR_AXI_GPIO_3_DEVICE_ID,2);
      
      if (status == 0) {
         print("GpioOutputExample PASSED.\r\n");
      }
      else {
         print("GpioOutputExample FAILED.\r\n");
      }
   }
   

   {
      int status;


      print("\r\n Running IicSelfTestExample() for axi_iic_0...\r\n");

      status = IicSelfTestExample(XPAR_AXI_IIC_0_DEVICE_ID);

      if (status == 0) {
         print("IicSelfTestExample PASSED\r\n");
      }
      else {
         print("IicSelfTestExample FAILED\r\n");
      }
   }
   

   {
      u32 status;
      
      print("\r\nRunning GpioInputExample() for axi_gpio_0...\r\n");

      u32 DataRead;
      
      status = GpioInputExample(XPAR_AXI_GPIO_0_DEVICE_ID, &DataRead);
      
      if (status == 0) {
         xil_printf("GpioInputExample PASSED. Read data:0x%X\r\n", DataRead);
      }
      else {
         print("GpioInputExample FAILED.\r\n");
      }
   }
   

   {
      XStatus status;
      
      print("\r\n Runnning SpiSelfTestExample() for axi_quad_spi_0...\r\n");
      
      status = SpiSelfTestExample(XPAR_AXI_QUAD_SPI_0_DEVICE_ID);
      
      if (status == 0) {
         print("SpiSelfTestExample PASSED\r\n");
      }
      else {
         print("SpiSelfTestExample FAILED\r\n");
      }
   }
   

   {
      XStatus status;
      
      print("\r\n Runnning SpiSelfTestExample() for axi_quad_spi_1...\r\n");
      
      status = SpiSelfTestExample(XPAR_AXI_QUAD_SPI_1_DEVICE_ID);
      
      if (status == 0) {
         print("SpiSelfTestExample PASSED\r\n");
      }
      else {
         print("SpiSelfTestExample FAILED\r\n");
      }
   }
   

   {
      int status;
      
      print("\r\n Running TmrCtrSelfTestExample() for axi_timer_0...\r\n");
      
      status = TmrCtrSelfTestExample(XPAR_AXI_TIMER_0_DEVICE_ID, 0x0);
      
      if (status == 0) {
         print("TmrCtrSelfTestExample PASSED\r\n");
      }
      else {
         print("TmrCtrSelfTestExample FAILED\r\n");
      }
   }
   {
      int Status;

      print("\r\n Running Interrupt Test  for axi_timer_0...\r\n");
      
      Status = TmrCtrIntrExample(&intc, &axi_timer_0_Timer, \
                                 XPAR_AXI_TIMER_0_DEVICE_ID, \
                                 XPAR_AXI_INTC_0_AXI_TIMER_0_INTERRUPT_INTR, 0);
	
      if (Status == 0) {
         print("Timer Interrupt Test PASSED\r\n");
      } 
      else {
         print("Timer Interrupt Test FAILED\r\n");
      }

   }
   
   /*
    * Peripheral SelfTest will not be run for axi_uartlite_0
    * because it has been selected as the STDOUT device
    */

   print("---Exiting main---\n\r");
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}
