#!/bin/bash

# Find .uproject file in the current directory
uproject_file=$(find "$(pwd)" -maxdepth 1 -type f -name "*.uproject")

# Check if .uproject file exists
if [[ -z $uproject_file ]]; then
    echo "Error: No .uproject file found in the current directory."
    exit 1
fi

echo "Found .uproject file: $uproject_file"

curr_dir="$pwd";
unreal_dir="$HOME/Documents/ue/UnrealEngine/Engine/Build/BatchFiles";

cd "$unreal_dir";
./RunUBT.sh -ProjectFiles -Project="$uproject_file" -Game -Rocket -Progress -Engine -VSCode;
cd "$curr_dir";
