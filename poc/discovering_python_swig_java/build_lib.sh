#!/bin/bash

# for solving ruby/config.h bug, run:
#	sudo ln -s /usr/include/x86_64-linux-gnu/ruby-2.1.0/ruby/config.h \
#		   /usr/include/ruby-2.1.0/ruby/config.h

RUBY_INCLUDE_PATH=/usr/include/ruby-2.1.0/

swig3.0 -java myextension.i



# VERSION 1

#gcc -I. function.c -c -fPIC -std=gnu99 -Wall -lffi
#gcc -I$RUBY_INCLUDE_PATH -I. ruby_backend.c -c -fPIC -std=gnu99 -lruby-2.1
#gcc `python3.4-config --cflags` -I. python_backend.c -c -fPIC -std=gnu99 `python3.4-config --ldflags`

#gcc -I. -I/usr/lib/jvm/java-1.7.0-openjdk-amd64/include/ -I/usr/lib/jvm/java-7-openjdk-amd64/include/ function.o ruby_backend.o python_backend.o -c myextension.c myextension_wrap.c -fPIC -std=gnu99 -lffi -lruby-2.1 `python3.4-config --ldflags`

#ld -G function.o ruby_backend.o python_backend.o myextension.o -fPIC -o libmyextension.so



# VERSION 2

gcc -I. -I$RUBY_INCLUDE_PATH `python3.4-config --cflags` -I/usr/lib/jvm/java-1.7.0-openjdk-amd64/include/ -I/usr/lib/jvm/java-7-openjdk-amd64/include/ -c function.c ruby_backend.c python_backend.c myextension.c myextension_wrap.c -fPIC -std=gnu99 -lffi -lruby-2.1 `python3.4-config --ldflags`
gcc -shared -o libmyextension.so function.o ruby_backend.o python_backend.o myextension.o myextension_wrap.o -lffi -lruby-2.1 `python3.4-config --ldflags`

exit 0
