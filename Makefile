
SRCDIR = ./

PYFILES = $(wildcard $(SRCDIR)/*.py)


# tools
E := @echo
PYCODESTYLE := pycodestyle
PYCODESTYLE_FLAGS := --show-source --show-pep8 --ignore=E501,E228,E722

PYLINT := pylint
PYLINT_FLAGS := --disable=C0103,R0913,W0212,C0301,R0903

FLAKE8 := flake8
FLAKE8_FLAGS := --show-source  --ignore=E501,E228,E722

AUTOPEP8 := autopep8
AUTOPEP8_FLAGS := --in-place

BANDIT := bandit
BANDIT_FLAGS := --format custom --msg-template \
    "{abspath}:{line}: {test_id}[bandit]: {severity}: {msg}"

HATCH := hatch



.PHONY: all, build, doc, pyling, pycodestyle

all: build



pylint: $(patsubst %.py,%.pylint,$(PYFILES))

%.pylint:
	$(E) pylint checking $*.py
	@$(PYLINT) $(PYLINT_FLAGS) $*.py


flake8: $(patsubst %.py,%.flake8,$(PYFILES))

%.flake8:
	$(E) flake8 checking $*.py
	@$(FLAKE8) $(FLAKE8_FLAGS) $*.py


pycodestyle: $(patsubst %.py,%.pycodestyle,$(PYFILES))

%.pycodestyle:
	$(E) pycodestyle checking $*.py
	@$(AUTOPEP8) $(AUTOPEP8_FLAGS) $*.py
	@$(PYCODESTYLE) $(PYCODESTYLE_FLAGS) $*.py


bandit: $(patsubst %.py,%.bandit,$(PYFILES))

%.bandit:
	$(E) bandit checking $*.py
	@$(BANDIT) $(BANDIT_FLAGS) $*.py


check: pycodestyle flake8 pylint bandit
	$(E) compile all 
	@python3 -m compileall -q ./$(SRCDIR)


build:
	$(HATCH) build

	
clean:
	@rm -rf ./$(SRCDIR)/__pycache__
	@rm -rf ./dist/


upload:
	twine upload --repository serial_y_cable  ./dist/serial_y_cable-*.tar.gz ./dist/serial_y_cable-*-py3-none-any.whl
	
	
