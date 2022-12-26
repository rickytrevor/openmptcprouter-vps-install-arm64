cd /root


wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.207.tar.xz
tar xvf linux-5.4.207.tar.xz
cd /root/linux-5.4.207


wget https://github.com/Ysurac/openmptcprouter/raw/develop/root/target/linux/generic/hack-5.4/690-mptcp_v0.96.patch
patch -p1 < 690-mptcp_v0.96.patch
wget https://www.openmptcprouter.com/kernel/config-5.4-mptcp
mv config-5.4-mptcp .config

yes "" | make oldconfig
sleep 2
config=$(cat .config | grep CONFIG_LOCALVERSION=)
if [ "$config" != "CONFIG_LOCALVERSION=\"-mptcp\"" ]; then
    # remove CONFIG_LOCALVERSION=""
    sed -i '/CONFIG_LOCALVERSION=/d' .config
    echo "CONFIG_LOCALVERSION=\"-mptcp\"" >> .config
fi
yes "" | make -j $(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- deb-pkg
mv  ../*.deb /build
