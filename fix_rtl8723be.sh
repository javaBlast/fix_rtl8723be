#/usr/bin/bash


echo "Download rtlwifi drivers"
git clone https://github.com/lwfinger/rtlwifi_new.git
cd rtlwifi_new
git checkout rock.new_btcoex

echo "make and install package"
make clean && make
sudo make install

echo "options rtl8723be fwlps=N ips=N swlps=N swenc=Y disable_watchdog=1 ant_sel=2" | sudo tee /etc/modprobe.d/rtl8723be.conf

echo "rebooting system"
sudo reboot
