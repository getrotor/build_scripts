# Package rotd/rotor

package: _build/_rotor/rotor-0.1.0.tar.gz _build/_libnss/libnss_rotd_so.2 _build/Makefile
	echo DONE

_build/Makefile: _build src/Makefile
	cp src/Makefile _build/

_build/_rotor/rotor-0.1.0.tar.gz: _build/_rotor
	cd ../rotor && rebar3 release tar
	cp ../rotor/_build/default/rel/rotor/rotor-0.1.0.tar.gz _build/_rotor/

_build/_libnss/libnss_rotd_so.2: _build/_libnss
	cd ../libnss_rotd && make
	cp ../libnss_rotd/libnss_rotd.so.2 _build/_libnss

_build/_rotor: _build
	mkdir _build/_rotor

_build/_libnss: _build
	mkdir _build/_libnss

_build:
	mkdir _build

clean:
	rm -rf _build
