# Package rotor

.PHONY: package clean buildroot

package: buildroot _build/rotor/_rotor/rotor-0.2.0.tar.gz _build/rotor/_libnss/libnss_rotor_so.2 _build/rotor/Makefile _build/rotor/README
	cd _build && tar -cvf rotor.tar rotor

_build/rotor/Makefile: src/Makefile
	cp src/Makefile _build/rotor/

_build/rotor/README: doc/README
	cp doc/README _build/rotor/

_build/rotor/_rotor/rotor-0.2.0.tar.gz:
	cd ../rotor && rebar3 release tar
	cp ../rotor/_build/default/rel/rotor/rotor-0.2.0.tar.gz _build/rotor/_rotor/

_build/rotor/_libnss/libnss_rotor_so.2:
	cd ../libnss_rotor && make clean && make
	cp ../libnss_rotor/libnss_rotor.so.2 _build/rotor/_libnss

buildroot:
	mkdir _build _build/rotor _build/rotor/_rotor _build/rotor/_libnss

clean:
	rm -rf _build
