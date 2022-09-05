#FROM ace-server-dev:12.0.1.0-r2
FROM cp.icr.io/cp/appc/ace-server@sha256:8c7a80be06567e1e535913ba4ea160000b586b1d3ff632cdad92d7aa1ee23bf6

USER root

COPY ace_config_mybars.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/ace_config_mybars.sh && mkdir /home/aceuser/build && mkdir /home/aceuser/initial-config/mybars && mkdir /home/aceuser/ace-server/shared-classes && mkdir /home/aceuser/logs 
COPY firmaToken.jar /home/aceuser/ace-server/shared-classes/firmaToken.jar
COPY wlthint3client.jar /home/aceuser/ace-server/shared-classes/wlthint3client.jar
COPY ojdbc8-19.8.0.0.jar /home/aceuser/ace-server/shared-classes/ojdbc8-19.8.0.0.jar
RUN chmod -R ugo+rwx /home/aceuser

USER 1000
