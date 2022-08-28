#https://www.vultr.com/docs/update-python3-on-centos/

sudo yum groupinstall 'development tools' -y && sudo yum install wget openssl-devel bzip2-devel libffi-devel xz-devel -y
sudo wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
sudo tar xzf Python-3.9.6.tgz
cd Python-3.9.6 && ./configure --enable-optimizations
sudo make altinstall
ls /usr/local/bin/python*
sudo alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 1 && sudo alternatives --set python3 /usr/local/bin/python3.9 && sudo echo "2" | sudo alternatives --config python

#Update Pip
sudo /usr/local/bin/python3.9 -m pip install --upgrade pip
ls /usr/local/bin/pip*
sudo alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.9 1 && sudo alternatives --set pip /usr/local/bin/pip3.9
python -V && pip -V
#
python3 -m pip install --user ansible