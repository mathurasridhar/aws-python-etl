ENV ?= dev

install:
	uv venv && uv pip install -e ".[dev,infra]"
	pre-commit install

lint:
	ruff check . && ruff format --check . && mypy src

test:
	pytest

synth:
	cdk synth -c env=$(ENV)

deploy:
	cdk deploy --all -c env=$(ENV) --require-approval never

destroy:
	cdk destroy --all -c env=$(ENV)
