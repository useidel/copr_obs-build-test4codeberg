# copr_obs-build-test4codeberg

A playground to get used with codeberg-woodpecker. Why? Because [Codeberg](https://codeberg.org/) uses [Woodpecker](https://woodpecker-ci.org/) as the [CI platform](https://ci.codeberg.org/).

Coming from [Github Actions](https://github.com/features/actions) my biggest challenge was to use the [Woodpecker Secrets](https://woodpecker-ci.org/docs/usage/secrets) to store the tokens for the external build services. Given the approach of shell variables, the usage of multiline secrets is almost asking for challenges. I managed to get it working (see the woodpecker YAML file) but it does not look very smart. But hey - it works that way.
Very important: the secrets are stored on the woodpacker site of the pipeline and not on the codeberg repo site.

For the rest, I have basically copied my work from [here](https://github.com/useidel/copr_obs-build-test) ... just adapting to the specialities of codeberg-ci.

Lastly, this is still work in progress. Rebuilds are triggered via push events. A better approach would be using [Release events] (https://docs.codeberg.org/git/using-tags/).

