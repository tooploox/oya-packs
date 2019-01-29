if [ -f Dockerfile ]; then
    read -p "Dockerfile found. Override? [y/N] " yn
    if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
        override=true # TODO: write nagive if and get rid of it
    else
        exit
    fi
fi

# TODO: fetch language from flags and use proper Dockerfile
BasePath=$1
cp $BasePath/Dockerfile-ruby ./Dockerfile
