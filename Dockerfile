FROM fluent/fluentd:v1.13-1

ADD ./conf/fluent.conf /fluentd/etc/

USER root
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--version", "5.0.3"]
RUN ["gem", "install", "fluent-plugin-grep"]
RUN ["gem", "install", "fluent-plugin-concat", "--version", "2.1.0"]
RUN ["gem", "install", "fluent-plugin-tail-multiline"]

