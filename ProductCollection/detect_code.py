#!/usr/bin/env python
# coding:utf-8


import cv2
import numpy as np
import requests
from PIL import Image
import re
import glob
from PIL import Image
import re

from flask import jsonify
from paddleocr import PaddleOCR
import numpy
from pyzbar.pyzbar import decode
import paho.mqtt.client as mqtt
import time


def parse_frame_for_exp(frame):
    ocr = PaddleOCR(use_angle_cls=False, lang="ch")
    img = numpy.array(frame)
    result = ocr.ocr(img)

    monthes = {
        'Jan': ['JAN', 'JHN'],
        'Feb': ['FEB'],
        'Mar': ['MAR'],
        'Apr': ['APR'],
        'May': ['MAY'],
        'Jun': ['JUN', 'JVN'],
        'Jul': ['JUL', 'JU1', 'JUI', 'JVL', 'July'],
        'Aug': ['AUG', 'AVG'],
        'Sep': ['SEP'],
        'Oct': ['OCT', 'OOT', '00T', 'O0T', "0OT"],
        'Nov': ['NOV', 'NOU', 'NoV'],
        'Dec': ['DEC']
    }

    years = [2024, 2025, 2026, 2027, 2028, 2029, 2030, 24, 25, 26, 27, 28, 29, 30]

    monthes_str = '|'.join([value for month in monthes.keys() for value in monthes[month]])
    years_str = '|'.join([str(year) for year in years])
    reg1 = '(\d{1,2})(%s)(%s|)' % (monthes_str, years_str)
    reg2 = '([0123][0-9])[/]{0,1}([0123]{0,1}[0-9])[/]{0,1}(%s)' % years_str
    matches = []
    if result:
        if result[0] is not None:
            for line in result[0]:
                line = line[1][0].replace(' ', '')
                match1 = re.findall(reg1, line, flags=re.I)
                match2 = re.findall(reg2, line, flags=re.I)
                matches += match1
                matches += match2

    final_matches = []
    for a, b, c in matches:
        if re.match('\d{1,2}', b) and re.match('\d{1,2}', b):
            if (int(a) in range(1, 32)) and (int(b) in range(1, 13)):
                final_matches.append([a, b, c])
            continue
        for month in monthes.keys():
            values = [str.lower(value) for value in monthes[month]]
            if str.lower(b) in values:
                # print('|'.join(values))
                b = re.sub('|'.join(values), month, str.lower(b))
                final_matches.append([a, b, c])
                break
    str_content = ""
    if len(final_matches) != 0:
        str_content = final_matches[0][2] + "-" + final_matches[0][1] + "-" + final_matches[0][0]
    # Image.fromarray(img).show()
    return str_content


def image_2_string(img):
    ocr = PaddleOCR(use_angle_cls=False, lang="ch")
    img = numpy.array(frame)
    result = ocr.ocr(img)
    lines = ""
    if result:
        for line in result[0]:
            line = line[1][0]
            lines += line
    return lines


def on_connect(client, userdata, flags, rc):
    print(f"Connected with result code {rc}")


client = mqtt.Client()
client.on_connect = on_connect
client.connect("broker.emqx.io", 1883, 60)


# 视频捕获，传入参数摄像头ID, 0：默认第一个摄像头
cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 400)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 400)
# 判断摄像头是否正常打开
if cap.isOpened():
    print('Camera Opened.')
else:
    print('Camera Open error.')

best_date = "2024-7-01"
quality_guarantee_period = "20 days"
while True:
    ret, frame = cap.read()
    if ret == False:
        # 读取帧失败
        break
    best_date = parse_frame_for_exp(frame)
    # 图像处理
    frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # 二维码条形码识别
    codes = decode(frame_gray)

    # 输出识别结果
    for barcode in codes:
        # 绘制识别结果
        text_code = barcode.data.decode('utf-8')  # 条形码
        print("text_code:" + text_code)
        response = requests.get('https://world.openfoodfacts.org/api/v0/product/' + str(text_code))
        product = response.json()
        # print(response.json())
        product_name = product['product']['product_name']  # product name
        print("product_name:" + product['product']['product_name'])

        # 使用pytesseract进行OCR识别
        text = image_2_string(frame)

        pattern = r'\b(\d+)\s+(days?)\b'
        matches = re.findall(pattern, text, re.IGNORECASE)

        # matches 是一个列表，每个元素是一个元组，包含数字和时间单位
        for match in matches:
            number = match[0]  # 数字部分
            unit = match[1]  # 单位部分
            quality_guarantee_period = str(number) + str(unit)
        print("quality_guarantee_period: ", quality_guarantee_period)
        if text_code is not None:
            cv2.putText(frame, "barcode " + text_code, (10, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        if product_name is not None:
            cv2.putText(frame, "product_name " + product_name, (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        if best_date is not None:
            cv2.putText(frame, "best_date " + str(best_date), (10, 80), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        else:
            cv2.putText(frame, "best date get fail, Please manually add it in the app", (10, 80), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        if quality_guarantee_period is not None:
            cv2.putText(frame, "quality guarantee period " + str(quality_guarantee_period), (10, 110),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        else:
            cv2.putText(frame, "quality guarantee period get fail,Please manually add it in the app", (10, 110),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        if text_code!= "":
            str_content = {
               "text_code": str(text_code),
               "product_name": product_name,
               "quality_guarantee_period": quality_guarantee_period,
                "best_date": best_date
            }

            print(str_content)
            # 四个参数分别为：主题，发送内容，QoS, 是否保留消息
            client.publish('addFood', payload=str(str_content), qos=0, retain=False)
            print(f"send " + str(str_content))
           # client.loop_forever()
        #client.loop_forever()


        # 绘制矩形边框
        # x,y,w,h = barcode.rect
        # cv2.rectangle(frame, (x, y), (x+w, y+h), (0,0,255), 1)
        rect = barcode.rect
        cv2.rectangle(frame, (rect.left, rect.top), (rect.left + rect.width, rect.top + rect.height), (0, 0, 255), 2)

        # 绘制多边形框
        pts = np.array(barcode.polygon, np.int32)
        cv2.polylines(frame, [pts], True, (0, 255, 0), 2)

    k = cv2.waitKey(30) & 0xFF
    if k == 27:
        break
    else:
        cv2.imshow('frame', frame)

cap.release()
cv2.destroyAllWindows()
