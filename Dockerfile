FROM fluent/fluentd:v1.15

# Use root account to use apk
USER root

# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install fluent-plugin-elasticsearch --no-document\
 && sudo gem install fluent-plugin-grep \
 && sudo gem install fluent-plugin-concat \
 && sudo gem install fluent-plugin-tail-multiline \
 && sudo gem install fluent-plugin-detect-exceptions \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem


COPY ./conf/fluent.conf /fluentd/etc/
#COPY entrypoint.sh /bin/

USER fluent


