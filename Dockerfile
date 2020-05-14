FROM python:3.6
RUN pip install Flask uWSGI
WORKDIR /app
COPY app /app
CMD ["uwsgi", "--http", "0.0.0.0:80", "--wsgi-file", "/app/start.py", \
    "--callable", "app", "--stats", "0.0.0.0:81"]
