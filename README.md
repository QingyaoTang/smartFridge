# Shared Refrigerator System

## Project Overview

The Shared Refrigerator System is an intelligent food management system that combines hardware devices with a mobile application. The system utilizes a Raspberry Pi 4B, SPI Display for RPI, Raspberry Pi Camera V2, and a mobile app developed with Flutter to enable smart food management. Users can scan barcodes and expiration dates on food packaging through the system, and the data is stored in virtual refrigerators within the mobile app, helping users manage food efficiently and reduce waste.
![dfc](
## System Architecture

### Hardware Components

- **Raspberry Pi 4B**: Serves as the main control board, responsible for controlling the camera, display, and communication with the server.
- **SPI Display for RPI**: Used to display real-time system status, such as success or failure messages.
- **Raspberry Pi Camera V2**: Used to scan the barcode and expiration date on food packaging.

### Software Components

- **Flutter App**: A mobile application for user interaction and food management, allowing users to create virtual refrigerators, add food items, view expiration dates, and more.
- **PaddleOCR API**: Used for recognizing the expiration date on food packaging.
- **Pyzbar Library**: Used to read barcode information on food packaging.
- **OpenFood API**: Used to retrieve detailed food information, such as name and nutritional content, based on the barcode.
- **OpenCV**: Used to process images captured by the camera in grayscale to enhance the accuracy of OCR and barcode recognition.
- **Regular Expressions**: Used to format and validate the recognized text information.
- **MQTT Protocol**: Facilitates data transmission between the device and the app, ensuring that scan results are synced in real-time to the mobile application.

## Features

1. **Food Scanning**:
   - Users can click the "Start" button on the screen to start scanning the barcode and expiration date on food packaging.
   - The system captures images using the camera, processes them in grayscale using OpenCV to improve clarity and OCR accuracy, reads the barcode using the Pyzbar library, retrieves food information using the OpenFood API, and processes the expiration date using the PaddleOCR API.
   - If the recognition is successful, the display shows "Recognition Successful," and the data is transmitted to the app's database via MQTT.
   - If the recognition fails, the display shows "Recognition Failed, Please Add Manually in the App," and the user needs to manually add the food information in the app.

2. **Food Management**:
   - Users can create multiple virtual refrigerators in the app and manage different food items within each refrigerator.
   - Clicking on a food item name takes the user to the food detail page, where they can view or edit the food name and expiration date.
   - Each food item has a "Opened" button; when clicked, the food's edible expiration date automatically updates to three days later.

3. **Expiration Date Reminders**:
   - The app will send an email notification three days before a food item’s expiration date, reminding users to consume the food soon.

## Installation Guide

### Hardware Setup

1. Connect the Raspberry Pi 4B to the SPI Display and Raspberry Pi Camera V2, and install the necessary drivers and dependencies.
2. Pair the Raspberry Pi with the display and camera, and configure the Raspberry Pi to support MQTT communication.

### Software Setup

1. Clone the project repository to your local machine and navigate to the project directory:
   ```bash
   git clone [[repository link](https://github.com/QingyaoTang/smartFridge)]
2. On the Raspberry Pi, configure the PaddleOCR API, Pyzbar library, OpenCV, and OpenFood API, and integrate them with the Raspberry Pi Camera.
3. Configure the Raspberry Pi to transmit scan results to the app's database via MQTT.

### Flutter App Installation

1. Ensure that the Flutter development environment is installed.
2. Run the following command in the terminal to fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on an emulator or physical device:
   ```bash
   flutter run
   ```

## Usage

1. **Start the System**: Ensure that both the Raspberry Pi and the app are running, then press the "Start" button on the Raspberry Pi to begin scanning barcodes and expiration dates.
2. **View and Manage Food**: Review the scan results in the mobile app, and manually add or modify food information as needed.
3. **Use the Reminder Feature**: The app will send an email notification three days before the expiration date of a food item.

## Project Structure

```plaintext
├── hardware/
│   ├── rpi_config/      # Raspberry Pi configuration files
│   ├── display/         # SPI Display configuration and control code
│   ├── camera/          # Camera configuration and image capture code
├── software/
│   ├── flutter_app/     # Flutter application code
│   ├── ocr/             # OCR recognition and regex processing code
│   ├── pyzbar/          # Pyzbar barcode reading code
│   ├── openfood/        # OpenFood API integration code
│   ├── opencv/          # OpenCV image processing code
│   └── mqtt/            # MQTT communication configuration and handling code
├── README.md            # Project documentation
└── LICENSE              # License file
```

## Contribution Guide

If you wish to contribute to this project, please follow these steps:

1. Fork this repository.
2. Create a new branch (git checkout -b feature/your-feature).
3. Commit your changes (git commit -m 'Add some feature').
4. Push to the branch (git push origin feature/your-feature).
5. Submit a Pull Request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any questions or suggestions, please contact [ucbvqt1@ucl.ac.uk].
