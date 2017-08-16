# Docker image for MDToolbox
Ocatve + Jupyter docker image ready for use with [MDToolbox](https://github.com/ymatsunaga/mdtoolbox).
[MDToolbox](https://github.com/ymatsunaga/mdtoolbox) is a MATLAB/Octave toolbox for statistical analysis of molecular dynamics trajectories.
This image is based on [jupyter/datascience-notebook](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook).

# Usage
## Jupyter notebook via browser

Starts the Notebook server listening for HTTP connections on port 8888 with a randomly generated authentication token configured.

```bash
docker run --rm -p 8888:8888 -v $(pwd):/home/jovyan/work ymatsunaga/octave
```

Then, take note of the authentication token included in the notebook startup log messages.

Create a notebook selecting "Octave" from [New] pulldown. 

In Mac OSX, you may get black graph when plotting (due to some trouble with png). This problem can be avoided by putting the following before calling `plot()`:

```bash
%plot --format svg
y = 1:0.1:10
x = sin(y)
plot(x, y)
```

## Interactive use with terminal (without no-GUI)

```bash
docker run -it --rm -v $(pwd):/home/jovyan/work ymatsunaga/octave octave
```

