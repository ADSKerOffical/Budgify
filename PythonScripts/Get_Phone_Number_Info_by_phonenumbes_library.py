import phonenumbers # Если данной библиотеки нет, то зайди в Pydroid, потом на три полоски в левом верхнем углу, найди Pip, зайди в Install и впиши phonenumbers. Отказывайся от плагина. Потом просто подожди пока библиотека скачается
import requests

from phonenumbers import geocoder, carrier, timezone
phone_number = "+79006068279" # Введи сюда номер телефона в формате E.164
parsed_number = phonenumbers.parse(phone_number)

if not phonenumbers.is_valid_number(parsed_number):
  print("Номера не существует или не удалось получить информацию")
else:
  country = geocoder.description_for_number(parsed_number, "ru")
  operator = carrier.name_for_number(parsed_number, "ru")
  numbertype = phonenumbers.number_type(parsed_number)
  
  print(f"Полученная информация об номере {phone_number}:")
  print(f"Страна/Регион: {country}")
  print(f"Оператор: {operator}")
  print(f"Тип номера: {numbertype}")
