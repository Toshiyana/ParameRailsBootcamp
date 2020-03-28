#!/bin/bash

# src以下のrubyのコードを全て実行する
for file in ./src/*.ruby; do
  ruby $file
done

echo
echo "FINISH all_exec.bash"
echo
