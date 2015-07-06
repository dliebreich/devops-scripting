FROM ruby:2.1
RUN chmod a-w /
RUN useradd devops
USER devops
