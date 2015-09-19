install:
	sudo install -m 0644 rotor/config/rotor.conf /etc
	sudo install -m 0644 libnss_rotd/libnss_rotd.so.2 /lib
	sudo /sbin/ldconfig -n /lib /usr/lib

uninstall:
	sudo rm /lib/libnss_rotd.so.2
	sudo /sbin/ldconfig -n /lib /usr/lib
