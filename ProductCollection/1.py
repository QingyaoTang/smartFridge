import glob
import time

from PIL import Image
import re
from paddleocr import PaddleOCR
import numpy
import logging

logging.disable(logging.DEBUG)
logging.disable(logging.WARNING)


# pip install paddlepaddle
# pip install paddleocr

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
                # print(line, '-',match1)
                # print(line, '-', match2)
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
    strcontent = ""
    if len(final_matches) != 0:
        strcontent = final_matches[0][2] + "-" + final_matches[0][1] + "-" + final_matches[0][0]
    # Image.fromarray(img).show()
    print(strcontent)
    return strcontent


if __name__ == '__main__':

    for file in glob.glob('./images/*.*'):
        start_time = time.time()
        frame = Image.open(file)
        parse_frame_for_exp(frame)
        end_time = time.time()
        print(end_time - start_time)
