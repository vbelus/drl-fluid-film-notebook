FROM ubuntu:latest
WORKDIR /root
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y python3 python3-pip python3-tk libopenmpi-dev wget libsm6 libxext6 libxrender-dev jupyter

ARG drl_dir=./drl-fluid-film/drl_fluid_film_python3

RUN cd /root \
  && mkdir drl_fluid_film_python3/
COPY $drl_dir drl_fluid_film_python3/

# Let's install the dependencies of the projects, they are in `setup.py`
RUN cd drl_fluid_film_python3/gym-film \
  && python3 -m pip install -U setuptools \
  && python3 -m pip install -e ./

# We will now get the boost library, which we will install in /usr/local/
RUN cd /usr/local \
  && wget -4 https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.bz2 \
  && tar --bzip2 -xf boost_1_67_0.tar.bz2

# Build it
RUN cd /usr/local/boost_1_67_0 \
  && ./bootstrap.sh --with-libraries=python --with-python=python3.6 \
  && ./b2

# You need to let the linker know the path to the library `libboost_numpy36.so.1.67.0`
RUN echo "export LD_LIBRARY_PATH=/usr/local/boost_1_67_0/bin.v2/libs/python/build/gcc-7.4.0/release/threading-multi:$LD_LIBRARY_PATH" >> /root/.bashrc

# Now we need to make sure the python/cpp bridge in our simulation solver is well built
RUN cd /root/drl_fluid_film_python3/gym-film/gym_film/envs/simulation_solver \
  && make clean \
  && make

# Copy the notebooks and images
COPY open-me.ipynb .
COPY Introduction-and-method-M1.ipynb Method-M2.ipynb Method-M3.ipynb drl_fluid_film_python3/gym-film/
RUN cd /root/drl_fluid_film_python3/gym-film/ \
  && mkdir img/
COPY img drl_fluid_film_python3/gym-film/img/

# Make the jupyter open when running a container
RUN echo "jupyter notebook --ip 0.0.0.0 --no-browser --allow-root" >> /root/.bashrc
