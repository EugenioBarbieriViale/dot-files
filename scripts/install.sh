#!/usr/sbin/bash

FILE="update.sh"
PATH="/home/eu/.local/bin/"
BASHRC="/home/eu/.bashrc"
STR="source ${PATH}${FILE}"

if /usr/sbin/chmod +x "$FILE"; then
  echo "$FILE is now executable"
else
  echo "$FILE not found"
  exit 1
fi

if /usr/sbin/mkdir -p "$PATH" && /usr/sbin/cp update.sh $PATH; then
  echo "Copied $FILE to $PATH"
else
  echo "Could not copy $FILE to $PATH"
  exit 1
fi

if [[ ! -z $(/usr/sbin/grep "$STR" "$BASHRC") ]]; then
  echo "\"$STR\" is already in $BASHRC"
else
  if echo -e "\n# Added by install.sh\n${STR}" >> "$BASHRC"; then
    echo "Added to $BASHRC"
  else
    echo "$BASHRC not found"
    exit 1
  fi
fi

echo "Done"
exit 0
