FROM yrzr/gitlab-ce-arm64v8:latest

# Install dependencies
RUN apt-get update \
    && apt-get install --yes --force-yes curl openssh-server ca-certificates tzdata perl \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y postfix \
    && curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

RUN EXTERNAL_URL="https://source-lab.sudox.app" apt-get install --yes --force-yes gitlab-ee

# Expose ports
EXPOSE 22 80 443

# Start GitLab service
CMD ["/opt/gitlab/embedded/bin/runsvdir-start"]
