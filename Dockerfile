docker run -d \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v /usr/local/bin:/user/bin
   -p 8080:8080 jenkins

FROM hello-world