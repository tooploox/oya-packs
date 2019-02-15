# Oya CircleCI Pack

    $ oya import github.com/tooploox/oya-packs/circleci

    $ oya run circleci.generate

# Usage:

After generate Oyafile needs to be changed by adding onPush and onMergeToMaster hooks. eg:

```
Project:
Import:
  heroku: github.com/tooploox/packs/heroku
  ci: github..

onPush: |
  bundle install
  bundle exec rake test

onMergeToMaster: |
  bundle install
  oya run heroku.deploy production $Project
```
