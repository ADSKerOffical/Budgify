import asyncio
import aiohttp
import time

url = "https://httpbin.org/net"

async def request(session):
  try:
    async with session.get(url) as response:
        return response.status
  except:
      pass

async def main():
  async with aiohttp.ClientSession() as session:
    tasks = []
    for i in range(1000):
       tasks.append(request(session))

    results = await asyncio.gather(*tasks)
    print(f"Отправлено {len(results)} запросов")

if __name__ == "__main__":
  nowtime = time.time()
  asyncio.run(main())
  print("Все запросы отправлены за " + str(time.time() - nowtime))
