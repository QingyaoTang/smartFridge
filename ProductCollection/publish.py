import paho.mqtt.client as mqtt
import time


def on_connect(client, userdata, flags, rc):
    print(f"Connected with result code {rc}")


client = mqtt.Client()
client.on_connect = on_connect
client.connect("broker.emqx.io", 1883, 60)

# 每间隔 1 秒钟向 raspberry/topic 发送一个消息，连续发送 5 次
for i in range(100):
    # 四个参数分别为：主题，发送内容，QoS, 是否保留消息
    client.publish('addFood', payload="hello", qos=0, retain=False)
    print(f"send hello to addFood")
    time.sleep(1)

client.loop_forever()