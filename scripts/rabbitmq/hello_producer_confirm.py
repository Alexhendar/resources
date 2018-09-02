'''
发送方确认模式来确认投递
'''

import pika,sys
from pika import spec
credentials = pika.PlainCredentials("zjy","zjy")
conn_params = pika.ConnectionParameters("master.alex.com",credentials=credentials)
conn_broker = pika.BlockingConnection(conn_params)
channel = conn_broker.channel()


channel.confirm_delivery()

msg = sys.argv[1]
msg_props = pika.BasicProperties()
msg_props.content_type = "text/plain"

ack = channel.basic_publish(body=msg,
              exchange="hello-exchange",
              properties=msg_props,
              routing_key="hola")

if ack == True:
    print("put message to rabbitmq successed!")
else:
    print("put message to rabbitmq failed")

channel.close()