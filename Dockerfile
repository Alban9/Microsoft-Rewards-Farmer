FROM joyzoursky/python-chromedriver:latest

# Setup files/project
RUN mkdir -p /app
COPY accounts.json.sample ms_rewards_farmer.py requirements.txt DockerStart.sh README.md /app/
WORKDIR /app
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Custom Env Vars
ENV DOCKER_IMAGE=true

# Run the command on container startup
CMD ["/app/DockerStart.sh"]