import pika,sys
credentials = pika.PlainCredentials("zjy","zjy")
conn_params = pika.ConnectionParameters("master.alex.com",credentials=credentials)
conn_broker = pika.BlockingConnection(conn_params)
channel = conn_broker.channel()

channel.exchange_declare(exchange="hello-exchange",
                          exchange_type="direct",
                          passive=False,
                          durable=True,
                          auto_delete=False)

msg = sys.argv[1]
# print(msg)
msg_props = pika.BasicProperties()
msg_props.content_type = "text/plain"
# exchange为空字符串就把消息发到了默认的exchange上去
channel.basic_publish(body=msg,
              exchange="hello-exchange",
              properties=msg_props,
              routing_key="hola")



channel.close()