# Oya CircleCI Pack

    $ oya import github.com/tooploox/oya-packs/circleci

    $ oya run circleci.generate

# Usage:

After generate Oyafile needs to be changed by adding onPush and onMergeToMaster hooks. eg:

```
Project: CircleCiPack

Require:
  github.com/tooploox/oya-packs/circleci: v0.0.3

Import:
  circleci: github.com/tooploox/oya-packs/circleci
  
Values:
  circleci:
    env:
      project_name: 'Project'

onPush: |
  bundle install
  bundle exec rake test

onMergeToMaster: |
  bundle install
  oya run heroku.deploy production $Project
```
