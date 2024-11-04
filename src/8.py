import requests as r
import uuid
from celery import shared_task
from django.conf import settings
from pathlib import Path

# Сайт случайных картинок
IMAGE_URL = "https://unsplash.it/1600/900?random"

@shared_task
def download_image():
    try:
        # Выполняем запрос к сайту для получения изображения
        resp = r.get(IMAGE_URL)
        resp.raise_for_status()  # Проверяем, что запрос прошел успешно

        # Определяем формат файла (расширение)
        file_ext = resp.headers.get('Content-Type').split('/')[-1]
        file_name = Path(settings.BASE_DIR) / 'images' / f"{uuid.uuid4()}.{file_ext}"
        
        # Создаем папку для хранения изображений, если её еще нет
        file_name.parent.mkdir(parents=True, exist_ok=True)

        # Сохраняем файл на диск
        with open(file_name, 'wb') as f:
            for chunk in resp.iter_content(chunk_size=128):
                f.write(chunk)
        
        return f"Файл успешно сохранен: {file_name}"

    except Exception as e:
        # Логируем ошибку для анализа
        return f"Произошла ошибка при загрузке изображения: {e}"
