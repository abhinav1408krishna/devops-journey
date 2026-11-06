from flask import Flask, jsonify
from datetime import datetime, timezone
import os
import socket

app = Flask(__name__)
DATA_DIR = "/app/data"
VISIT_FILE = os.path.join(DATA_DIR, "visits.txt")

@app.route("/")
def home():
    return jsonify({
        "project": "Docker Containerization Lab",
        "message": "Application is running inside Docker!",
        "hostname": socket.gethostname(),
        "environment": os.getenv("APP_ENV", "development"),
        "timestamp": datetime.now(timezone.utc).isoformat()
    })

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

@app.route("/visit")
def visit():
    os.makedirs(DATA_DIR, exist_ok=True)

    count = 0
    if os.path.exists(VISIT_FILE):
        with open(VISIT_FILE, "r") as file:
            count = int(file.read().strip() or 0)

    count += 1

    with open(VISIT_FILE, "w") as file:
        file.write(str(count))

    return jsonify({"visit_count": count})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
