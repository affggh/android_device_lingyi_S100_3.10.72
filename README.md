# dotOS 2.1 device tree for Infinix HOT2 x510 

Infinix HOT2 x510 (sprout16)

Convert from Ixion P350 by Vgdn1942
==============

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 1.3GHz Quad-Core MT6580
GPU     | Mali-400MP
Memory  | 1GB RAM & 2GB RAM
Shipped Android Version | 5.1
Storage | 16GB
Battery | 2200 mAh
Display | 5" 1280 x 720 px
Camera  | Back 8MPx, Front 2MPx, LED Flash

![DEXP](https://www.techzim.co.zw/wp-content/uploads/2015/08/infinix-4248-875433-3-zoom.jpg "Infinix HOT2 x510")

Working:
- Wi-Fi
- Modem/RIL
- Voice
- Mobile data
- SMS
- USSD
- Bluetooth
- Audio
- Wi-Fi tethering
- Second SIM
- Sensors
- Lights
- USB connection (ADB/MTP/PTP)
- SD-Card
- Poweroff charge

Not working/Bugs:
- Reboots after deepsleep (when screen off) (temporary fix 99wakelock_for_no_reboots script, but the processor does not go to sleep)
- Camera
- GPS
- Video record/play
- YouTube 720p

# Acknowledgements

(in alphabetical order)

* Vgdn1942 
* Ibrahim Fathelbab 
* DerTeufel
* ferhung
* fire855
* mishkannn (4pda, fix YouTube 720p)
* varunchitre15
* xen0n
* Zormax (4pda, add EngineerMode)
* and others I might have forgotten to include
