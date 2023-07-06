.ONESHELL:

ENVNAME = pfl
CONDAPATH = $$(conda info --base)

install:
	conda env create -f environment.yml --name $(ENVNAME)
	${CONDAPATH}/envs/$(ENVNAME)/bin/pip install -r requirements.txt
	# ${CONDAPATH}/envs/$(ENVNAME)/bin/pip install -e .[${enable}]

install-mac:
	conda env create -f environment.yml --name $(ENVNAME)
	conda install nomkl
	${CONDAPATH}/envs/$(ENVNAME)/bin/pip install -r requirements.txt
	# ${CONDAPATH}/envs/$(ENVNAME)/bin/pip install -e .[${enable}]

update:
	conda env update --prune -f environment.yml --name $(ENVNAME)
	${CONDAPATH}/envs/$(ENVNAME)/bin/pip install -r requirements.txt --upgrade
	# ${CONDAPATH}/envs/$(ENVNAME)/bin/pip install -U .[${enable}]

clean:
	conda env remove --name $(ENVNAME)
