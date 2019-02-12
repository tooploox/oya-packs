DEFAULT_IMAGE=circleci/classic:latest
image=$DEFAULT_IMAGE

if [ -f package.json ]; then
    image=circleci/node:11.9.0-stretch-node-browsers
fi
if [ -f Rakefile ]; then
    image=circleci/ruby:2.5-node-browsers
fi
if [[ -n $(find . -maxdepth 1 -type f -name "*.go") ]]; then
    image=circleci/golang:1.11.5-node-browsers
fi
if [[ -n $(find . -name "__init__.py") ]]; then
    image=circleci/python:3.7.2-node-browsers
fi


echo $image
