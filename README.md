# Github API Training
## Introduction to Github API

The target is to build an app enabling a Github's repo access to an invited guess.
The step will be like in Netlify to validate access to a repo \
Step 1 CTA to add new repo \
<img width="780" alt="Step 1 CTA to add new repo" src="https://user-images.githubusercontent.com/33062224/151703493-08c15eee-efcf-4888-bef3-eaa854f9ed49.png"> \
Step 2 select Github \
<img width="814" alt="Step 2 select Github" src="https://user-images.githubusercontent.com/33062224/151703489-4c483e96-4179-4e1a-9ff4-4c5c7d3e479a.png"> \
Step 3 after validation select a repo \
<img width="759" alt="Step 3 after validation select a repo" src="https://user-images.githubusercontent.com/33062224/151703487-90c09fe3-d495-4f0c-af1d-d64787af51f5.png"> \
Step 4 validation \
<img width="758" alt="Step 4 validation" src="https://user-images.githubusercontent.com/33062224/151703485-31557bf8-6452-4eb4-bc92-2a9de1c23984.png"> \



## Starting with the basics

### Rails new

Let's start by creating a new Rails app
In the terminal
```
rails new github_api_training --database=postgresql

cd github_api_training
git add . && git commit -m "My new Github API training app"
gh repo create
git push origin master
```

## Setup of Octokit gem
https://octokit.github.io/octokit.rb/
