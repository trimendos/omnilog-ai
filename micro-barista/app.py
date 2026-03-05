import time
import random
import logging
import sys

# Налаштовуємо логер, щоб він виводив усе в консоль (stdout)
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', stream=sys.stdout)
logger = logging.getLogger("Micro-Barista")

logs =[
    (logging.INFO, "Замовлення прийнято: Капучино"),
    (logging.INFO, "Збиваємо молоко..."),
    (logging.WARNING, "Мало води в резервуарі!"),
    (logging.ERROR, "Помилка: Заклинило жорна кавомолки!"),
    (logging.INFO, "Кава готова. Клієнт задоволений.")
]

logger.info("Мікросервіс Micro-Barista запущено. Чекаємо замовлень...")

while True:
    time.sleep(random.randint(2, 5)) # Чекаємо від 2 до 5 секунд
    log_level, message = random.choice(logs)
    logger.log(log_level, message)