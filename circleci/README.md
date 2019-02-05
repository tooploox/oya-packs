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
  rake test

onMergeToMaster: |
  oya run heroku.deploy production $Values.projectName
```
