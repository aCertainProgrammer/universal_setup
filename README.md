For Github ssh setup:

```
ssh-keygen -t ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Setup:

```
sudo apt install git -y; cd; mkdir dev; cd ~/dev && git clone https://github.com/aCertainProgrammer/universal_setup.git && cd universal_setup && sudo chmod +x setup.sh && ./setup.sh && cd 
```
