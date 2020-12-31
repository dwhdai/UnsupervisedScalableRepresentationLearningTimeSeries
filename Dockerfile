FROM pytorch/pytorch

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk openjdk-8-doc openjdk-8-jre && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Install gcc
RUN apt-get update && \
	apt-get install -y gcc

# install python dependencies
RUN pip install --upgrade pip
RUN pip install \
	numpy \
	matplotlib \
	PyQt5 \
	PyQtWebEngine \
	orange3 \
	pandas \
	python-weka-wrapper3 \
	scikit-learn \
	scipy