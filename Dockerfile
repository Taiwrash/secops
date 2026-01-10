# Stage 1: Builder
FROM python:3.11-alpine as builder
RUN apk --update add bash nano g++
COPY ./requirements.txt /vampi/requirements.txt
WORKDIR /vampi
RUN pip install --prefix=/install -r requirements.txt

# Stage 2: Final image
FROM python:3.11-alpine
COPY . /vampi
WORKDIR /vampi

# Copy installed packages from builder
COPY --from=builder /install /usr/local

# Environment variables
ENV vulnerable=1
ENV tokentimetolive=60
ENV PORT=5000

# Expose port 5000
EXPOSE 5000

# Run the app
ENTRYPOINT ["python"]
CMD ["app.py"]
