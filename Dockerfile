FROM python:3.8.2-slim-buster

COPY dist/r53ddns-0.3.5-py3-none-any.whl /
RUN pip install ./r53ddns-0.3.5-py3-none-any.whl

ENV AWS_DEFAULT_REGION=us-west-2

ENTRYPOINT ["python", "-m", "r53ddns", "-vv"]

CMD ["--dryrun", "-vvv"]