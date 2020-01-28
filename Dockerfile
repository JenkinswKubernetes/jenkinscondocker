FROM openjdk:8-jdk-alpine
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
#COPY ./src/d860efc982ef7a70.crt $JAVA_HOME/jre/lib/security
ADD target/asi-eureka-0.0.9-RELEASE.jar app.jar
ENV JAVA_OPTS="-Xmx1024m -Xss128m"
#ENV LUC_KEYSTORE=/opt/lucee/server/lucee-server/context/security/cacerts
#ENV JRE_KEYSTORE=$JAVA_HOME/jre/lib/security/cacerts
#ENV CER_DIR=$JAVA_HOME/jre/lib/security/d860efc982ef7a70.crt
#RUN   apk update \
# &&   apk add ca-certificates wget \
 # &&   update-ca-certificates
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
#RUN keytool -import -alias apps.inbyte.mx -storepass changeit -noprompt -keystore $LUC_KESTORE -trustcacerts -file $CER_DIR
#RUN keytool -import -alias apps.inbyte.mx -storepass changeit -noprompt -keystore $JRE_KESTORE -trustcacerts -file $CER_DIR

