sudo apt update
sudo apt -y install nginx
sudo apt -y install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
sudo apt-get -y install default-libmysqlclient-dev
sudo apt -y install python3-venv
git clone https://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@github.com/shamoilkazmi/vvm-aqi-dashboard.git
cd vvm-aqi-dashboard/
mv aqi-python-dashboard ~/myproject/
cd ..
sudo rm -rf vvm-aqi-dashboard/
cd myproject
mv app.py myproject.py
python3 -m venv myprojectenv
source myprojectenv/bin/activate
pip install wheel
pip install gunicorn flask
pip install flask-mysqldb
sudo ufw allow 5000
cd ..
git clone https://github.com/aws/aws-iot-device-sdk-python.git
cd aws-iot-device-sdk-python
python setup.py install
cd ..
deactivate
cd myproject
sudo mv myproject.service /etc/systemd/system/myproject.service
sudo systemctl start myproject
sudo systemctl enable myproject
//sudo systemctl status myproject
sudo mv myproject /etc/nginx/sites-available/myproject
sudo nano /etc/nginx/sites-available/myproject
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled
sudo nginx -t
sudo systemctl restart nginx
sudo ufw delete allow 5000
sudo ufw allow 'Nginx Full'
sudo chmod 755 /home/ubuntu