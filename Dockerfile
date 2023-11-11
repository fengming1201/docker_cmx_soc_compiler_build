FROM debian:11

ARG CROSS_TOOLCHAIN=gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

WORKDIR /root/

ADD z.tar.gz  $CROSS_TOOLCHAIN  /opt
ADD fengming.d.tar.gz  /etc


RUN cat <<-EOF >> .bashrc
export LANG=en_US.UTF-8

if [ -f /etc/fengming.d/mybashrc  ];then
    . /etc/fengming.d/mybashrc
fi
EOF

RUN cat <<-EOF > /etc/apt/sources.list
deb http://mirrors.163.com/debian/ bullseye main contrib 
deb http://mirrors.163.com/debian/ bullseye-updates main contrib
EOF

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y locales vim git wget tree bd file \
		build-essential lib32z1 \
		make cmake gcc-multilib \
		stm32flash

RUN cp /etc/locale.gen /etc/locale.gen.bak;\
		echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen;\
		locale-gen

ENV PATH=$PATH:/opt/gcc-arm-none-eabi-10.3-2021.10/bin
ENV COMPILER4WHO=stm32_gcc_compiler

CMD ["/bin/bash"]
