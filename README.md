This repository meant to reproduce https://github.com/pantsbuild/pants/issues/4482

This shows that running setup-py on Python 3 code fails for the first time:

    docker build -t issue4482 . && docker run --rm -ti issue4482 bash -c "./pants setup-py src/python/mylib:mylib"

But succeeds if runs twice:

    docker build -t issue4482 . && docker run --rm -ti issue4482 bash -c "./pants setup-py src/python/mylib:mylib || ./pants setup-py src/python/mylib:mylib"

When done, remove the docker image:

    docker rmi issue4482
