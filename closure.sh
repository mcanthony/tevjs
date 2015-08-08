#!/bin/sh

if [ ! -f compiler.jar ]; then
    echo "Closure compiler not found, downloading..."
    curl https://dl.google.com/closure-compiler/compiler-latest.tar.gz | gunzip | tar xvf - compiler.jar
    if [ $? -ne 0 ]; then
        echo -e "\e[31m\e[1m[FATAL]\e[39m Could not download/extract compiler.jar\e[0m"
        exit 1
    fi
fi

if [ ! -f build/app.js ]; then
    echo "app.js not built, building.."
    NODE_ENV=production webpack --progress --colors --display-error-details -p --optimize-dedupe
    if [ $? -ne 0 ]; then
        echo -e "\e[31m\e[1m[FATAL]\e[39m Could not build app.js\e[0m"
        exit 1
    fi
fi

mv build/app.js build/app.old
java -jar compiler.jar --js build/app.old --js_output_file build/app.js --language_in ECMASCRIPT5
rm build/app.old