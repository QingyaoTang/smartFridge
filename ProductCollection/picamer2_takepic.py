#!/usr/bin/python3

from PyQt5 import QtCore
from PyQt5.QtGui import QPalette
from PyQt5.QtWidgets import (QApplication, QCheckBox, QHBoxLayout, QLabel,
                             QPushButton, QVBoxLayout, QWidget)

from picamera2 import Picamera2
from picamera2.previews.qt import QGlPicamera2




def request_callback(request):
    label.setText(''.join(f"{k}: {v}\n" for k, v in request.get_metadata().items()))


picam2 = Picamera2()
picam2.post_callback = request_callback
# Adjust the preview size to match the sensor aspect ratio.
preview_width = 800
preview_height = picam2.sensor_resolution[1] * 800 // picam2.sensor_resolution[0]
preview_height -= preview_height % 2
preview_size = (preview_width, preview_height)
# We also want a full FoV raw mode, this gives us the 2x2 binned mode.
raw_size = tuple([v // 2 for v in picam2.camera_properties['PixelArraySize']])
preview_config = picam2.create_preview_configuration({"size": preview_size}, raw={"size": raw_size})
picam2.configure(preview_config)
if 'AfMode' not in picam2.camera_controls:
    print("Attached camera does not support autofocus")
    #quit()
app = QApplication([])

def on_button_clicked():
    global state
    button.setEnabled(False)
    cfg = picam2.create_still_configuration()
    picam2.switch_mode_and_capture_file(cfg, "test.jpg", signal_function=qpicamera2.signal_done)
    button.setEnabled(True)



window = QWidget()
bg_colour = window.palette().color(QPalette.Background).getRgb()[:3]
qpicamera2 = QGlPicamera2(picam2, width=preview_width, height=preview_height, bg_colour=bg_colour)

button = QPushButton("Click to capture JPEG")
button.clicked.connect(on_button_clicked)

label = QLabel()

 


window.setWindowTitle("Qt Picamera2 App")
label.setFixedWidth(400)
label.setAlignment(QtCore.Qt.AlignTop)
layout_h = QHBoxLayout()
layout_v = QVBoxLayout()
layout_v.addWidget(label)
layout_v.addWidget(button)
layout_h.addWidget(qpicamera2, 80)
layout_h.addLayout(layout_v, 20)

window.resize(1200, preview_height + 80)
window.setLayout(layout_h)

picam2.start()
window.show()
app.exec()
picam2.stop()
