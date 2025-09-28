#!/bin/bash
echo "==================="  # this is for printing

# use git
git config --global user.name "${GITHUB_ACTOR}" # this sets the git username to the GitHub actor (the person who triggered the action)
git config --global user.email "${INPUT_EMAIL}" # this sets the git email to the email provided in the action input
git config --global --add safe.directory /github/workspace # this marks the /github/workspace directory as safe for git operations

python3 /usr/bin/feed.py # this runs the feed.py script using python3

# commit and push changes
git add -A && git commit -m "Update Feed"

# push to the main branch
git push --set-upstream origin main # this pushes the changes to the main branch

echo "===================" 