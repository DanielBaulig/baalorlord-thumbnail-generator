#!/bin/bash

cd html/images

TARGET_DIRECTORY=$1

cd $TARGET_DIRECTORY

generateJSON () {
    local no_ext=$(echo "$@" | sed 's/.png//g')
    local labels=$(echo "$no_ext" | sed 's/_.//g' | sed -E 's/([A-Z][a-z]+)/\1 /g' | sed 's/Bloodfor/Blood for/g' | sed -E 's/ $//g')
    local keys=$(echo "$no_ext" | sed 's/_.//g' | tr '[:upper:]' '[:lower:'])

    IFS=$'\n' read -d '' -r -a keys_array < <(echo "$keys")
    IFS=$'\n' read -d '' -r -a labels_array < <(echo "$labels")
    IFS=$'\n' read -d '' -r -a files_array < <(echo "$@")

    echo "{"
    for index in "${!keys_array[@]}";
    do
        echo "  \"${keys_array[$index]}\": {"
        echo "    \"label\": \"${labels_array[$index]}\","
        echo "    \"image\": \"./images/$TARGET_DIRECTORY/${files_array[$index]}\""
        echo -n "  }"

        # echo "$index -> ${keys_array[$index]}"
        if [ $index -lt $((${#keys_array[@]} - 1)) ] ; 
        then
            echo ','
        else
            echo ""
        fi
    done
    echo "}"
}

FILES="$(ls *.png)"

cd ../../..

generateJSON "$FILES" > $TARGET_DIRECTORY.json
