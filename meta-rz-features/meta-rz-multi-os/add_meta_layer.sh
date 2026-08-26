#!/bin/bash

echo "Available layers:"
layers=$(find ../meta-rz-features -type d -name 'meta-*' -exec sh -c 'test $(find "{}" -mindepth 1 -maxdepth 1 -type d -name "meta-*" | wc -l) -eq 0 && basename "{}"' \;)

PS3="Enter the number of the layer you want to add: "
select layer_name in $layers; do
  if [ -n "$layer_name" ]; then
    echo "You have selected: $layer_name"
    layer_path=$(find ../meta-rz-features -type d -name "$layer_name")
    if bitbake-layers add-layer "$layer_path"; then
      echo "Layer $layer_name has been added successfully."
    else
      echo "Failed to add layer $layer_name."
    fi
    break
  else
    echo "Invalid selection. Please try again."
  fi
done
