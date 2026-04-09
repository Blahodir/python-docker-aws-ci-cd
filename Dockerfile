# Етап 1: Збірка (називаємо його просто '0' або залишаємо без змін).
FROM python:3.11-slim AS build_stage
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Етап 2: Фінальний образ
FROM python:3.11-slim
WORKDIR /app

# Копіюємо встановлені пакети з першого етапу
COPY --from=build_stage /install /usr/local
# Копіюємо код
COPY main.py .

# Налаштування безпеки
RUN useradd -m myuser
USER myuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
