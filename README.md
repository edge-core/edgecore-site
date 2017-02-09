# Edgecore Networks Github Site

## Workflow

### Write new posts

1. Fork `http://github.com/edge-core/site.git` from GitHub page
2. `git clone http://github.com/<username>/site.git`
3. `./write_new_post.sh <new post title>`
4. Edit your new post in `~/site/source/_posts/<new post title>`
5. Cook...cook...cook...
6. `git add <new post title>`
7. `git commit --signoff -a`
8. Please write the commit history in log
9. `git push origin master`
10. Go back to your github page and send the Pull Reauest

### Update local repository from upstream repository
1. `git remote add upstream http://github.com/edge-core/site.git`
2. `git pull upstream master`

### Merge Pull Request (Site manager only)
1. Review PR
2. Click `Merge pull request` button on GitHub page
