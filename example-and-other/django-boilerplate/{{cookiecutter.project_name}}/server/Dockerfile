FROM python:3.8

ARG PACKAGE_TYPE=''
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

WORKDIR /app/server/
COPY requerments*.txt /app/server/

RUN pip install -r requerments${PACKAGE_TYPE}.txt;

ADD ./ /app/server/
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
