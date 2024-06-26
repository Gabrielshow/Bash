#!/usr/bin/env bash

# Check if the scirpt is being run with the correct number of arguments

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <remote_repo_url> "
	exit 1
fi

# Get the remote repository URL from the command line arguments
remote_repo_url = "$1"

# Get the current working directory path
project_dir=$(pwd)

# Change to the project directory
cd "$project_dir" || exit 1

# Initialize a new Git repository if one doesn't exist
if ! git rev-parse --git-dir > /dev/null 2>&1; then
	git init
fi

# Add all files to the staging area
git add .

# Commit the changes with a message
read -r -p "Enter a commit message: " commit_message
git commit -m "$commit_message"

# Add the remote repository URL
git remote add origin "$remote_repo_url"

# Push the changes to the remote repository
git push -u origin master
