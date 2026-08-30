FROM python:3.14-slim@sha256:cae66f2ef0ec51a9891263eeee7f987dacf0a9879e8aa9353d5606e0530619a5

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --require-hashes -r /requirements.txt --quiet

COPY entrypoint.py /entrypoint.py

RUN useradd -r -u 1001 sieve
USER sieve

ENTRYPOINT ["python3", "/entrypoint.py"]
