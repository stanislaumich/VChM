import os.path
# pip install easy-ocr
import easyocr
import pytesseract
from PIL import Image

pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"



def teseract_recognition(path_img):
    return pytesseract.image_to_string(Image.open(path_img), lang='rus', config=r'--oem 3 --psm 6')



def main():
    d = teseract_recognition("s:\\DOWNLOADS\\NAKpng.png")
    print(d)


if __name__ == "__main__":
    main()