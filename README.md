# Docker image for MDToolbox
Ocatve + Jupyter docker image ready for use with MDToolbox.
MDToolbox is a MATLAB/Octave toolbox for statistical analysis of molecular dynamics trajectories at https://github.com/ymatsunaga/mdtoolbox


# Usage
## Interactive use with terminal (without no-GUI)

```bash
$ docker run -it --rm -v $(pwd):/home/jovyan/work ymatsunaga/octave octave
```

## Jupyter notebook via browser

```bash
$ docker run --rm -p 8888:8888 -v $(PWD):/home/jovyan/work ymatsunaga/octave
```

or run as a daemon

```bash
$ docker run -d --rm -p 8888:8888 -v $(PWD):/home/jovyan/work ymatsunaga/octave
```

Then, access to localhost:8888 with the browser

