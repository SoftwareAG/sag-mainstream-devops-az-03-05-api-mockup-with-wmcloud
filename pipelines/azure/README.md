# Azure DevOps Pipeline

The pipeline may be used directly if the following prerequisites are satisfied:

- The user must have an Azure Virtual Machine Scale Set (VMSS) done according to the [prerequisites example repository](https://github.com/SoftwareAG/sag-mainstream-devops-az-00-prerequisites)
- Create an agent pool to use the above VMSS
- Adapt the name of the agent pool in azure-pipeline.yml to match the agent pool created above

    ```yml
    pool:
      name: YourPoolNameHere
      vmImage: Canonical:0001-com-ubuntu-confidential-vm-focal:20_04-lts-gen2:latest
    ```

- The user must have access to two container registries
  - a "source" one from where a Software AG Microservices Runtime image can be pulled
  - a "destination" one, where the resulting image is pushed
- a file called exactly `build.secrets.sh` must be provided into the Azure DevOps project as a "secure file"
  - follow the provided [example file](./support/build.secrets.EXAMPLE.sh) in the `support` subfolder
- 