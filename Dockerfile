FROM debian:latest

MAINTAINER Andrea Greco <andreagreco91@gmail.com>

RUN apt-get update && apt-get install -y \
	wget \
	sudo \
	gnupg2 \
	locales 

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

RUN apt-get update && apt-get install -y \
	esl-erlang \
	elixir

RUN export LANG=en_US.UTF-8 \
    	&& echo $LANG UTF-8 > /etc/locale.gen \
    	&& locale-gen \
    	&& update-locale LANG=$LANG

ENV LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8

COPY src /elixir/

CMD ["bash"]
