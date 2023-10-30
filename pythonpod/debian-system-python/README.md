A variant of python docker images that build on debian system packages.

One driving force for this is that I want to install sagemath, and the easy way is to install debian system package.
But this way, many packages are installed, and it take 4 GiB space.
So I think of splitting the installation just like ipython-Dockerfile and stem-ipython-Dockerfile.
