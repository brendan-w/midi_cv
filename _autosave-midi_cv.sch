EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "MIDI to CV"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 63842D47
P 3600 2100
F 0 "A1" H 4100 2850 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4400 2950 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3600 2100 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 3600 2100 50  0001 C CNN
	1    3600 2100
	-1   0    0    1   
$EndComp
$Comp
L dk_Linear-Amplifiers-Instrumentation-OP-Amps-Buffer-Amps:TL084CN U5
U 1 1 63843A91
P 7500 1450
F 0 "U5" H 7700 1300 60  0000 L CNN
F 1 "TL084CN" H 7700 1200 60  0000 L CNN
F 2 "digikey-footprints:DIP-14_W3mm" H 7700 1650 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 1750 60  0001 L CNN
F 4 "296-1784-5-ND" H 7700 1850 60  0001 L CNN "Digi-Key_PN"
F 5 "TL084CN" H 7700 1950 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7700 2050 60  0001 L CNN "Category"
F 7 "Linear - Amplifiers - Instrumentation, OP Amps, Buffer Amps" H 7700 2150 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 2250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/TL084CN/296-1784-5-ND/277429" H 7700 2350 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OPAMP JFET 4 CIRCUIT 14DIP" H 7700 2450 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 7700 2550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7700 2650 60  0001 L CNN "Status"
	1    7500 1450
	1    0    0    -1  
$EndComp
$Comp
L dk_Linear-Amplifiers-Instrumentation-OP-Amps-Buffer-Amps:TL084CN U5
U 2 1 6384461A
P 7500 2850
F 0 "U5" H 7700 2700 60  0000 L CNN
F 1 "TL084CN" H 7700 2600 60  0000 L CNN
F 2 "digikey-footprints:DIP-14_W3mm" H 7700 3050 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 3150 60  0001 L CNN
F 4 "296-1784-5-ND" H 7700 3250 60  0001 L CNN "Digi-Key_PN"
F 5 "TL084CN" H 7700 3350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7700 3450 60  0001 L CNN "Category"
F 7 "Linear - Amplifiers - Instrumentation, OP Amps, Buffer Amps" H 7700 3550 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 3650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/TL084CN/296-1784-5-ND/277429" H 7700 3750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OPAMP JFET 4 CIRCUIT 14DIP" H 7700 3850 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 7700 3950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7700 4050 60  0001 L CNN "Status"
	2    7500 2850
	1    0    0    -1  
$EndComp
$Comp
L dk_Linear-Amplifiers-Instrumentation-OP-Amps-Buffer-Amps:TL084CN U5
U 3 1 6384541D
P 7500 4200
F 0 "U5" H 7700 4050 60  0000 L CNN
F 1 "TL084CN" H 7700 3950 60  0000 L CNN
F 2 "digikey-footprints:DIP-14_W3mm" H 7700 4400 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 4500 60  0001 L CNN
F 4 "296-1784-5-ND" H 7700 4600 60  0001 L CNN "Digi-Key_PN"
F 5 "TL084CN" H 7700 4700 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7700 4800 60  0001 L CNN "Category"
F 7 "Linear - Amplifiers - Instrumentation, OP Amps, Buffer Amps" H 7700 4900 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 5000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/TL084CN/296-1784-5-ND/277429" H 7700 5100 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OPAMP JFET 4 CIRCUIT 14DIP" H 7700 5200 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 7700 5300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7700 5400 60  0001 L CNN "Status"
	3    7500 4200
	1    0    0    -1  
