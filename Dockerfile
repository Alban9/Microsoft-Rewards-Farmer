FROM balenalib/raspberry-pi-debian-python:latest

RUN apt-get update && apt-get install -y cron wget apt-transport-https tzdata chromium chromium-driver

# install google chrome & Install Chrome Driver
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#&& sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
#&& apt-get -y update && apt-get install -y google-chrome-stable && apt-get install -yqq unzip \
#&& wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip \
#&& unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/ \
#&& mkdir -p /app

# Setup files/project
RUN mkdir -p /app
COPY accounts.json.sample ms_rewards_farmer.py requirements.txt DockerStart.sh README.md /app/
WORKDIR /app
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt && chmod +x ms_rewards_farmer.py && chmod +x DockerStart.sh

# set display port to avoid crash
ENV DISPLAY=:99

# Custom Env Vars
ENV TZ=America/New_York
ENV DOCKER_IMAGE=true

# Run the command on container startup
#CMD ["python3", "-u", "/config/ms_rewards_farmer.py"]
CMD ["/app/DockerStart.sh"]