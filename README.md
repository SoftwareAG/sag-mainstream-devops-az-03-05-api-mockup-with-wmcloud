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

## Actions and Notes

- This repository is intended to be used as a template. Create your own repo, then adapt the preferred DevOps pipeline
- Development can be done using the dedicated [development run configuration](./run-configurations/api-mock-wm-cloud-dev01/)
- After development a local image test build can be executed with the [provided test](./test/bind-build-windows)
- Committing is supposed to create a container image with the triggering of the DevOps pipeline
- Built images can be tested with the dedicated [test run configuration](./run-configurations/api-mock-wm-cloud-test01/)
- All run configurations refer to a cloud-to-on-premise connector as specified in the injected configuration. The account is uploaded at injection time by default, but the connector is not. In order to upload the connector either upload manually after the first startup or inject the global variable `WxSimpleConfig_overwriteCloudConnectors=true` for the first time.
  - ATTENTION: uploading an application may have breaking change effects for the cloud deployed code. Upload the connector mindfully. Dues to this risk, WxSimpleConfig will not upload by default the application
  - Currently there is no automation possibility to check if a certain application version has been uploaded or not
- A proxy flow service code sample matching the configuration examples is provided in the `support` folder. Import it in your tenant.
