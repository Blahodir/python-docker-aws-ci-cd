# Stage 2: Фінальний образ
FROM python:3.11-slim
WORKDIR /app

# Копіюємо бібліотеки
COPY --from=builder /install /usr/local

# Копіюємо файл main.py прямо в робочу директорію /app
COPY ./main.py /app/main.py

# Безпека
RUN useradd -m myuser
USER myuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
