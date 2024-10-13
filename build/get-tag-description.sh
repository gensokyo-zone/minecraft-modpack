TAG_DATA=$(git tag -n1 "$GITHUB_REF" --format=$'# %(refname:lstrip=2) - %(contents:subject)\n%(contents:body)')
echo "TAG_DATA=${TAG_DATA}" >> $GITHUB_OUTPUT