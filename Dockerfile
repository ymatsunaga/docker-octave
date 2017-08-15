FROM jupyter/base-notebook
MAINTAINER Yasuhiro Matsunaga <ymatsunaga@riken.jp>

USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
 && apt-get -y install \
      octave \
      libnetcdf-dev \
      liboctave-dev \
      git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER jovyan
WORKDIR /home/jovyan

RUN octave --no-gui --eval "pkg install -verbose -forge -auto netcdf"
RUN octave --no-gui --eval "pkg install -verbose -forge -auto io"
RUN octave --no-gui --eval "pkg install -verbose -forge -auto statistics"

RUN git clone https://github.com/ymatsunaga/mdtoolbox.git

WORKDIR /home/jovyan/mdtoolbox

RUN octave --no-gui --eval "make"

WORKDIR /home/jovyan
ENV OMP_NUM_THREADS 8
COPY .octaverc /home/jovyan/

WORKDIR /home/jovyan/work

RUN pip install octave_kernel \
 && python -m octave_kernel.install \
 && conda install -y ipywidgets

