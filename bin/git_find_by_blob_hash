#!/bin/sh

obj_hash=$1

# go over all trees
git log --pretty=format:'%T %h %s' \
| while read tree commit subject ; do
     git ls-tree -r $tree | grep  "$obj_hash" \
     | while read a b hash filename ; do
        if [ "$hash" == "$obj_hash" ]; then
          f=$filename
          echo $f
          break
        fi
        if $f ; then break; fi
      done
      if $f; then break; fi
done