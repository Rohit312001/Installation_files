# First, add the repository key to your system:

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# The gpg --dearmor command is used to convert the key into a format that apt recognizes.

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# After both command have entered run apt update:

sudo apt update

# Install Jenkins and its dependencies:

sudo apt install jenkins

# now that Jenkins is installed, start it by using systemctl:

sudo systemctl start jenkins.service

# Since systemctl doesn’t display status output, we’ll use the status command to verify that Jenkins started successfully:

sudo systemctl status jenkins

# To know about Administrator password.

sudo cat /var/lib/jenkins/secrets/initialAdminPassword