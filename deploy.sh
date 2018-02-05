CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
PUBLISH_BRANCH=gh-pages
BRANCH_TO_DEPLOY=develop

API_DOCS_FOLDER=../SketchAPI/docs
LOCAL_DOCS_FOLDER=./_api-references

# switch to gh-pages
echo "Switching to gh-pages..."
git fetch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
git checkout $PUBLISH_BRANCH

# update it with the latest changes
echo "Getting the latest changes..."
git merge $BRANCH_TO_DEPLOY --no-edit
rm -rf $LOCAL_DOCS_FOLDER
cp -r $API_DOCS_FOLDER $LOCAL_DOCS_FOLDER
git add .

# commit and push
echo "Publishing the changes..."
git commit -m 'publish new version of the docs :tada:'

# go back to previous state
echo "Cleaning up..."
git checkout $CURRENT_BRANCH
rm -rf $LOCAL_DOCS_FOLDER

echo "All done ✨"