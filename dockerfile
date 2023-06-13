# Set the base image to Ubuntu 20.04 LTS
FROM ubuntu:bionic-20230530

# My authorship
LABEL maintainer="ehill@iolani.org"
LABEL version="1.0.0"
LABEL description="remote_BLAST for the Iolani School"

# Disable prompts during package installation
ENV DEBIAN_FRONTEND noninteractive

# Convenience packages
RUN apt update
RUN apt install -y curl git g++ wget nano zlib1g-dev make bsdmainutils gawk bcftools libopenblas-base

# Conda/Mamba installation
RUN cd tmp
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh --output miniconda.sh
RUN bash miniconda.sh -bu
ENV PATH="/root/miniconda3/bin:$PATH"
RUN conda update -y conda

# Create conda environment for remote BLAST using BLAST+
RUN conda create -y -n remote_BLAST
SHELL ["conda", "run", "-n", "remote_BLAST", "/bin/bash", "-c"]
RUN conda init && \
    conda install -y -c bioconda blast=2.11.0 && \
    mkdir /home/github && \
    cd /home/github && \
    git clone https://github.com/ehill-iolani/remote_blast.git && \
    cp /home/github/remote_blast/remote_blast /bin && \
    chmod +x /bin/remote_blast && \
    mkdir /home/data && \
    echo "conda activate remote_BLAST" >> ~/.bashrc && \
    rm /miniconda.sh