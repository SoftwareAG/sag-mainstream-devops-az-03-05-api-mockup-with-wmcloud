# Buildah in Docker Build test

This test harness is provided to verify the build procedure with `buildah` installed on alpine, to keep the computing footprint and privileges to minimum.

## Usage

- Copy the file `build.secrets.EXAMPLE.env` in `build.secrets.env`, in other words remove `EXAMPLE` token from the file name
- Edit `build.secrets.env` and `build.parameters.env` according to your environment
- Execute `run.bat`. If you are not using Windows, execute the command within
