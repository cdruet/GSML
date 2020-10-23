# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

compile-dev:
	docker build -f Dockerfile.dev -t sphinx-server-auto:latest .

run: compile-dev
	docker run -itd -v "$(shell pwd)":/web -u $(id -u):$(id -g) -p 8000:8000 --name sphinx-GSML-server-auto --restart=on-failure:10 sphinx-server-auto:latest


app=GSMLDoc
lower_app=$(shell python3 -c "print('$(app)'.lower())")
version=20.10.23
url=www.gsml.site
port=22003
ssl=0

prepare:
	pip freeze | sed '/^PIL\=\=/d' reqs.txt > requirements.txt

compile:
	docker build -t $(lower_app):$(version) .

save:
	docker save $(lower_app):$(version) | gzip > ~/Apps/$(lower_app).tgz

upload:
	scp ~/Apps/$(lower_app).tgz cdruet@fundocker:/home/cdruet/apps/
	-rm ~/Apps/$(lower_app).tgz

stop:
	-ssh cdruet@fundocker docker container rm -f $(lower_app)

prune:
	-ssh cdruet@fundocker docker image prune -f

import: stop
	ssh cdruet@fundocker docker load -i /home/cdruet/apps/$(lower_app).tgz
	ssh cdruet@fundocker docker tag $(lower_app):$(version) $(lower_app):latest
	-ssh cdruet@fundocker docker image prune -f
	-ssh cdruet@fundocker rm -f /home/cdruet/apps/$(lower_app).tgz

install: compile save upload import

compose: stop prune
	ssh cdruet@fundocker docker run -d \
		--name $(lower_app) \
		-p $(port):8000 \
		--restart=on-failure:10 \
		-it $(lower_app):latest
expose:
	ssh cdruet@fundocker 'if grep -Fxq "$(url):$(port)" /home/cdruet/.reversepx; then : ; else echo "$(url):$(port) SSL=$(ssl)" >> /home/cdruet/.reversepx; fi'

full: all compose expose

rclean: stop
	ssh cdruet@fundocker rm -f /home/cdruet/apps/$(lower_app).tgz

clean:
	-rm -f ~/Apps/gsml.tgz
	-docker images -a | grep "none" | awk '{print $3}' | xargs docker rmi -f
	-ssh cdruet@fundocker 'docker images -a | grep "none" | awk "{print $3}" | xargs docker rmi -f'

fullclean:
	docker images -a | grep "$(lower_app)" | awk '{print $3}' | xargs docker rmi -f

