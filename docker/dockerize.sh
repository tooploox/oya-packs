if [ -f Dockerfile ]; then
    read -p "Dockerfile found. Override? [y/N] " yn
    if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
        override=true # TODO: write nagive if and get rid of it
    else
        exit
    fi
fi

DEFAULT_LANG="ruby"
lang=$DEFAULT_LANG

detectProjectLang () {
    if [ -f package.json ]; then
        lang="nodejs"
    fi
    if [ -f Rakefile ]; then
        lang="ruby"
    fi
    if [ -f go.mod ]; then
        lang="go"
    fi
    if [[ -n $(find . -name "__init__.py") ]]; then
        lang="python"
    fi
}
detectProjectLang

BasePath=$1
cp $BasePath/Dockerfile-$lang ./Dockerfile
