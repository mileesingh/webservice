FROM python
COPY app.py /
RUN pip install flask flask_httpauth
CMD python /app.py
