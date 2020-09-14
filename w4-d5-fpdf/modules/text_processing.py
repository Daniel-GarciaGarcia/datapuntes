from fpdf import FPDF

# FPDF object needed for using get_string_width method.
pdf = FPDF()

def chunks(string, font):
    pdf.set_font(*font)
    if pdf.get_string_width(string) < 190:
        return [string]
    else:
        string = string.split(" ")
        l = len(string)
        return [" ".join(i) for i in [string[:l//2],string[l//2:]]]