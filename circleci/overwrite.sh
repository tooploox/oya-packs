if [ -f .circleci/config.yml ]; then
    read -p "config.yml found in $(pwd)/.cricleci. Overwrite? [y/N] " yn
    if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
        echo "Y"
    fi
else
    echo "Y"
fi
