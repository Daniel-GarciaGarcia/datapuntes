# pyFPDF
# https://pyfpdf.readthedocs.io/en/latest/

from fpdf import FPDF 

# FPDF(orientation = 'P', unit = 'mm', format='A4')
pdf = FPDF()
pdf.add_page()
pdf.set_font("Helvetica","",12)

#pdf.text(5,10,"Hello, World!")
#length = pdf.get_string_width("Hello, World!    ")
#pdf.text(5,15,"print(Hello, World!)")
pdf.set_xy(20,100)
#fpdf.cell(w, h = 0, txt = '', border = 0, ln = 0, align = '', fill = False, link = '')
pdf.cell(30,5, "Hello, World!", border="LTBR", align="C")
pdf.cell(0,5, "Hola, Mundo!", border="LTBR", align="C", ln=2)
pdf.cell(0,5, "Olá, Mundo!", border="LTBR", align="C", ln=2)

x,y = pdf.get_x(), pdf.get_y()
print(x,y)
pdf.set_text_color(47,172,155)
pdf.text(x,y,"AAAAAAAAAAAA")



pdf.output("output/myfirstpdf.pdf")