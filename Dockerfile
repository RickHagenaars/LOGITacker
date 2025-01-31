FROM kalilinux/kali-rolling

WORKDIR /root
RUN apt-get update && apt-get -y install wget git gcc-arm-none-eabi unzip sed make
# fetch nRF5 SDK 15.3.0
RUN wget https://www.nordicsemi.com/-/media/Software-and-other-downloads/SDKs/nRF5/Binaries/nRF5SDK153059ac345.zip && unzip nRF5SDK153059ac345.zip

COPY ./ /root/LOGITacker

# install python3 and download uf2conv.py for AprBrother image conversion (Intel HEX to UF2)
RUN wget https://raw.githubusercontent.com/microsoft/uf2/master/utils/uf2conv.py && apt-get -y install python3

# patch SDK to use Kali's arm-none-eabi toolchain (SED's delimiter changed to allow inline path)
RUN sed -i "s#^GNU_INSTALL_ROOT.*#GNU_INSTALL_ROOT \?= /usr/bin/#g" nRF5_SDK_15.3.0_59ac345/components/toolchain/gcc/Makefile.posix

# patch Nordic nRF52840 dongle Makefile for correct download path of SDK path and build
WORKDIR /root/LOGITacker/pca10059/blank/armgcc
RUN sed -i "s#^SDK_ROOT.*#SDK_ROOT := /root/nRF5_SDK_15.3.0_59ac345#g" Makefile && make


# collect results into /root/build directory
# could be accessed interactively with `docker run -ti <resulting image name> /bin/bash`
WORKDIR /root
RUN mkdir build && \
    cp LOGITacker/pca10059/blank/armgcc/_build/logitacker_pca10059.hex build

