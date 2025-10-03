# image_to_raw_rgb.py
from PIL import Image
import sys

def bmp_to_raw(input_bmp, output_raw):
    img = Image.open(input_bmp)

    if img.mode != 'RGB':
        img = img.convert('RGB')

    pixels = img.load()

    width, height = img.size

    print(f"Konvertiere: {input_bmp}  ({width}x{height} Pixel)")

    with open(output_raw, "wb") as rawfile:
        for y in range(height):
            for x in range(width):
                r, g, b = pixels[x, y]

                # Konvertiere RGB888 → RGB565
                rgb565 = ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3)
                rawfile.write(rgb565.to_bytes(2, byteorder=endian))

    print(f"Fertig: {output_raw}")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Nutzung: python image_to_raw_rgb.py input.bmp output.raw")
        sys.exit(1)
    
    input_bmp = sys.argv[1]
    output_raw = sys.argv[2]
    endian = sys.argv[3]
    bmp_to_raw(input_bmp, output_raw)
