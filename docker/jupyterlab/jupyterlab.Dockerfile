ARG BASE_IMAGE
ARG SPARK_VERSION
FROM $BASE_IMAGE

# -- Layer: JupyterLab
ARG SPARK_VERSION
ARG jupyterlab_version=2.1.5
ARG jupyter=8888
ENV JUPYTER_HOME=/jupyter


RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install wget pyspark==${SPARK_VERSION} jupyterlab==${jupyterlab_version} numpy
# -- Runtime

EXPOSE ${jupyter}
WORKDIR $JUPYTER_HOME
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
