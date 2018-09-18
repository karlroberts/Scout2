FROM python:3

RUN mkdir /src
RUN mkdir /output
RUN mkdir /output/scout2-report

WORKDIR    /src
COPY audit /src

RUN git clone https://github.com/nccgroup/Scout2

WORKDIR    /src/Scout2
RUN pip install -r requirements.txt
RUN python setup.py install

WORKDIR    /src

#ENTRYPOINT ["./audit"]

CMD ["./audit"]
