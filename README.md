# copr_obs-build-test4codeberg

A playground to get used with codeberg-woodpecker. Why? Because [Codeberg](https://codeberg.org/) uses [Woodpecker](https://woodpecker-ci.org/) as the [CI platform](https://ci.codeberg.org/).

Coming from [Github Actions](https://github.com/features/actions) my biggest challenge was to use the [Woodpecker Secrets](https://woodpecker-ci.org/docs/usage/secrets) to store the tokens for the external build services. Given the approach of shell variables, the usage of multiline secrets is almost asking for challenges. I managed to get it working (see the woodpecker YAML file) but it does not look very smart. But hey - it works that way.
Very important: the secrets are stored on the woodpacker side of the pipeline and not on the codeberg repo side.

For the rest, I have basically copied my work from [here](https://github.com/useidel/copr_obs-build-test) ... just adapting to the specialities of codeberg-ci.

Lastly, this is still work in progress. Rebuilds are triggered via push events. A better approach would be using [Release events](https://docs.codeberg.org/git/using-tags/).

These are main basic steps in order to get it working
1. Create your repository (work place) at Codeberg
2. [Request access to the Codeberg-CI platform](https://codeberg.org/Codeberg-e.V./requests)
3. Once logged in to [Woodpecker](https://ci.codeberg.org/repos) you need to connect/import your Codeberg repo. 
![screenshot](assets/images/woodpecker.repo.png "Woodpecker Repo")
That will implicitely setup two important things:
   * Creating an authorized Oauth2 application in your [Codeberg](https://codeberg.org/) profile (see Settings -> Application)
   *  Create the needed webhook (including target URL and Secrets) in your particular Codeberg Repo (see Seetings -> Webhooks)
4. Create the [.woodpecker.yaml](https://codeberg.org/useidel/copr_obs-build-test4codeberg/src/branch/main/.woodpecker.yaml) YAML file (and other needed scripts) in your Codeberg repo - see this my files in this repo.
5. If you need secrets (i.e. login credentials to external sites) -> store them on the Woodpecker side of the repo. 
![screenshot](assets/images/woodpecker.secrets.png "Woodpecker Secrets")
6. Push your changes and see if it works

Additional information: 
1. It seems that renaming your repo on codeberg does not break the connection to woodpecker. But you will see there at least two repos: one with the old name and one with the new name.
2. Related to step 3 from above: If things break somehow, start from scratch. Delete the repo on the [Woodpecker](https://ci.codeberg.org/repos) side of things. Delete as well the Oauth2 application in your [Codeberg](https://codeberg.org/) profile and the webhook in your particulare Codeberg Repo. Then re-connect the repo from  [Codeberg](https://codeberg.org/) to [Woodpecker](https://ci.codeberg.org/repos). If that does not help you might want to reset your [Woodpecker API Token](https://ci.codeberg.org/user#cli-and-api) as well. 
3. If you want to update files without tiggering a build you have to add `[SKIP CI]` to your commit message. Like: `git commit -m "updated README [CI SKIP]"`
4. You may want to review which events can trigger a build. This is done on the [Codeberg](https://codeberg.org/) side of things -> See Settings -> Webhooks. The default does include quite a few `PULL` events as trigger.  