$EndComp
$Comp
L dk_Linear-Amplifiers-Instrumentation-OP-Amps-Buffer-Amps:TL084CN U5
U 4 1 6384623A
P 7500 5350
F 0 "U5" H 7700 5200 60  0000 L CNN
F 1 "TL084CN" H 7700 5100 60  0000 L CNN
F 2 "digikey-footprints:DIP-14_W3mm" H 7700 5550 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 5650 60  0001 L CNN
F 4 "296-1784-5-ND" H 7700 5750 60  0001 L CNN "Digi-Key_PN"
F 5 "TL084CN" H 7700 5850 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7700 5950 60  0001 L CNN "Category"
F 7 "Linear - Amplifiers - Instrumentation, OP Amps, Buffer Amps" H 7700 6050 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftl081a" H 7700 6150 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/TL084CN/296-1784-5-ND/277429" H 7700 6250 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OPAMP JFET 4 CIRCUIT 14DIP" H 7700 6350 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 7700 6450 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7700 6550 60  0001 L CNN "Status"
	4    7500 5350
	1    0    0    -1  
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-2 J5
U 1 1 6385A912
P 8750 5350
F 0 "J5" V 8841 5222 50  0000 R CNN
F 1 "Gate 0-5V" V 8750 5222 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 8950 5550 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 8950 5650 60  0001 L CNN
F 4 "A1921-ND" H 8950 5750 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-2" H 8950 5850 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 8950 5950 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 8950 6050 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 8950 6150 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-2/A1921-ND/109003" H 8950 6250 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 8950 6350 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 8950 6450 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8950 6550 60  0001 L CNN "Status"
	1    8750 5350
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-2 J4
U 1 1 6385F430
P 8750 4200
F 0 "J4" V 8841 4072 50  0000 R CNN
F 1 "Velocity 0-5V" V 8750 4072 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 8950 4400 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 8950 4500 60  0001 L CNN
F 4 "A1921-ND" H 8950 4600 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-2" H 8950 4700 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 8950 4800 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 8950 4900 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 8950 5000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-2/A1921-ND/109003" H 8950 5100 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 8950 5200 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 8950 5300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8950 5400 60  0001 L CNN "Status"
	1    8750 4200
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-2 J7
U 1 1 6385FAB9
P 8800 2850
F 0 "J7" V 8891 2722 50  0000 R CNN
F 1 "Breath 0-5V" V 8800 2722 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 9000 3050 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 9000 3150 60  0001 L CNN
F 4 "A1921-ND" H 9000 3250 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-2" H 9000 3350 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 9000 3450 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 9000 3550 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 9000 3650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-2/A1921-ND/109003" H 9000 3750 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 9000 3850 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 9000 3950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9000 4050 60  0001 L CNN "Status"
	1    8800 2850
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-2 J6
U 1 1 6385FF3E
P 8800 1450
F 0 "J6" V 8891 1322 50  0000 R CNN
F 1 "Pitch 0-10V" V 8800 1322 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 9000 1650 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 9000 1750 60  0001 L CNN
F 4 "A1921-ND" H 9000 1850 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-2" H 9000 1950 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 9000 2050 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 9000 2150 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 9000 2250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-2/A1921-ND/109003" H 9000 2350 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 9000 2450 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 9000 2550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9000 2650 60  0001 L CNN "Status"
	1    8800 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 63864BBE
P 3600 1100
F 0 "#PWR012" H 3600 850 50  0001 C CNN
F 1 "GND" H 3605 927 50  0000 C CNN
F 2 "" H 3600 1100 50  0001 C CNN
F 3 "" H 3600 1100 50  0001 C CNN
	1    3600 1100
	-1   0    0    1   
$EndComp
$Comp
L Analog_DAC:MCP4812 U4
U 1 1 6386B082
P 5600 3050
F 0 "U4" H 5900 3500 50  0000 C CNN
F 1 "MCP4812" H 6000 3400 50  0000 C CNN
F 2 "" H 6400 2750 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf" H 6400 2750 50  0001 C CNN
	1    5600 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 6387297D
P 5600 3550
F 0 "#PWR018" H 5600 3300 50  0001 C CNN
F 1 "GND" H 5605 3377 50  0000 C CNN
F 2 "" H 5600 3550 50  0001 C CNN
F 3 "" H 5600 3550 50  0001 C CNN
	1    5600 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 63872E2A
P 5450 2250
F 0 "#PWR016" H 5450 2000 50  0001 C CNN
F 1 "GND" H 5455 2077 50  0000 C CNN
F 2 "" H 5450 2250 50  0001 C CNN
F 3 "" H 5450 2250 50  0001 C CNN
	1    5450 2250
	1    0    0    -1  
$EndComp
$Comp
L midi_cv:LTC1655IN8 U3
U 1 1 638791C1
P 5450 1750
F 0 "U3" H 5600 2300 50  0000 L CNN
F 1 "LTC1655IN8" H 5600 2200 50  0000 L CNN
F 2 "" H 5450 1750 50  0001 C CNN
F 3 "" H 5450 1750 50  0001 C CNN
	1    5450 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 6389B431
P 3400 3100
F 0 "#PWR010" H 3400 2950 50  0001 C CNN
F 1 "+5V" H 3415 3273 50  0000 C CNN
F 2 "" H 3400 3100 50  0001 C CNN
F 3 "" H 3400 3100 50  0001 C CNN
	1    3400 3100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 638B036B
P 5450 1250
F 0 "#PWR015" H 5450 1100 50  0001 C CNN
F 1 "+5V" H 5465 1423 50  0000 C CNN
F 2 "" H 5450 1250 50  0001 C CNN
F 3 "" H 5450 1250 50  0001 C CNN
	1    5450 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 638B090B
P 5600 2650
F 0 "#PWR017" H 5600 2500 50  0001 C CNN
F 1 "+5V" H 5615 2823 50  0000 C CNN
F 2 "" H 5600 2650 50  0001 C CNN
F 3 "" H 5600 2650 50  0001 C CNN
	1    5600 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+15V #PWR023
U 1 1 638C0DFF
P 7500 1250
F 0 "#PWR023" H 7500 1100 50  0001 C CNN
F 1 "+15V" H 7515 1423 50  0000 C CNN
F 2 "" H 7500 1250 50  0001 C CNN
F 3 "" H 7500 1250 50  0001 C CNN
	1    7500 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+15V #PWR025
