<p align="center">
  <img width="400" src="https://user-images.githubusercontent.com/10660468/54499151-062f8900-48e5-11e9-82c9-767d39c9cbbe.png">
  <h3 align="center">activity-box</h3>
  <p align="center">⚡️📌 Update a pinned gist to contain the latest activity of a user</p>
</p>

<p align="center"><a href="https://action-badges.now.sh"><img src="https://action-badges.now.sh/JasonEtco/activity-box" /></a> <a href="https://codecov.io/gh/JasonEtco/activity-box/"><img src="https://badgen.now.sh/codecov/c/github/JasonEtco/activity-box" alt="Codecov"></a></p>

---

## Setup

**activity-box** is a GitHub Action that is designed to work using the [`schedule`](https://developer.github.com/actions/managing-workflows/creating-and-cancelling-a-workflow/#scheduling-a-workflow) event.

### Prep work

1. Create a new public GitHub Gist (https://gist.github.com/)
2. [Create a token](https://github.com/settings/tokens/new) with the `gist` scope and copy it. The `GITHUB_TOKEN` that comes with GitHub Actions cannot currently use the Gist API.

### Project setup

1. Create a `.github/main.workflow` file with a workflow like this:

```workflow
workflow "Update activity" {
  on = "schedule(*/15 * * * *)"
  resolves = ["update-gist"]
}

action "update-gist" {
  uses = "JasonEtco/activity-box@master"
  secrets = [
    "GH_PAT",
    "GITHUB_TOKEN"
  ]
  env = {
    GH_USERNAME = "JasonEtco",
    GIST_ID = "123abc"
  }
}
```

2. 💰 Profit

### Environment variables & secrets

- **GIST_ID:** The ID portion from your gist url `https://gist.github.com/matchai/`**`6d5f84419863089a167387da62dd7081`**.
- **GH_PAT:** The GitHub token generated above.
- **GH_USERNAME:** The username handle of the GitHub account.

---

_Inspired by [matchai/bird-box](https://github.com/matchai/bird-box)_
