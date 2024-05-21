# Social Media TCP Server

This is the code part of the social media TCP server-bloom filter in our project.
You can find the [API server & web client](https://github.com/MeitarTeper/SocialMedia) and the [android client](https://github.com/MeitarTeper/SocialMedia-Android) in a different repesatories.

For further explanation please open the main repository of this project - the [API server & web client](https://github.com/MeitarTeper/SocialMedia).
## Executing the program

First clone the repository
```bash
git clone https://github.com/MeitarTeper/SocialMedia-TCP-Server.git
```
### Normal compile:
Build the program
```bash
cmake -B build -S .
cmake --build build 
```

Then, run the program.
```bash
./build/run_project
```

### With Docker:
build the program-
```bash
sudo docker build -t run_project .
```
execute the program-
```bash
sudo docker run -i -t -p 5555:5555 run_project
```

## Bloom Filter
A bloom filter is a probabilistic data structure that is based on hashing. It is extremely time and space efficient and is typically used to add elements to a set and test if an element is in a set. However, the elements themselves are not added to a set. Instead a hash of the elements is added to the set.

When testing if an element is in the bloom filter, false positives are possible. It will either say that an element is definitely not in the set or that it is possible the element is in the set.

To address false positives we will:

Use longer bit arrays.
Double check against the real list of blacklisted URLs for any result which is positive - to ensure it is not a false positive.
A bloom filter is very much like a hash table in that it will use a hash function to map a key to a bucket. However, it will not store that key in that bucket, it will simply mark it as filled. So, many keys might map to same filled bucket, creating false positives.

### Our Bloom Filter
In our project the bloom filter holds all the URLs that are not safe. First, we initialize an array with zeros. Then, we insert all the URLs that are not safe. Every time a user want to edit or upload a URL the program will check if it is safe.

## TCP server
This server connects between our nodeJS server and the Bloom Filter through a socket. This server is multithreaded so it can handle many requests and for each one of them it opens a new thread. The server helps us to make sure our app doesn't contain unsafe URLs. Every time a user wants to add or edit a post, if the post contains a URL it will be send to the TCP server and the server will return 'true' if the URL is safe, 'false' otherwise.

## Application authors 
[Shahar Chen](https://github.com/Shahar2612)  
[Yaara Sirkis](https://github.com/YaaraSirkis)  
[Meitar Teper](https://github.com/MeitarTeper) 