U 1 1 638C14E9
P 7500 2650
F 0 "#PWR025" H 7500 2500 50  0001 C CNN
F 1 "+15V" H 7515 2823 50  0000 C CNN
F 2 "" H 7500 2650 50  0001 C CNN
F 3 "" H 7500 2650 50  0001 C CNN
	1    7500 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+15V #PWR027
U 1 1 638C1B28
P 7500 4000
F 0 "#PWR027" H 7500 3850 50  0001 C CNN
F 1 "+15V" H 7515 4173 50  0000 C CNN
F 2 "" H 7500 4000 50  0001 C CNN
F 3 "" H 7500 4000 50  0001 C CNN
	1    7500 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+15V #PWR029
U 1 1 638C1FA7
P 7500 5150
F 0 "#PWR029" H 7500 5000 50  0001 C CNN
F 1 "+15V" H 7515 5323 50  0000 C CNN
F 2 "" H 7500 5150 50  0001 C CNN
F 3 "" H 7500 5150 50  0001 C CNN
	1    7500 5150
	1    0    0    -1  
$EndComp
$Comp
L power:-15V #PWR024
U 1 1 638C2AC3
P 7500 1650
F 0 "#PWR024" H 7500 1750 50  0001 C CNN
F 1 "-15V" H 7515 1823 50  0000 C CNN
F 2 "" H 7500 1650 50  0001 C CNN
F 3 "" H 7500 1650 50  0001 C CNN
	1    7500 1650
	-1   0    0    1   
$EndComp
$Comp
L power:-15V #PWR026
U 1 1 638C66F4
P 7500 3050
F 0 "#PWR026" H 7500 3150 50  0001 C CNN
F 1 "-15V" H 7515 3223 50  0000 C CNN
F 2 "" H 7500 3050 50  0001 C CNN
F 3 "" H 7500 3050 50  0001 C CNN
	1    7500 3050
	-1   0    0    1   
$EndComp
$Comp
L power:-15V #PWR028
U 1 1 638C6E3F
P 7500 4400
F 0 "#PWR028" H 7500 4500 50  0001 C CNN
F 1 "-15V" H 7515 4573 50  0000 C CNN
F 2 "" H 7500 4400 50  0001 C CNN
F 3 "" H 7500 4400 50  0001 C CNN
	1    7500 4400
	-1   0    0    1   
$EndComp
$Comp
L power:-15V #PWR030
U 1 1 638C74BA
P 7500 5550
F 0 "#PWR030" H 7500 5650 50  0001 C CNN
F 1 "-15V" H 7515 5723 50  0000 C CNN
F 2 "" H 7500 5550 50  0001 C CNN
F 3 "" H 7500 5550 50  0001 C CNN
	1    7500 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 2950 4850 2950
Wire Wire Line
	4850 1700 5100 1700
Wire Wire Line
	4850 1700 4850 2950
Wire Wire Line
	4950 3150 5100 3150
$Comp
L Device:R_POT_TRIM_US RV1
U 1 1 6391E7EA
P 7200 950
F 0 "RV1" V 6995 950 50  0000 C CNN
F 1 "100k" V 7086 950 50  0000 C CNN
F 2 "" H 7200 950 50  0001 C CNN
F 3 "~" H 7200 950 50  0001 C CNN
	1    7200 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 1450 7800 950 
Wire Wire Line
	7800 950  7350 950 
Wire Wire Line
	7200 1100 7200 1350
$Comp
L power:GND #PWR022
U 1 1 639308B8
P 7050 950
F 0 "#PWR022" H 7050 700 50  0001 C CNN
F 1 "GND" H 7055 777 50  0000 C CNN
F 2 "" H 7050 950 50  0001 C CNN
F 3 "" H 7050 950 50  0001 C CNN
	1    7050 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1550 7200 1550
Wire Wire Line
	7800 1450 8150 1450
Connection ~ 7800 1450
Wire Wire Line
	8450 1450 8700 1450
$Comp
L power:GND #PWR033
U 1 1 63964A1C
P 8700 1350
F 0 "#PWR033" H 8700 1100 50  0001 C CNN
F 1 "GND" H 8705 1177 50  0000 C CNN
F 2 "" H 8700 1350 50  0001 C CNN
F 3 "" H 8700 1350 50  0001 C CNN
	1    8700 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 2300 7200 2300
Wire Wire Line
	7200 2750 7200 2300
Connection ~ 7200 2300
Wire Wire Line
	7200 2300 7350 2300
$Comp
L power:GND #PWR019
U 1 1 6399E9F7
P 6750 2300
F 0 "#PWR019" H 6750 2050 50  0001 C CNN
F 1 "GND" H 6755 2127 50  0000 C CNN
F 2 "" H 6750 2300 50  0001 C CNN
F 3 "" H 6750 2300 50  0001 C CNN
	1    6750 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 2950 7200 2950
Wire Wire Line
	6750 2950 6100 2950
