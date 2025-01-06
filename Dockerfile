FROM python:3.8-slim

WORKDIR /code

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=main.py
ENV FLASK_ENV=development

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Stage for running tests
FROM base AS test

# Command to run tests
CMD ["sh", "-c", "python -m unittest discover -s Tests -p 'test*.py'"]
