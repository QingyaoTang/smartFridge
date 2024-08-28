import easyocr

# 创建一个OCR阅读器对象，选择英文语言  
reader = easyocr.Reader(['en'])  # 'en' 表示英文  

# 加载要识别的图像  
image_path = 'images/20240713160738.jpg'  # 替换为你的图像路径

# 使用阅读器对象来识别图像中的文本  
results = reader.readtext(image_path)

# 输出识别结果  
for (bbox, text, prob) in results:
    # bbox 是文本边界框的坐标，text 是识别的文本，prob 是置信度  
    print(f'Text: {text}, Probability: {prob}')
    
    # 注意：EasyOCR 也可以同时识别图像中的多种语言文本，只需在创建 Reader 对象时传入多个语言代码即可。