$Comp
L Device:R R15
U 1 1 63A087BA
P 7500 3650
F 0 "R15" V 7688 3574 50  0000 L CNN
F 1 "22k" V 7598 3579 50  0000 L CNN
F 2 "" V 7430 3650 50  0001 C CNN
F 3 "~" H 7500 3650 50  0001 C CNN
	1    7500 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 4100 7200 3650
Wire Wire Line
	7200 3650 7350 3650
Wire Wire Line
	7050 3650 7200 3650
Connection ~ 7200 3650
Wire Wire Line
	7650 3650 7800 3650
Wire Wire Line
	7800 3650 7800 4200
Wire Wire Line
	7800 2850 7800 2300
Wire Wire Line
	7800 2300 7650 2300
Wire Wire Line
	7800 2850 8150 2850
Connection ~ 7800 2850
Wire Wire Line
	8450 2850 8700 2850
$Comp
L power:GND #PWR034
U 1 1 63A4311B
P 8700 2750
F 0 "#PWR034" H 8700 2500 50  0001 C CNN
F 1 "GND" H 8705 2577 50  0000 C CNN
F 2 "" H 8700 2750 50  0001 C CNN
F 3 "" H 8700 2750 50  0001 C CNN
	1    8700 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 63A478E0
P 8300 4200
F 0 "R18" V 8467 4125 50  0000 L CNN
F 1 "1k" V 8389 4153 50  0000 L CNN
F 2 "" V 8230 4200 50  0001 C CNN
F 3 "~" H 8300 4200 50  0001 C CNN
	1    8300 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR031
U 1 1 63A4ADC9
P 8650 4100
F 0 "#PWR031" H 8650 3850 50  0001 C CNN
F 1 "GND" H 8655 3927 50  0000 C CNN
F 2 "" H 8650 4100 50  0001 C CNN
F 3 "" H 8650 4100 50  0001 C CNN
	1    8650 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 4200 8150 4200
Connection ~ 7800 4200
Wire Wire Line
	8450 4200 8650 4200
$Comp
L Device:R R12
U 1 1 63A4CF74
P 6900 4300
F 0 "R12" V 7072 4248 50  0000 L CNN
F 1 "18k" V 6989 4230 50  0000 L CNN
F 2 "" V 6830 4300 50  0001 C CNN
F 3 "~" H 6900 4300 50  0001 C CNN
	1    6900 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 4300 7200 4300
Wire Wire Line
	6100 3250 6250 3250
Wire Wire Line
	6250 3250 6250 4300
Wire Wire Line
	6250 4300 6750 4300
$Comp
L power:GND #PWR020
U 1 1 63A57AB4
P 6750 3650
F 0 "#PWR020" H 6750 3400 50  0001 C CNN
F 1 "GND" H 6755 3477 50  0000 C CNN
F 2 "" H 6750 3650 50  0001 C CNN
F 3 "" H 6750 3650 50  0001 C CNN
	1    6750 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 5350 7800 4850
Wire Wire Line
	7800 4850 7200 4850
Wire Wire Line
	7200 4850 7200 5250
$Comp
L Device:R R13
U 1 1 63A7B668
P 6900 4850
F 0 "R13" V 7088 4775 50  0000 L CNN
F 1 "100k" V 7002 4756 50  0000 L CNN
F 2 "" V 6830 4850 50  0001 C CNN
F 3 "~" H 6900 4850 50  0001 C CNN
	1    6900 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 63A7BC65
P 6750 4850
F 0 "#PWR021" H 6750 4600 50  0001 C CNN
F 1 "GND" H 6755 4677 50  0000 C CNN
F 2 "" H 6750 4850 50  0001 C CNN
F 3 "" H 6750 4850 50  0001 C CNN
	1    6750 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4850 7200 4850
Connection ~ 7200 4850
Wire Wire Line
	4100 1400 4850 1400
Wire Wire Line
	4850 1400 4850 1700
Connection ~ 4850 1700
Wire Wire Line
	4100 1600 4950 1600
Wire Wire Line
	4100 1700 4750 1700
Wire Wire Line
	4650 3250 5100 3250
Wire Wire Line
	5800 1700 6250 1700
Wire Wire Line
	6250 1700 6250 1550
Wire Wire Line
	4550 1900 4550 3050
Wire Wire Line
	4550 3050 5100 3050
Wire Wire Line
	4450 2000 4450 5450
Wire Wire Line
	4450 5450 7200 5450
Wire Wire Line
	7800 5350 8150 5350
Connection ~ 7800 5350
Wire Wire Line
	8450 5350 8650 5350
$Comp
L power:GND #PWR032
U 1 1 63B0386B
P 8650 5250
F 0 "#PWR032" H 8650 5000 50  0001 C CNN
F 1 "GND" H 8655 5077 50  0000 C CNN
F 2 "" H 8650 5250 50  0001 C CNN
F 3 "" H 8650 5250 50  0001 C CNN
	1    8650 5250
	0    1    1    0   
