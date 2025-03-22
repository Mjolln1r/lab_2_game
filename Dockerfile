FROM gcc:12.2.0 as build

COPY /src /app

WORKDIR /app

RUN g++ -o app main.cpp

FROM gcc:12.2.0 as test

COPY /tests /tests
COPY Makefile /tests

RUN g++ -o tests /tests/test.cpp

ENTRYPOINT ["./test"]