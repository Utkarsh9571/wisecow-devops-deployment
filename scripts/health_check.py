import psutil

print(f"CPU Usage: {psutil.cpu_percent()}%")
print(f"Memory Usage: {psutil.virtual_memory().percent}%")
print(f"Disk Usage: {psutil.disk_usage("/").percent}%")
print(f"Processes Running: {len(psutil.pids())}")
