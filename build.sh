#!/bin/bash

# build the project
./falling-liquid-film-drl/build.sh

# move the notebooks and images
cp open-me.ipynb falling-liquid-film-drl/
cp Introduction-and-method-M1.ipynb Method-M2.ipynb Method-M3.ipynb falling-liquid-film-drl/drl_fluid_film_python3/gym-film/
cp img falling-liquid-film-drl/drl_fluid_film_python3/gym-film/

# Make the jupyter open when running a container
cd falling-liquid-film-drl \
&& jupyter notebook 
