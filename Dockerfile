#基础镜像
FROM centos:7

# 更新yum、清空缓存、安装基本环境（c++）
RUN yum update -y && yum clean all && yum makecache fast \
&& yum install -y gcc-c++ make 

# 安装git、ifconfig
RUN yum install -y git \
&& yum install -y net-tools \
&& yum -y install vim

# 安装node14+
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - \
&& yum install -y nodejs

# 全局安装yarn
RUN npm install yarn -g

# 全局安装nrm
RUN npm install nrm -g 

# 全局安装NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash - 

# 创建项目文件夹
RUN mkdir /workspace 
WORKDIR /workspace
RUN chmod +x /workspace
VOLUME /workspace

#对外暴露的端口，可以继续添加其他项目的
EXPOSE 10001