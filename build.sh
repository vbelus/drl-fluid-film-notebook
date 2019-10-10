#!/bin/bash

# build the project
./drl-fluid-film/build.sh

# move the notebooks and images
cp open-me.ipynb drl-fluid-film/
cp Introduction-and-method-M1.ipynb Method-M2.ipynb Method-M3.ipynb drl-fluid-film/drl_fluid_film_python3/gym-film/
cp img drl-fluid-film/drl_fluid_film_python3/gym-film/

# Make the jupyter open when running a container
cd drl-fluid-film \
&& jupyter notebook 
