from fpdf import FPDF
from modules.text_processing import chunks
from modules.settings import color, fonts

def pokepdf(pokemon):
    # FPDF Object
    pdf = FPDF("L","mm","A5")
    # Add page
    pdf.add_page()

    # Paint the background
    pdf.set_fill_color(*color.get(pokemon["type"][0],(255,)))
    pdf.rect(0,0,210,297,"F")

    # Set font
    pdf.set_font(*fonts["title"])
    pdf.set_xy(20,10)

    # Add Pokeball
    ball={False:"pokeball", True:"masterball"}[pokemon["legendary"]]
    pdf.image(f"images/balls/{ball}.png", pdf.get_x(), pdf.get_y()+25, w=20)
    
    # Add Pokemon Name
    pdf.cell(w=0,txt=f"{pokemon['id']} - {pokemon['name']}".title(),align="C", ln=1)
    
    # Add Pokemon Sprite
    pdf.image(pokemon["sprite_url"], 80, pdf.get_y()+10, w=50)

    # Set new font
    font = fonts["flavor"]
    pdf.set_font(*font)
    pdf.set_xy(10,70)

    # Cut text if larger than page
    flavor = chunks(pokemon["flavor"],font)

    # Add flavor text
    for i in flavor:
        pdf.cell(w=0,h=5,txt=i,align="C",ln=2)

    # Add type symbols
    for i,typ in enumerate(pokemon["type"]):
        if len(pokemon["type"])==1:
            pos=[90]
        else:
            pos=[50,120]
        pdf.image(f"images/types/{typ}.png", pos[i], pdf.get_y()+15, w=40)

    # Export pdf
    path = f"output/{pokemon['name']}.pdf"
    pdf.output(path)
    print(f"pdf saved to {path}")