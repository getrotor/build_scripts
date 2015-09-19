package:
	cd ../rotor/ && rebar3 release tar
	cd ../libnss_rotd && make
	cp ../rotor/_build/default/rel/rotor/rotor-0.1.0.tar.gz _builds
	cp ../libnss_rotd/libnss_rotd.so.2 _builds
