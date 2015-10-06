# Package rotd/rotor

.PHONY: package clean buildroot

package: buildroot _build/rotord/_rotor/rotor-0.2.0.tar.gz _build/rotord/_libnss/libnss_rotor_so.2 _build/rotord/Makefile _build/rotord/README
	cd _build && tar -cvf rotord.tar rotord

_build/rotord/Makefile: src/Makefile
	cp src/Makefile _build/rotord/

_build/rotord/README: doc/README
	cp doc/README _build/rotord/

_build/rotord/_rotor/rotor-0.2.0.tar.gz:
	cd ../rotor && rebar3 release tar
	cp ../rotor/_build/default/rel/rotor/rotor-0.2.0.tar.gz _build/rotord/_rotor/

_build/rotord/_libnss/libnss_rotor_so.2:
	cd ../libnss_rotor && make clean && make
	cp ../libnss_rotor/libnss_rotor.so.2 _build/rotord/_libnss

buildroot:
	mkdir _build _build/rotord _build/rotord/_rotor _build/rotord/_libnss

clean:
	rm -rf _build
