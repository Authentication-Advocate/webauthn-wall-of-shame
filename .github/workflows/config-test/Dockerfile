FROM alpine

RUN apk add --no-cache yamllint bash

WORKDIR /app/

COPY test_all_configs.sh /usr/local/bin/test_all_configs.sh

CMD /usr/local/bin/test_all_configs.sh 