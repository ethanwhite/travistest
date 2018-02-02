# Setup on weecologydeploy user
git config --global user.email "weecologydeploy@weecology.org"
git config --global user.name "Weecology Deploy Bot"

# Commit changes to portalPredictions repo
git checkout master
git add test.txt
git commit -m "Update forecasts: Travis Build $TRAVIS_BUILD_NUMBER [ci skip]"

git remote add deploy https://${GITHUB_TOKEN}@github.com/ethanwhite/travistest.git > /dev/null 2>&1
git push --quiet deploy master > /dev/null 2>&1

current_date=`date -I | head -c 10`
git tag $current_date
git push --quiet deploy --tags > /dev/null 2>&1
curl -v -i -X POST -H "Content-Type:application/json" -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/ethanwhite/travistest/releases -d "{\"tag_name\":\"$current_date\"}"
