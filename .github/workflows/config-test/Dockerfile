FROM python:3.9-alpine

RUN pip3 install pyyaml

COPY test_all_configs.py /usr/local/bin/test_all_configs.py

CMD /usr/local/bin/test_all_configs.py