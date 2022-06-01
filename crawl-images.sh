#!/bin/bash

cd html/images

if [ ! -d "ironclad" ]; then
    mkdir -p ironclad
    cd ironclad

    curl https://slay-the-spire.fandom.com/wiki/Ironclad_Cards | grep 'class="image"' | sed -E 's/.*a href="([^"]+).*/\1/g' | xargs -L1 curl -OJ

    cd ..
fi

if [ ! -d "silent" ]; then
    mkdir -p silent
    cd silent

    curl https://slay-the-spire.fandom.com/wiki/Silent_Cards | grep 'class="image"' | sed -E 's/.*a href="([^"]+).*/\1/g' | xargs -L1 curl -OJ

    cd ..
fi

if [ ! -d "defect" ]; then
    mkdir -p defect
    cd defect

    curl https://slay-the-spire.fandom.com/wiki/Defect_Cards | grep 'class="image"' | sed -E 's/.*a href="([^"]+).*/\1/g' | xargs -L1 curl -OJ

    cd ..
fi

if [ ! -d "watcher" ]; then
    mkdir -p watcher
    cd watcher

    curl https://slay-the-spire.fandom.com/wiki/Watcher_Cards | grep 'class="image"' | sed -E 's/.*a href="([^"]+).*/\1/g' | xargs -L1 curl -OJ

    cd ..
fi

if [ ! -d "relics" ]; then
    mkdir -p relics
    cd relics

    curl https://slay-the-spire.fandom.com/wiki/Relics | grep -e '<span class="relic-tooltip".\+<img' | sed -E 's/.* data-src="([^"]+)".*/\1/g' | sed -E 's/scale-to-width-down\/[0-9]+//g' | xargs -L1 curl -OJ

    cd ..
fi
if [ ! -d "colorless" ]; then
    mkdir -p colorless
    cd colorless

    curl https://slay-the-spire.fandom.com/wiki/Colorless_Cards | grep 'class="image"' | sed -E 's/.*a href="([^"]+).*/\1/g' | xargs -L1 curl -OJ

    cd ..
fi