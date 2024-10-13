TAG_DATA=$(git tag -n1 "$GITHUB_REF" --format=$'# %(refname:lstrip=2) - %(contents:subject)\n%(contents:body)')
echo 'TAG_DATA<<EOF' >> $GITHUB_OUTPUT
echo "$TAG_DATA" >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT