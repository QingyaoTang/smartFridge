import requests


response = requests.get('https://world.openfoodfacts.org/api/v0/product/01305326')
product = response.json()
print(response.json())
print(product['product']['product_name'])
