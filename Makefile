init:
	pip install -e '.[dev]'

test:
	# Run unit tests
	# Fail if coverage falls below 95%
	pytest --cov empty_project --cov-report term-missing --cov-fail-under 95 tests/unit

integ-test:
	# Integration tests don't need code coverage
	pytest tests/integration

func-test:
	pytest --cov empty_project --cov-report term-missing tests/functional

flake:
	# Make sure code conforms to PEP8 standards
	flake8 empty_project 
	flake8 tests/unit tests/integration

lint:
	# Linter performs static analysis to catch latent bugs
	pylint --rcfile .pylintrc empty_project

# Command to run everytime you make changes to verify everything works
dev: flake lint test

# Verifications to run before sending a pull request
pr: init dev
