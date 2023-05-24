# Python Project: Requests public API
import requests
import json
from time import sleep
import pandas as pd

nums = list(range(1,52))
result = []
for i in nums:
    url = f"https://api.pokemontcg.io/v2/cards/xy1-{i}"
    response = requests.get(url)
    data = response.json()
    row = [
        data["data"]["name"],
        data["data"]["hp"],
        data["data"]["types"],
        data["data"]["weaknesses"],
        data["data"]["rarity"],
        data["data"]["cardmarket"]["prices"]["averageSellPrice"]
    ]
    result.append(row)
    #sleep(1)
print(result)

# built .csv file
df = pd.DataFrame(result, columns = ["name", "hp", "types", "weaknesses","rarity","price($)"])
df.to_csv("pokemontcg_data.csv")
