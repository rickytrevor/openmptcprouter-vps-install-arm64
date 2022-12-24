cd /root


wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.207.tar.xz
tar xvf linux-5.4.207.tar.xz
cd linux-5.4.207

cd /root/linux-5.4.207


wget https://github.com/Ysurac/openmptcprouter/raw/develop/root/target/linux/generic/hack-5.4/690-mptcp_v0.96.patch
patch -p1 < 690-mptcp_v0.96.patch
wget https://www.openmptcprouter.com/kernel/config-5.4-mptcp
mv config-5.4-mptcp .config
yes "" | make oldconfig
make -j $(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- deb-pkg
mv  ../*.deb /build
