ARG __base_image=sagcr.azurecr.io/webmethods-microservicesruntime:10.15.0.0
FROM ${__base_image}
ARG __is_home=/opt/softwareag/IntegrationServer
ARG __sag_admin=sagadmin
ARG __sag_grp=sagadmin

COPY --chown=${__sag_admin}:${__sag_grp} WxSimpleConfig ${__is_home}/packages/WxSimpleConfig
COPY --chown=${__sag_admin}:${__sag_grp} SagServiceMockup ${__is_home}/packages/SagServiceMockup
COPY --chown=${__sag_admin}:${__sag_grp} SagServiceMockupCloudDeclare ${__is_home}/packages/SagServiceMockupCloudDeclare
