#!/bin/bash

if [ -z "$1" ]; then
    echo
    echo "Please give the title for the new posts"
    echo "example:"
    echo "   ./write_new_post \"Edgecore Toolman\" "
    echo 
else
  hexo new $1
fi
