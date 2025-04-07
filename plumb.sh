#!/usr/bin/env sh

# Inspired by Luke Smiths video about plumbing scripts, he never released the source. 
# Find more great stuff by him at lukesmith.xyz

prim="$(xclip -o -selection primary 2>/dev/null || xclip -o -selection clipboard 2>/dev/null)"
[ -z "$prim" ] && exit

websearch() { firefox "https://duckduckgo.com/?q=$1"; }
wikipedia() { firefox "https://en.wikipedia.org/wiki/Special:Search?search=$1"; }
wiktionary() { firefox "https://en.wiktionary.org/wiki/Special:Search?search=$1"; }
ebay() { firefox "https://www.ebay.com/sch/$1"; }
archpkg() { firefox "https://archlinux.org/packages/?q=$1"; firefox "https://aur.archlinux.org/packages?K=$1"; }

func=$(printf "websearch\nwikipedia\nwiktionary\nebay\narchpkg" | dmenu -p "Plumb $prim to?" -i -l 10)

case "$func" in
  websearch) websearch "$prim" ;;
  wikipedia) wikipedia "$prim" ;;
  wiktionary) wiktionary "$prim" ;;
  ebay) ebay "$prim" ;;
  archpkg) archpkg "$prim" ;;
esac
