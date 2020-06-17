cd `dirname $0`
if [[ ! `which pip` ]];then
    pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY curl -kL https://bootstrap.pypa.io/get-pip.py | python3
fi
python3 -m pip install -r ./requirements.txt
mkdir html
mkdir ~/.assistant
cp -r * ~/.assistant
cat <<EOF > ~/.config/autostart/micno-with-assistant.desktop
[Desktop Entry]
Name=Micno with Assistant
Comment=MicnoLinux向けのGoogleAssistantクライアント
Categories=Utility;
Type=Application
Exec=python3 $HOME/.assistant/main.py
Icon=mic-volume-high
Terminal=false
NoDisplay=false
EOF
python3 ~/.assistant/oauth.py --scope https://www.googleapis.com/auth/assistant-sdk-prototype --scope https://www.googleapis.com/auth/gcm --save --headless --client-secrets ./client_secret*.json
