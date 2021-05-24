clone script จาก https://github.com/tantee/vaccine-docker หรือ download จาก https://github.com/tantee/vaccine-docker/archive/refs/heads/main.zip

วิธีการติดตั้ง
1. rename file docker-compose.env เป็น .env
2. ตั้งค่าต่างๆ ใน file .env ตามการใช้งาน
3. run คำสั่ง docker-compose up -d
4. run คำสั่ง docker-compose exec -T mysql mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --database=${MYSQL_DATABASE} < vaccinedb.sql

จะสามารถเข้าใช้งานได้ทาง http://localhost เพื่อทดสอบการใช้งาน โดยใช้ default admin account ดังนี้
username : admin
password : admin123

ใน docker-compose.yml version นี้ไม่ได้ใส่ letsencrypt และ expose server ใน port 443 (https) ไว้ เมื่อนำไปใช้งานจริง จะต้องทำ deploy server ให้ https ครับ ไม่เช่นนั้นจะไม่สามารถใช้งานกล้อง หรืออุปกรณ์อื่นๆ ใน chrome ได้

วิธีการ deploy เป็น https สามารถทำได้ 2 วิธี

วิธีที่ 1 แก้ไข service nginx ใน docker-compose.yml
- แก้ไข file proxy/nginx.conf ให้ bind port 443 และ load ssl certificate
- mount file ssl certificate ไปยัง service nginx

วิธีที่ 2 ใช้ reverse proxy จาก server ที่มี https อยู่แล้ว
- ทำ reverse proxy จาก https server มายัง http://ip-address ของ server ที่ติดตั้ง