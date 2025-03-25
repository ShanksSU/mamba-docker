FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# 安裝 wget 和 OpenSSH 伺服器
RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    g++ \
    git \
    graphviz \
    libgl1-mesa-glx \
    libhdf5-dev \
    openmpi-bin \
    vim \
    wget \
    && rm -rf /var/lib/apt/list/* \
    && apt-get clean

# Download and install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p /opt/anaconda \
    && rm /tmp/miniconda.sh

# Set the root user's password (via environment variable)
ARG ROOT_PASSWORD
RUN echo "root:$ROOT_PASSWORD" | chpasswd

# Configure the SSH server
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && echo "Port 22" >> /etc/ssh/sshd_config \
    && mkdir /var/run/sshd

# Add environment variables to the root user's .bashrc file
RUN echo 'export PATH="/opt/anaconda/bin:$PATH"' >> /root/.bashrc \
    && echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.8/lib64' >> /root/.bashrc \
    && echo 'export CUDA_HOME=/usr/local/cuda-11.8' >> /root/.bashrc \
    && echo 'export PATH=$PATH:/usr/local/cuda-11.8/bin' >> /root/.bashrc

# Expose SSH port
EXPOSE 22

# Start the SSH server when the container runs
CMD ["/usr/sbin/sshd", "-D"]

# Build the Docker image:
# docker build --build-arg ROOT_PASSWORD=123456 -t nvidia_docker_v11_8 .

# Run the container:
# docker run -itd --name nvidia_docker_v11_8_v1 --gpus all --runtime nvidia -p 56783:22 nvidia_docker_v11_8

# Connect to the container via SSH:
# ssh root@[ip_address] -p [remote_container_port]
