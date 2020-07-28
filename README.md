Problem statement:
=================

The following test will require you to do the following:
1. Convert the current Dockerfile into a multistage build Dockerfile. 
2. Optimise Dockerfile for caching benefits.


Solution:
========

1. Analyse the docker file.

     1. Remove the environment variable GO111MODULE - which is not used.

2. Debugging and build the image. 

          1. For more control over the server's behaviour, custom servers is added in the application (main.go), fixed issue by removing specific ip, just provided only the port .
              Reference: https://golang.org/pkg/net/http/
              
          2. Built the image.

                    size of the image : 422 MB

3. MultiStaging:

          Modified existing docker file to support multi staging.

     1. Built a base image.

     2. Used From Scratch for building top layer image.
 
          Reference:https://hub.docker.com/_/scratch/

          size of the image : 7.98 MB

Commands:
========

Build:
=====

        docker build -t giriadini/solution:v1 .

Run:
====
        docker run -d -p 8000:8000  giriadini/solution:v1

Test:
=====  
        curl http://localhost:8000
