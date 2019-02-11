DEFAULT_LANG="ruby"
lang=$DEFAULT_LANG

if [ -f package.json ]; then
    lang="nodejs"
fi
if [ -f Rakefile ]; then
    lang="ruby"
fi
if [[ -n $(find . -maxdepth 1 -type f -name "*.go") ]]; then
    lang="go"
fi
if [[ -n $(find . -name "__init__.py") ]]; then
    lang="python"
fi

echo $lang
