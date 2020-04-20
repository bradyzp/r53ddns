FROM python:3.8.2-slim-buster

COPY r53ddns /opt/r53ddns/r53ddns/
COPY setup.py /opt/r53ddns
COPY requirements.txt /opt/r53ddns

WORKDIR /opt/r53ddns/
RUN pip install -r requirements.txt && python setup.py bdist_wheel
RUN set -eux; \
    WHL=`ls -t1 dist/*.whl | head -n1` \
    && pip install $WHL

ENV AWS_DEFAULT_REGION=us-west-2

ENTRYPOINT ["python", "-m", "r53ddns", "-vv"]

CMD ["--dryrun", "-vvv"]