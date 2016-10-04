FROM gitlab/dind

WORKDIR var

RUN apt-get update -q && \
    apt-get install -qy \
      curl \
      python-setuptools \
      jq \
      build-essential \
      python-pip \
      php5-cli \
      groff-base && \
    pip install awscli && \
    apt-get clean apt-get purge && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -L https://github.com/silinternational/ecs-deploy/archive/2.5.0.tar.gz | tar xvz && cp ecs-deploy-2.5.0/ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy
RUN chmod a+x /usr/local/bin/composer
