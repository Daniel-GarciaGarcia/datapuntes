import requests

def get(name, id):
    # API url
    url = "https://pokeapi.co/api/v2/"
    # Checking for name or id
    name = name or id
    # If neither
    if not name:
        raise ValueError("You must chose a Pokemon")
    endpoint = f"pokemon/{name}"

    # Adquire data from API
    res = requests.get(url+endpoint)
    data = res.json()
    data_add = requests.get(data["species"]["url"]).json()

    pokemon = {"id":data["id"],
            "name":data["name"],
            "type":[typ["type"]["name"] for typ in data["types"]],
            "sprite_url":data["sprites"]["front_default"],
            "legendary": data_add["is_legendary"]}
    
    # Search for flavor text in English
    for flav in data_add["flavor_text_entries"]:
        if flav["language"]["name"]=="en":
            pokemon["flavor"]=flav["flavor_text"].replace("\n", " ")
            break

    return pokemon