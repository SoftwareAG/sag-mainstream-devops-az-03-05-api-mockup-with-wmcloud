ARG __base_image=sagcr.azurecr.io/webmethods-microservicesruntime:10.15.0.0
FROM ${__base_image}
ARG __is_home=/opt/softwareag/IntegrationServer

COPY WxSimpleConfig ${__is_home}/WxSimpleConfig
COPY SagServiceMockup ${__is_home}/SagServiceMockup
