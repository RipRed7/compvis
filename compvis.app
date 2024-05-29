import cv2 # type: ignore
import numpy as np
from object_detection import ObjectDetection

#initialzie Object Detection
od = ObjectDetection()

cap = cv2.VideoCapture("los_angeles.mp4")

while True:
    _, frame = cap.read()

    # Detect objects on frame 
    (class_ids, scores, boxes) = od.detect(frame)
    for box in boxes:
        print(box)
        (x, y, w, h) = box
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

    cv2.imshow("Frame", frame)
 
    key = cv2.waitKey(1)
    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()
