if command -v fortune >/dev/null 2>&1; then
    if command -v cowsay >/dev/null 2>&1; then
        fortune | cowsay -f $(ls /usr/share/cowsay/cows | sort -R | head -1)
    else
        fortune
    fi
fi
