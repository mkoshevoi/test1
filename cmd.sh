#!/bin/bash
set -e
if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server"
  exec python "start.py"
else
  echo "Running Production Server"
  exec uwsgi --http 0.0.0.0:80 --wsgi-file /app/start.py \
             --callable app --stats 0.0.0.0:81
fi
