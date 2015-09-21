# Package rotd/rotor

.PHONY: package clean buildroot

package: buildroot _build/rotd/_rotor/rotor-0.1.0.tar.gz _build/rotd/_libnss/libnss_rotd_so.2 _build/rotd/Makefile
	cd _build && tar -cvf rotd.tar rotd

_build/rotd/Makefile: src/Makefile
	cp src/Makefile _build/rotd/

_build/rotd/_rotor/rotor-0.1.0.tar.gz:
	cd ../rotor && rebar3 release tar
	cp ../rotor/_build/default/rel/rotor/rotor-0.1.0.tar.gz _build/rotd/_rotor/

_build/rotd/_libnss/libnss_rotd_so.2:
	cd ../libnss_rotd && make
	cp ../libnss_rotd/libnss_rotd.so.2 _build/rotd/_libnss

buildroot:
	mkdir _build _build/rotd _build/rotd/_rotor _build/rotd/_libnss

clean:
	rm -rf _build
