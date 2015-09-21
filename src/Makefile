# Install rotd/rotor
.PHONY: extract install uninstall


install: extract
	sudo install -m 0644 _libnss/libnss_rotd.so.2 /lib
	sudo /sbin/ldconfig -n /lib /usr/lib

extract:
	sudo mkdir /opt/rotor && sudo tar --no-same-owner -xvf _rotor/rotor-0.1.0.tar.gz -C /opt/rotor

uninstall:
	sudo rm -rf /opt/rotor
	sudo rm /lib/libnss_rotd.so.2
	sudo /sbin/ldconfig -n /lib /usr/lib
