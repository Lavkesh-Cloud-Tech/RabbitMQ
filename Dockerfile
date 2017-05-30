FROM rabbitmq:3.6.9-management

COPY conf/rabbitmq.config /etc/rabbitmq/rabbitmq.config

EXPOSE 4369 5671 5672 25672 15671 15672