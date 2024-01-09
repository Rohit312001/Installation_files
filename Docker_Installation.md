# Docker Installation on Linux (Ubuntu)

### Installation of Docker Desktop

-  Open https://docs.docker.com/desktop/install/linux-install/ on browser.

![Screenshot from 2024-01-09 10-46-54](https://github.com/Rohit312001/GitDemo/assets/76991475/34814fbc-2977-4f2d-9e42-81afda535455)

- Now click on the `Download .deb` button.

![Screenshot from 2024-01-09 10-47-46](https://github.com/Rohit312001/GitDemo/assets/76991475/39b202b0-cc60-410e-afb4-d8379610f249)

### Installation of Docker Engine

- First we will remove all the **remove all the conflicting** and **broken packages** if previously present.

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

- Now we will install the `docker dependencies`.

```bash
sudo apt update
```

### First we will add the docker GPG key.

- This command install the essential packages for the docker installation.

```bash
sudo apt-get install ca-certificates curl gnupg
```

- This command creates the directory `/etc/apt/keyrings` with the permissions `0755` using the install command with superuser privileges.

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

- This command **downloads a security key for Docker**, converts it to a usable format, and saves it in a specific directory for package management on a Linux system.

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

- This command gives the permission to access the key.
    
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

- This command adds the Docker repository to the system’s `apt` sources.

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- After this do the `apt update` to update the package list.

```bash
sudo apt-get update
```

---

### Installation of Docker Desktop

- Now locate the docker desktop package (.deb) and install it.

```bash
sudo apt install ./docker-desktop-4.26.1-amd64.deb
```

### Docker sign in (for Docker Hub as well as Docker Desktop)

- **Note:** This sign-in is not directly possible as we need to generate a token from the docker hub and then use that token to sign in to the docker desktop.

- This is very important as its required to pull the images from the docker hub and also to push the images to the docker hub.

- This command will generate the gpg key.

```bash
gpg --generate-key
```

- Now pass the **Name** , **Email** and **Passphrase**.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/0e7c250f-baa6-49e2-807e-41a0ebeaf5ef)

- Now we will pass the `public generated key` from the prevoius command.

```bash
pass init <your_generated_gpg-id_public_key>
```

- Now go to the Docker Desktop and do the sign in.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/b73f745a-c9a1-431b-b90b-524a439282bd)

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/90978f8b-1ba4-4281-b044-588238ed49d5)

---

# Thus we have successfully installed the docker desktop on our system.
