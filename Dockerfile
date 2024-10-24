FROM ubuntu:22.04

ENV TF_VERSION="1.8.4"

RUN apt update -y && \
    apt install -y \ 
    wget \
    unzip \
    curl \
    make


# Installing git
RUN apt-get install git -y

# Installing Terrafrom
RUN wget --quiet https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
    && unzip terraform_${TF_VERSION}_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_${TF_VERSION}_linux_amd64.zip


#Installing Az CLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Installing TF Lint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# Installing Terrform docs
RUN curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.19.0/terraform-docs-v0.19.0-$(uname)-amd64.tar.gz \
    && tar -xzf terraform-docs.tar.gz \
    && chmod +x terraform-docs \
    && mv terraform-docs /usr/bin/terraform-docs