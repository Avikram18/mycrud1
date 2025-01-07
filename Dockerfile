# Base stage for the application
FROM python:3.8-slim AS base

WORKDIR /code

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=main.py
ENV FLASK_ENV=development

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Test stage
FROM base AS test

# Install any additional dependencies for testing (if required)
RUN pip install --no-cache-dir unittest2

# Command to run tests
CMD ["sh", "-c", "python -m unittest discover -s Tests -p 'testmock.py'"]