$EndComp
$Comp
L Isolator:6N138 U2
U 1 1 63B0A8E4
P 3450 4500
F 0 "U2" H 3300 4150 50  0000 C CNN
F 1 "6N138" H 3350 4050 50  0000 C CNN
F 2 "" H 3740 4200 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/HCPL2731-D.pdf" H 3740 4200 50  0001 C CNN
	1    3450 4500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7808 U1
U 1 1 63B37499
P 1150 4400
F 0 "U1" V 1000 4550 50  0000 C CNN
F 1 "L7808" V 1100 4600 50  0000 C CNN
F 2 "" H 1175 4250 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 1150 4350 50  0001 C CNN
	1    1150 4400
	0    1    1    0   
$EndComp
$Comp
L power:+15V #PWR02
U 1 1 63B4CD1E
P 1150 4100
F 0 "#PWR02" H 1150 3950 50  0001 C CNN
F 1 "+15V" H 1165 4273 50  0000 C CNN
F 2 "" H 1150 4100 50  0001 C CNN
F 3 "" H 1150 4100 50  0001 C CNN
	1    1150 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 63B55D9F
P 850 4400
F 0 "#PWR01" H 850 4150 50  0001 C CNN
F 1 "GND" H 855 4227 50  0000 C CNN
F 2 "" H 850 4400 50  0001 C CNN
F 3 "" H 850 4400 50  0001 C CNN
	1    850  4400
	0    1    1    0   
$EndComp
$Comp
L Connector:DIN-5_180degree J1
U 1 1 63B6F8EB
P 2300 4150
F 0 "J1" H 2300 3783 50  0000 C CNN
F 1 "MIDI IN" H 2300 3874 50  0000 C CNN
F 2 "" H 2300 4150 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 2300 4150 50  0001 C CNN
	1    2300 4150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 63B7A3B2
P 2950 4400
F 0 "R4" V 2743 4400 50  0000 C CNN
F 1 "220" V 2834 4400 50  0000 C CNN
F 2 "" V 2880 4400 50  0001 C CNN
F 3 "~" H 2950 4400 50  0001 C CNN
	1    2950 4400
	0    1    1    0   
$EndComp
$Comp
L Connector:DIN-5_180degree J2
U 1 1 63B83A61
P 2300 5050
F 0 "J2" H 2300 4683 50  0000 C CNN
F 1 "WX MIDI IN" H 2300 4774 50  0000 C CNN
F 2 "" H 2300 5050 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 2300 5050 50  0001 C CNN
	1    2300 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 4250 2000 4250
Wire Wire Line
	1900 4250 1900 4600
Wire Wire Line
	2600 4250 2700 4250
$Comp
L power:GND #PWR014
U 1 1 63BD9C6A
P 3950 5200
F 0 "#PWR014" H 3950 4950 50  0001 C CNN
F 1 "GND" H 3955 5027 50  0000 C CNN
F 2 "" H 3950 5200 50  0001 C CNN
F 3 "" H 3950 5200 50  0001 C CNN
	1    3950 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2700 4200 2700
$Comp
L Device:R R6
U 1 1 63BF1979
P 3950 5050
F 0 "R6" H 3880 5004 50  0000 R CNN
F 1 "1k" H 3880 5095 50  0000 R CNN
F 2 "" V 3880 5050 50  0001 C CNN
F 3 "~" H 3950 5050 50  0001 C CNN
	1    3950 5050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 63BFFC85
P 3750 5200
F 0 "#PWR013" H 3750 4950 50  0001 C CNN
F 1 "GND" H 3755 5027 50  0000 C CNN
F 2 "" H 3750 5200 50  0001 C CNN
F 3 "" H 3750 5200 50  0001 C CNN
	1    3750 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4700 3750 5200
$Comp
L Device:R R5
U 1 1 63C2645B
P 3950 4000
F 0 "R5" V 4157 4000 50  0000 C CNN
F 1 "470" V 4066 4000 50  0000 C CNN
F 2 "" V 3880 4000 50  0001 C CNN
F 3 "~" H 3950 4000 50  0001 C CNN
	1    3950 4000
	0    -1   -1   0   
$EndComp
Connection ~ 4200 4000
Wire Wire Line
	4200 4000 4200 4600
$Comp
L power:+5V #PWR011
U 1 1 63C4584F
P 3550 4000
F 0 "#PWR011" H 3550 3850 50  0001 C CNN
F 1 "+5V" H 3565 4173 50  0000 C CNN
F 2 "" H 3550 4000 50  0001 C CNN
F 3 "" H 3550 4000 50  0001 C CNN
	1    3550 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 4600 4200 4600
Wire Wire Line
	4100 4000 4200 4000
Wire Wire Line
	3750 4000 3800 4000
Wire Wire Line
	3550 4000 3750 4000
Connection ~ 3750 4000
Wire Wire Line
	3750 4000 3750 4300
Wire Wire Line
	3950 4900 3950 4400
Wire Wire Line
	3750 4400 3950 4400
Wire Wire Line
	1900 4600 3150 4600
Wire Wire Line
	3100 4400 3150 4400
Wire Wire Line
	2800 4400 2700 4400
