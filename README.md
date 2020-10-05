# Docker Action (Multitag)

This action allows you to create, tag and publish a docker image. It also allows to specify 
multiple tags per image, e.g. `user/image:latest` and `user/image:13.0`.

Alternatives:
- [manusa/actions-publish-docker](https://github.com/marketplace/actions/docker-publish)
- [zenato/docker-action](https://github.com/marketplace/actions/docker-action)
- [opspresso/action-docker](https://github.com/marketplace/actions/docker-push)
- [elgohr/Publish-Docker-Github-Action](https://github.com/marketplace/actions/publish-docker)

## Usage
### Build image with latest tag
```yaml
- name: Build
  uses: danielr1996/docker-action-multitag@1.0.0
  with:
    imagename: user/image
    dockeruser: ${{ secrets.DOCKER_USERNAME }}
    dockerpassword: ${{ secrets.DOCKER_PASSWORD }}
```

### Build image with git branch name and git short commit ref as tags
To populate the environment with a short ref and slug of your branch name use [rlespinasse/github-slug-action](https://github.com/marketplace/actions/github-slug).

```yaml
- uses: rlespinasse/github-slug-action@v1.1.x
- name: Build
  uses: danielr199/docker-action-multitag
  with:
    imagename: user/image
    imagetags: |
            ${{ env.GITHUB_REF_SLUG }}
            ${{ env.GITHUB_SHA_SHORT }}
    dockeruser: ${{ secrets.DOCKER_USERNAME }}
    dockerpassword: ${{ secrets.DOCKER_PASSWORD }}
```
