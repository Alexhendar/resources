import pika
credentials = pika.PlainCredentials("zjy","zjy")
conn_params = pika.ConnectionParameters("master.alex.com",credentials=credentials)
conn_broker = pika.BlockingConnection(conn_params)
channel = conn_broker.channel()

channel.exchange_declare(exchange="hello-exchange",
                          exchange_type="direct",
                          passive=False,
                          durable=True,
                          auto_delete=False)

channel.queue_declare("hello-queue")
channel.queue_bind(queue="hello-queue",
                  exchange="hello-exchange",
                  routing_key="hola")

def msg_consumer(channel,method,header,body):
    channel.basic_ack(delivery_tag=method.delivery_tag)
    if str(body,encoding="utf-8") == "quit":
        print("ready to quit!")
        channel.basic_cancel(consumer_tag="hello-consumer")
        channel.stop_consuming()
        channel.close()
    else:
        print(body)
    return

channel.basic_consume(msg_consumer,
                    queue="hello-queue",
                    consumer_tag="hello-consumer")
channel.start_consuming()