Wire Wire Line
	2700 4400 2700 4250
$Comp
L Device:LED D1
U 1 1 63CFE04F
P 2300 3500
F 0 "D1" H 2293 3717 50  0000 C CNN
F 1 "MIDI Act LED" H 2293 3626 50  0000 C CNN
F 2 "" H 2300 3500 50  0001 C CNN
F 3 "~" H 2300 3500 50  0001 C CNN
	1    2300 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 63D332C7
P 2750 3500
F 0 "R3" V 2957 3500 50  0000 C CNN
F 1 "220" V 2866 3500 50  0000 C CNN
F 2 "" V 2680 3500 50  0001 C CNN
F 3 "~" H 2750 3500 50  0001 C CNN
	1    2750 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 3500 2600 3500
Wire Wire Line
	2900 3500 4300 3500
$Comp
L power:GND #PWR04
U 1 1 63D3A9A1
P 2000 3500
F 0 "#PWR04" H 2000 3250 50  0001 C CNN
F 1 "GND" H 2005 3327 50  0000 C CNN
F 2 "" H 2000 3500 50  0001 C CNN
F 3 "" H 2000 3500 50  0001 C CNN
	1    2000 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 3500 2150 3500
$Comp
L Switch:SW_Coded_SH-7050 SW2
U 1 1 63D4CF04
P 1750 1900
F 0 "SW2" H 1807 2367 50  0000 C CNN
F 1 "MIDI Channel" H 1807 2276 50  0000 C CNN
F 2 "" H 1450 1450 50  0001 L CNN
F 3 "https://www.nidec-copal-electronics.com/e/catalog/switch/sh-7000.pdf" H 1750 1900 50  0001 C CNN
	1    1750 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 63D66A4B
P 2300 1550
F 0 "#PWR05" H 2300 1300 50  0001 C CNN
F 1 "GND" H 2305 1377 50  0000 C CNN
F 2 "" H 2300 1550 50  0001 C CNN
F 3 "" H 2300 1550 50  0001 C CNN
	1    2300 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 1700 2300 1700
Wire Wire Line
	2300 1700 2300 1550
Wire Wire Line
	2150 2100 3100 2100
Wire Wire Line
	2150 2000 3100 2000
Wire Wire Line
	2150 1900 3100 1900
Wire Wire Line
	2150 1800 3100 1800
$Comp
L power:+15V #PWR07
U 1 1 63DBF612
P 2650 6650
F 0 "#PWR07" H 2650 6500 50  0001 C CNN
F 1 "+15V" H 2665 6823 50  0000 C CNN
F 2 "" H 2650 6650 50  0001 C CNN
F 3 "" H 2650 6650 50  0001 C CNN
	1    2650 6650
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 63D99E2D
P 4800 6850
F 0 "J3" H 5000 6450 50  0000 R CNN
F 1 "Power" H 5000 6350 50  0000 R CNN
F 2 "" H 4800 6850 50  0001 C CNN
F 3 "~" H 4800 6850 50  0001 C CNN
	1    4800 6850
	-1   0    0    -1  
$EndComp
$Comp
L power:-15V #PWR09
U 1 1 63DE904B
P 2650 7250
F 0 "#PWR09" H 2650 7350 50  0001 C CNN
F 1 "-15V" H 2665 7423 50  0000 C CNN
F 2 "" H 2650 7250 50  0001 C CNN
F 3 "" H 2650 7250 50  0001 C CNN
	1    2650 7250
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 63E2EA2F
P 2650 6050
F 0 "#PWR06" H 2650 5900 50  0001 C CNN
F 1 "+5V" H 2665 6223 50  0000 C CNN
F 2 "" H 2650 6050 50  0001 C CNN
F 3 "" H 2650 6050 50  0001 C CNN
	1    2650 6050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6387AE09
P 1750 5050
F 0 "#PWR03" H 1750 4800 50  0001 C CNN
F 1 "GND" H 1755 4877 50  0000 C CNN
F 2 "" H 1750 5050 50  0001 C CNN
F 3 "" H 1750 5050 50  0001 C CNN
	1    1750 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 5050 2000 5050
Wire Wire Line
	2000 5450 2000 5150
Wire Wire Line
	1900 5350 2300 5350
$Comp
L Device:R R2
U 1 1 638D55F0
P 2700 4850
F 0 "R2" H 2770 4896 50  0000 L CNN
F 1 "220" H 2770 4805 50  0000 L CNN
F 2 "" V 2630 4850 50  0001 C CNN
F 3 "~" H 2700 4850 50  0001 C CNN
	1    2700 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4400 2700 4700
Connection ~ 2700 4400
$Comp
L Device:R R1
U 1 1 638DFD2D
P 1900 4850
F 0 "R1" H 1970 4896 50  0000 L CNN
F 1 "220" H 1970 4805 50  0000 L CNN
F 2 "" V 1830 4850 50  0001 C CNN
F 3 "~" H 1900 4850 50  0001 C CNN
	1    1900 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4600 1900 4700
