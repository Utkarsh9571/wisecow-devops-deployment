import socket

HOST = 'localhost'
PORT = 4499
TIMEOUT = 5

try:
    with socket.create_connection((HOST, PORT), timeout=TIMEOUT) as sock:
        print(f"Wisecow app is running on {HOST}:{PORT}")
except Exception as e:
    print(f"Wisecow app is not responding on {HOST}:{PORT}")
    print(f"Error: {e}")