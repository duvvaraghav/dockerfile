FROM ubuntu:16.04
MAINTAINER duvva <duvva.raghavendra@gmail.ccom>
RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install sudo -y
RUN apt-get install apache2 -y
RUN service apache2 start
RUN rm -rf /var/www/html/index.html
RUN echo "<h1> this is sample docker file </h1>"  > /var/www/html/index.html
RUN service apache2 restart