Connection ~ 1900 4600
Wire Wire Line
	1900 5000 1900 5350
$Comp
L Switch:SW_SPST SW1
U 1 1 638F0A1D
P 1150 5050
F 0 "SW1" V 1100 4850 50  0000 L CNN
F 1 "WX Power" V 1200 4600 50  0000 L CNN
F 2 "" H 1150 5050 50  0001 C CNN
F 3 "~" H 1150 5050 50  0001 C CNN
	1    1150 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 5000 2700 5450
Wire Wire Line
	1150 5450 2000 5450
Connection ~ 2000 5450
Wire Wire Line
	2000 5450 2700 5450
Wire Wire Line
	1150 5450 1150 5250
Wire Wire Line
	1150 4850 1150 4700
$Comp
L Device:R R11
U 1 1 63A5DD56
P 6900 3650
F 0 "R11" V 7088 3575 50  0000 L CNN
F 1 "100k" V 7002 3556 50  0000 L CNN
F 2 "" V 6830 3650 50  0001 C CNN
F 3 "~" H 6900 3650 50  0001 C CNN
	1    6900 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 63A5E865
P 6900 2300
F 0 "R9" V 7088 2225 50  0000 L CNN
F 1 "100k" V 7002 2206 50  0000 L CNN
F 2 "" V 6830 2300 50  0001 C CNN
F 3 "~" H 6900 2300 50  0001 C CNN
	1    6900 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 63A6A487
P 6900 2950
F 0 "R10" V 7072 2898 50  0000 L CNN
F 1 "18k" V 6989 2880 50  0000 L CNN
F 2 "" V 6830 2950 50  0001 C CNN
F 3 "~" H 6900 2950 50  0001 C CNN
	1    6900 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R19
U 1 1 63A6CAA1
P 8300 5350
F 0 "R19" V 8467 5275 50  0000 L CNN
F 1 "1k" V 8389 5303 50  0000 L CNN
F 2 "" V 8230 5350 50  0001 C CNN
F 3 "~" H 8300 5350 50  0001 C CNN
	1    8300 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R17
U 1 1 63A6E8C6
P 8300 2850
F 0 "R17" V 8467 2775 50  0000 L CNN
F 1 "1k" V 8389 2803 50  0000 L CNN
F 2 "" V 8230 2850 50  0001 C CNN
F 3 "~" H 8300 2850 50  0001 C CNN
	1    8300 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R16
U 1 1 63A70441
P 8300 1450
F 0 "R16" V 8467 1375 50  0000 L CNN
F 1 "1k" V 8389 1403 50  0000 L CNN
F 2 "" V 8230 1450 50  0001 C CNN
F 3 "~" H 8300 1450 50  0001 C CNN
	1    8300 1450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 63A784FC
P 7500 2300
F 0 "R14" V 7688 2224 50  0000 L CNN
F 1 "22k" V 7598 2229 50  0000 L CNN
F 2 "" V 7430 2300 50  0001 C CNN
F 3 "~" H 7500 2300 50  0001 C CNN
	1    7500 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 3500 4300 2100
Wire Wire Line
	4200 2700 4200 4000
$Comp
L power:GND #PWR08
U 1 1 63DF339E
P 2650 6950
F 0 "#PWR08" H 2650 6700 50  0001 C CNN
F 1 "GND" H 2655 6777 50  0000 C CNN
F 2 "" H 2650 6950 50  0001 C CNN
F 3 "" H 2650 6950 50  0001 C CNN
	1    2650 6950
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 C9
U 1 1 63AE358D
P 3800 7100
F 0 "C9" H 3915 7146 50  0000 L CNN
F 1 "22uF" H 3915 7055 50  0000 L CNN
F 2 "" H 3800 7100 50  0001 C CNN
F 3 "~" H 3800 7100 50  0001 C CNN
	1    3800 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 63AE633E
P 3350 7100
F 0 "C6" H 3465 7146 50  0000 L CNN
F 1 "0.1uF" H 3465 7055 50  0000 L CNN
F 2 "" H 3388 6950 50  0001 C CNN
F 3 "~" H 3350 7100 50  0001 C CNN
	1    3350 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C8
U 1 1 63AEACF7
P 3800 6800
F 0 "C8" H 3915 6846 50  0000 L CNN
F 1 "22uF" H 3915 6755 50  0000 L CNN
F 2 "" H 3800 6800 50  0001 C CNN
F 3 "~" H 3800 6800 50  0001 C CNN
	1    3800 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 63AFA733
P 3350 6800
F 0 "C5" H 3465 6846 50  0000 L CNN
F 1 "0.1uF" H 3465 6755 50  0000 L CNN
F 2 "" H 3388 6650 50  0001 C CNN
F 3 "~" H 3350 6800 50  0001 C CNN
	1    3350 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 63AFA9DF
P 2900 6800
F 0 "C2" H 3015 6846 50  0000 L CNN
F 1 "0.1uF" H 3015 6755 50  0000 L CNN
F 2 "" H 2938 6650 50  0001 C CNN
F 3 "~" H 2900 6800 50  0001 C CNN
	1    2900 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 63AFADBF
