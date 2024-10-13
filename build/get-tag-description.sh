TAG_DATA=$(git tag -n1 "$GITHUB_REF" --format=$'%(contents:subject)\n\n%(contents:body)')
echo "TAG_NAME=${TAG_NAME}" >> $GITHUB_OUTPUT