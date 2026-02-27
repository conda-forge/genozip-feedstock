#!/bin/bash 

mkdir -p src/objdir.osx-arm/{zlib,bzlib,lzma,libdeflate_1.7,libdeflate_1.19,libdeflate_1.19/{x86,arm},bsc,htscodecs,igzip/{noarch}}
make -j -C src install