P 2900 7100
F 0 "C3" H 3015 7146 50  0000 L CNN
F 1 "0.1uF" H 3015 7055 50  0000 L CNN
F 2 "" H 2938 6950 50  0001 C CNN
F 3 "~" H 2900 7100 50  0001 C CNN
	1    2900 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6950 3350 6950
Connection ~ 2900 6950
Connection ~ 3800 6950
Connection ~ 3350 6950
Wire Wire Line
	3350 6950 3800 6950
Wire Wire Line
	2900 7250 3350 7250
Connection ~ 3350 7250
Wire Wire Line
	3350 7250 3800 7250
Wire Wire Line
	2900 6650 3350 6650
Connection ~ 3350 6650
Wire Wire Line
	3350 6650 3800 6650
Connection ~ 2900 7250
Wire Wire Line
	2650 7250 2900 7250
Wire Wire Line
	2650 6650 2900 6650
Connection ~ 2900 6650
$Comp
L Device:CP1 C7
U 1 1 63B3362A
P 3800 6200
F 0 "C7" H 3915 6246 50  0000 L CNN
F 1 "22uF" H 3915 6155 50  0000 L CNN
F 2 "" H 3800 6200 50  0001 C CNN
F 3 "~" H 3800 6200 50  0001 C CNN
	1    3800 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 63B33A03
P 3350 6200
F 0 "C4" H 3465 6246 50  0000 L CNN
F 1 "0.1uF" H 3465 6155 50  0000 L CNN
F 2 "" H 3388 6050 50  0001 C CNN
F 3 "~" H 3350 6200 50  0001 C CNN
	1    3350 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 63B33ECB
P 2900 6200
F 0 "C1" H 3015 6246 50  0000 L CNN
F 1 "0.1uF" H 3015 6155 50  0000 L CNN
F 2 "" H 2938 6050 50  0001 C CNN
F 3 "~" H 2900 6200 50  0001 C CNN
	1    2900 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6950 2900 6950
Wire Wire Line
	2900 6350 3350 6350
Connection ~ 3350 6350
Wire Wire Line
	3350 6350 3800 6350
Wire Wire Line
	2650 6050 2900 6050
Connection ~ 2900 6050
Wire Wire Line
	2900 6050 3350 6050
Connection ~ 3350 6050
Wire Wire Line
	3350 6050 3800 6050
Wire Wire Line
	3800 7250 4250 7250
Wire Wire Line
	4250 7250 4250 7050
Wire Wire Line
	4250 7050 4600 7050
Connection ~ 3800 7250
Wire Wire Line
	3800 6950 4250 6950
Wire Wire Line
	4250 6950 4600 6950
Connection ~ 3800 6650
Wire Wire Line
	4250 6950 4250 6350
Wire Wire Line
	4250 6350 3800 6350
Connection ~ 4250 6950
Connection ~ 3800 6350
Wire Wire Line
	3800 6650 4600 6650
Wire Wire Line
	4600 6850 4350 6850
Wire Wire Line
	4350 6850 4350 6050
Wire Wire Line
	4350 6050 3800 6050
Connection ~ 3800 6050
Text Label 4800 6950 0    50   ~ 0
Ground
Text Label 4800 7050 0    50   ~ 0
-15VDC
Text Label 4800 7150 0    50   ~ 0
NC
Text Label 4800 6650 0    50   ~ 0
+15VDC
Text Label 4800 6750 0    50   ~ 0
Key
Text Label 4800 6850 0    50   ~ 0
+5VDC
Text Notes 2150 2250 0    50   ~ 0
20k pull-up in Arduino
$Comp
L Device:R R7
U 1 1 63C16740
P 6600 1550
F 0 "R7" V 6779 1498 50  0000 L CNN
F 1 "22k" V 6688 1479 50  0000 L CNN
F 2 "" V 6530 1550 50  0001 C CNN
F 3 "~" H 6600 1550 50  0001 C CNN
	1    6600 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R8
U 1 1 63C20D15
P 6900 1550
F 0 "R8" V 7079 1498 50  0000 L CNN
F 1 "2.2k" V 6993 1467 50  0000 L CNN
F 2 "" V 6830 1550 50  0001 C CNN
F 3 "~" H 6900 1550 50  0001 C CNN
	1    6900 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 1550 6450 1550
Wire Wire Line
	4750 1700 4750 1800
Wire Wire Line
	4750 1800 5100 1800
Wire Wire Line
	4300 2100 4100 2100
Wire Wire Line
	4450 2000 4100 2000
Wire Wire Line
	4550 1900 4100 1900
Wire Wire Line
	4100 1800 4650 1800
Wire Wire Line
	4650 1800 4650 3250
Wire Wire Line
	4950 1600 4950 3150
Connection ~ 4950 1600
Wire Wire Line
	4950 1600 5100 1600
$EndSCHEMATC