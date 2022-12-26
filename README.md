# To install the OpenMPTCProuter on an ARM64 VPS, follow these steps:

1. Download the necessary .deb files from the release page of the repository.
2. Install all of the .deb files as root. You can do this by running the following command for each .deb file:

```
dpkg -i <deb file>
```
3. Download the installation script with the following command:

```
wget https://raw.githubusercontent.com/rickytrevor/openmptcprouter-vps-install-arm64/main/arm-ubuntu-install.sh

```
4. Make the script executable with the following command: 

```
chmod +x arm-ubuntu-install.sh

```
5. Run the script with the following command:

```
./arm-ubuntu-install.sh
```

This should install and configure the OpenMPTCProuter on your ARM64 VPS, if you encounter any issues please create an issue.

## Compiling your own Kernel

1. Clone the repository
2. run the following command

```
docker build -t mptcp-arm64-build . 
```
3. docker run -d --rm --name mptcp-arm64-build -v /dir/where/you/want/the/compiled/files/to/be/put:/build mptcp-arm64-build

you can monitor the build progress by running

```
docker logs -f mptcp-arm64-build
```

everything should appear in the directory specified earlier when the build is over
