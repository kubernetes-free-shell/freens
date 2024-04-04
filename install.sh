#!/bin/sh

install() {
    echo 'Downloading and installing freens executable file...'

    URL="https://raw.githubusercontent.com/kubernetes-free-shell/freens/main/src/freens"
    TMP_EXECUTABLE_FILE_PATH="/tmp/freensexe"
    EXECUTABLE_FILE_PATH="/usr/local/bin/freens"

    if command -v curl &> /dev/null; then
        curl "$URL" > "$TMP_EXECUTABLE_FILE_PATH"
    elif command -v wget &> /dev/null; then
        wget -q -O - "$URL" > "$TMP_EXECUTABLE_FILE_PATH"
    else
        echo "Neither curl nor wget is installed. Please install either curl or wget."
        exit 1
    fi

    chmod +x "$TMP_EXECUTABLE_FILE_PATH"
    sudo mv "$TMP_EXECUTABLE_FILE_PATH" "$EXECUTABLE_FILE_PATH"
    rm -rf "$TMP_EXECUTABLE_FILE_PATH"
    echo "freens is installed." 
    echo "You can run freens --help"
}

install