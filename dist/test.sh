#!/usr/bin/env bash

uidandimg=$(curl -Ls https://raw.githubusercontent.com/Discord-Custom-Covers/usrbg/master/dist/usrbg.json | jq -r '.[] | "\(.img) \(.uid)"')

rm -f usrbgnew.css

while IFS=' ' read -r img uid; do
	echo ".id-$uid{--u:url('$img')}" >> usrbgnew.css
done <<<$(echo "$uidandimg")
