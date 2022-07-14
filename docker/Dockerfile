FROM python:3.10.5

RUN pip install --upgrade pip setuptools wheel poetry
RUN poetry config virtualenvs.create false

WORKDIR /usr/src/app

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root --no-interaction --no-ansi

COPY . ./
RUN poetry install --no-interaction --no-ansi