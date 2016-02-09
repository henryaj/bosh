#!/bin/bash

set -e
set -u

export VERSION=$( cat version/number | sed 's/\.0$//;s/\.0$//' )

for file in $COPY_KEYS ; do
  file="${file/\%s/$VERSION}"

  echo "Publishing $file..."
  aws s3 cp "s3://$BUCKET_NAME/$CANDIDATE_PREFIX$file" "s3://$BUCKET_NAME/$PUBLISHED_PREFIX$file"

  echo ""
done

echo "Done"
