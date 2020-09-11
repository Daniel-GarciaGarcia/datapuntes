from bonus.pixel import *
from fpdf import FPDF 

pdf = FPDF()
pdf.add_page()
pdf.set_font('Arial', 'B', 15)

for row in pixel_data:
    for pixel in row:
        pdf.set_fill_color(*colors.get(pixel))
        pdf.cell(10,10,fill=True,ln=0)
    pdf.ln()

pdf.output('output/pixelart.pdf', 'F')