# API Mockup deployment with WmCloud and webmethods.io integration proxy service

The purpose of this repository is to give an example of a project having the following aspects:

1. Multiple pipelines styles

   Pipelines are contained in the `pipelines` folder, and then in the respective provider subfolder, e.g. `pipelines/azure`

2. Include dependency packages from other repositories
3. Separate container registries between source and destination
4. Separate generic code from pipeline agent specific code

## Constraints

All artifacts here are Linux based, but they can be tested with tools like Rancher Desktop or Docker Desktop in windows.

## Coding style and conventions

One principle applied is the separation of code languages in different files for clarity and to allow productivity in the IDEs. For example one can incorporate bash instructing in the `azure-pipeline.yml`, but it is better to provide `sh` files that are separates from the `yml` files, having the latter reference them.

## Prerequisites

In order to test the agent or the test machine has to have:

- git client
