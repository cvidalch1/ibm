#FROM ace-server-dev:12.0.1.0-r2
FROM christianvch/ibm:v1

USER root

COPY ace_config_mybars.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/ace_config_mybars.sh && mkdir /home/aceuser/build && mkdir /home/aceuser/initial-config/mybars && mkdir /home/aceuser/ace-server/shared-classes && mkdir /home/aceuser/logs 
COPY firmaToken.jar /home/aceuser/ace-server/shared-classes/firmaToken.jar
COPY wlthint3client.jar /home/aceuser/ace-server/shared-classes/wlthint3client.jar
COPY ojdbc8-19.8.0.0.jar /home/aceuser/ace-server/shared-classes/ojdbc8-19.8.0.0.jar
RUN chmod -R ugo+rwx /home/aceuser

USER 1000
