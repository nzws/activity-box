workflow "Test my code" {
  on = "push"
  resolves = ["codecov"]
}

action "npm ci" {
  uses = "docker://node:10-alpine"
  runs = "npm"
  args = "ci"
}

action "npm test" {
  needs = "npm ci"
  uses = "docker://node:10-alpine"
  runs = "npm"
  args = "test"
}

action "codecov" {
  needs = "npm test"
  uses = "docker://node:10"
  runs = "npx"
  args = "codecov"
  secrets = ["CODECOV_TOKEN"]
}

workflow "Update activity" {
  resolves = ["update-gist"]
  on = "schedule(*/10 * * * *)"
}

action "update-gist" {
  uses = "yuzulabo/activity-box@master"
  secrets = [
    "GH_PAT",
    "GITHUB_TOKEN"
  ]
  env = {
    GH_USERNAME = "yuzulabo"
    GIST_ID = "1a8d76558e2221db1990c13e242ef259"
  }
}
