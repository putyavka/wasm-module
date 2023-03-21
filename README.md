# Exampe of wasm module on C++ to use in browser

The project uses Emscripten image of Docker container. So you need to install it.
Tested on Windows 10 machine and Docker using WSL2 to run Ubuntu container

## Prerequisite

1) [Install WSL2 (for Windows 10+ only)](https://learn.microsoft.com/en-us/windows/wsl/install)
2) [Install Docker Desktop application](https://docs.docker.com/get-docker/)

## Install

```
npm install
```

## Build

```
npm run build
```

## Run (to test in browser)

```
npm run serve
```

## References

[Emscripten and npm](https://web.dev/emscripten-npm/)

[Using std::vector<> to pass array parameters](https://gist.github.com/yeputons/8591cc26cc1b61d3503b0cb3b4623001)