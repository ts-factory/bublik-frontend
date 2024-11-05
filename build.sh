#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2024 OKTET LTD
CWD=$(pwd)
BUBLIK_UI_LOCATION=$BUBLIK_UI_LOCATION

echo "------------------------"
echo "Current working directory: $CWD"
echo "Bublik UI location: $BUBLIK_UI_LOCATION"
echo "------------------------"

rm -r "$CWD"/dist/*

JSON_ARRAY=$(cat "$CWD"/config.json | jq -c '.[]')

cd "$BUBLIK_UI_LOCATION" || exit

while IFS= read -r ITEM; do
  BASE_URL=$(echo "$ITEM" | jq -r '.base')
  OUTPUT_FOLDER=$(echo "$ITEM" | jq -r '.output')

  echo "#############################################"
  echo -e "\e[1;34mStarting build for $BASE_URL\e[0m"
  echo -e "\e[1;33mOutput folder is $OUTPUT_FOLDER\e[0m"
  echo "#############################################"

  BASE_URL="$BASE_URL" nx run bublik:build --base="$BASE_URL" --outputPath=../dist/"$OUTPUT_FOLDER" --sourcemap="true"
done <<<"$JSON_ARRAY"
