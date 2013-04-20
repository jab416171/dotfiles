sudo touch /etc/udev/rules.d/51-android.rules

sudo echo '# adb protocol on passion (Nexus One)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e12", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# fastboot protocol on passion (Nexus One)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", ATTR{idProduct}=="0fff", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# adb protocol on crespo/crespo4g (Nexus S)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e22", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# fastboot protocol on crespo/crespo4g (Nexus S)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e20", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# adb protocol on stingray/wingray (Xoom)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", ATTR{idProduct}=="70a9", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# fastboot protocol on stingray/wingray (Xoom)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="708c", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# adb protocol on maguro/toro (Galaxy Nexus)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", ATTR{idProduct}=="6860", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# fastboot protocol on maguro/toro (Galaxy Nexus)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e30", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# adb protocol on panda (PandaBoard)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0451", ATTR{idProduct}=="d101", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# fastboot protocol on panda (PandaBoard)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0451", ATTR{idProduct}=="d022", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# usbboot protocol on panda (PandaBoard)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0451", ATTR{idProduct}=="d00f", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# usbboot protocol on panda (PandaBoard ES)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0451", ATTR{idProduct}=="d010", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# adb protocol on grouper (Nexus 7)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e42", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules
sudo echo '# fastboot protocol on grouper (Nexus 7)' >> /etc/udev/rules.d/51-android.rules
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e40", MODE="0600", OWNER="<username>"' >> /etc/udev/rules.d/51-android.rules


