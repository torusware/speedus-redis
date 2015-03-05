![torusware logo](http://dl.torusware.com/images/torusware_isotipo_small.png "Torusware")
![speedus logo](http://dl.torusware.com/images/speedus_small.jpg "Speedus")
![redis logo](https://raw.githubusercontent.com/docker-library/docs/master/redis/logo.png "Redis")
# Speedus Plug&Run Lite for Redis
Redis is an open-source, networked, in-memory, key-value data store with optional durability. With the speedus solution for high-performance communications, you can achieve even more speed in the most popular key-value store at the moment. Check us out at [our website](http://torusware.com/).

Speedus is your communications highway:

- Accelerates communications in the cloud and corporate IT systems
- Faster applications provide businesses with higher competitive advantages while reducing their IT bill
- 100% nonintrusive software solution which takes full advantage of the underlying hardware

#Supported tags and respective `Dockerfile` link
Each tag corresponds to the tag of the Redis base image:

- [`2.6` *(2.6/Dockerfile)*](https://github.com/torusware/speedus-ubuntu/tree/master/precise "2.6 Dockerfile")
- [`2.8`, `latest` *(2.8/Dockerfile)*](https://github.com/torusware/speedus-ubuntu/tree/master/trusty "2.8 Dockerfile")

#Launching instructions
In order to run a container with our image, execute:

    sudo docker run --name speedus-redis -d torusware/speedus-redis

As the original Redis image, this image exposes port 6379, so standard container linking will make it automatically available to the linked containers.

If you want to test the original Redis performance, you can launch a linked container that executes the built-in redis benchmark (this command executes only get and set tests for simplicity). Since we expect maximum performance, the client container shares the server container network stack:

    sudo docker run -it --net=container:speedus-redis --rm torusware/speedus-redis sh -c 'exec redis-benchmark -t get,set'
    
For executing the test with Speedus, you just have to type `speedus` before the program:

    sudo docker run -it --net=container:speedus-redis --rm torusware/speedus-redis sh -c 'exec speedus redis-benchmark -t get,set'

As you can see, is really easy and non-intrusive!

#Aditional tests

Moreover, in this image we provide a built-in communication tests, [NetPIPE](http://bitspjoule.org/netpipe/ "NetPIPE"). Just execute:

    NPtcp &
    NPtcp -h localhost

For getting the baseline. To perform the test with our solution:

    speedus NPtcp &
    speedus NPtcp -h localhost

As you can see, using speedus is really easy and non-intrusive, just type `speedus` before your application:

    speedus /path/to/the/program [parameters]
    
#Contact info

If you need more information, you can check the README file inside the container or contact us at <speedus@torusware.com>

#Check our other images in the Docker Hub

- [speedus-ubuntu image](https://registry.hub.docker.com/u/torusware/speedus-ubuntu/ "Speedus Plug&Run Lite for Ubuntu")

