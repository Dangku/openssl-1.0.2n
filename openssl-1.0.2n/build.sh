TOP=/media/dangku/myssd/openssl
TOOLCHAIN=/usr/aarch64-linux-gnu

make clean-shared
make libclean
make clean
make dclean
make distclean

./Configure linux-aarch64 --prefix=/usr --openssldir=/etc/ssl -I${TOP}/include -I${TOOLCHAIN}/include -L${TOOLCHAIN}/lib -znow -zrelro -ldl -DOPENSSL_SMALL_FOOTPRINT no-idea no-md2 no-mdc2 no-rc5 no-sha0 no-camellia no-krb5 shared no-err zlib-dynamic no-sse2 no-ssl2 no-ssl3 no-sse2 no-perlasm

make MAKEDEPPROG="aarch64-linux-gnu-gcc" OPENWRT_OPTIMIZATION_FLAGS="-Os -pipe -fno-caller-saves -fno-caller-saves -Wno-unused-result  -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro -fpic"  depend

make CC="aarch64-linux-gnu-gcc" ASFLAGS="-Os -pipe -fno-caller-saves -fno-caller-saves -Wno-unused-result  -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro -fpic -I${TOP}/openssl-1.0.2n/crypto -c" AR="aarch64-linux-gnu-gcc-ar r" RANLIB="aarch64-linux-gnu-ranlib" OPENWRT_OPTIMIZATION_FLAGS="-Os -pipe -fno-caller-saves -fno-caller-saves -Wno-unused-result  -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro -fpic"  all

make CC="aarch64-linux-gnu-gcc" ASFLAGS="-Os -pipe -fno-caller-saves -fno-caller-saves -Wno-unused-result  -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro -fpic -I${TOP}/openssl-1.0.2n/crypto -c" AR="aarch64-linux-gnu-ar r" RANLIB="aarch64-linux-gnu-ranlib" OPENWRT_OPTIMIZATION_FLAGS="-Os -pipe -fno-caller-saves -fno-caller-saves -Wno-unused-result  -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro -fpic"  build-shared

make CC="aarch64-linux-gnu-gcc" OPENWRT_OPTIMIZATION_FLAGS="-Os -pipe -fno-caller-saves -fno-caller-saves -Wno-unused-result  -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro -fpic"  do_linux-shared

make CC="aarch64-linux-gnu-gcc" INSTALL_PREFIX="${TOP}/openssl-1.0.2n/ipkg-install"  install
