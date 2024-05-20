FROM gcc:latest

WORKDIR /src/prj 

COPY ./src/ .

RUN g++ -o run_project ./Main.cpp ./AddCommand.cpp ./BloomFilter.cpp ./BloomFilterMenu.cpp ./FooBar.cpp ./Hash1.cpp ./Hash2.cpp ./SearchCommand.cpp ./InputCheck.cpp ./TCPServer.cpp

EXPOSE 5555

CMD ["./run_project"]

