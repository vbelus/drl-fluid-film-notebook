# A notebook to visualize Deep Reinforcement Learning control on the falling liquid film
This notebook uses code from this project : https://github.com/vbelus/falling-liquid-film-drl and requires Docker.

Because of that, when cloning this repo, you have to use the `--recurse-submodules` flag to clone the main repo as well :
```bash
git clone --recurse-submodules https://github.com/vbelus/drl-fluid-film-notebook/edit/master/README.md
```

- ### For Ubuntu/Mac users :
To launch the docker, go into the folder where this README file is with a bash shell :
```bash
cd [path]
```

Then build the docker image :
```bash
docker build . -t drl-fluid-film-notebook:latest
```

And run it :
```bash
docker run -it -p 8888:8888 drl-fluid-film-notebook:latest
```

It will then ask you to paste a certain adress in your browser, do that

- ### For windows users :

To launch the docker, go into the folder where this README file is with a PowerShell (open a PowerShell by typing PowerShell in the search bar) :
```bash
cd [path]
```

Then build the docker image :
```bash
docker build . -t drl-fluid-film-notebook:latest`
```

And run it :
```bash
docker run -it -p 8888:8888 drl-fluid-film-notebook:latest
```

It will then ask you to paste a certain adress in your browser, it should look like this :
`http://0.0.0.0:8888/?token=[token]`

Just replace 0.0.0.0 by localhost, that is, copy/paste this exact adress in your browser by replacing `0.0.0.0` by `localhost` :
`http://localhost:8888/?token=[token]`
