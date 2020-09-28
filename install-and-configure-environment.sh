# vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# git
sudo apt install git -y
sudo apt install xclip -y
git config --global user.name "{name}"
git config --global user.email "{email}"
ssh-keygen -t rsa -b 4096 -C "{email}"
eval "$(ssh-agent -s)"
xclip -sel clip < ~/.ssh/id_rsa.pub

# imwheel
sudo apt install imwheel -y
echo "\".*\"
None,      Up,   Button4, 2
None,      Down, Button5, 2
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5" >> ~/.imwheelrc

# custom path
mkdir ~/.custom_path
echo "PATH DEFAULT=\${PATH}:$( getent passwd "$USER" | cut -d: -f6 )/.custom_path" >> ~/.pam_environment
ln -s "$(which google-chrome)" ~/.custom_path/chrome
ln -s "$(which gnome-session-quit)" ~/.custom_path/logoff

# open with code
echo "[Nemo Action]

Active=true
Name=Open with Code
Comment=Opens current folder on vscode
Exec=code %P
Icon-Name=code
Selection=none
Extensions=any;
Quote=double
Dependencies=code;" >> ~/.local/share/nemo/actions