if [ -f Dockerfile ]; then
    read -p "Dockerfile found in $(pwd). Override? [y/N] " yn
    if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
        echo "Y"
    else
        echo "N"
    fi
else
    echo "Y"
fi
