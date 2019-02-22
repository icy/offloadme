#!/usr/bin/env bash

# Author  : Ky-Anh Huynh
# License : MIT
# Purpose : Store VOA english lessons locally

: require bash4 lynx ruby wget linux

self.voa.english.lesson.save() {
  local _url="$1"
  lesson="$(dirname "$_url")"
  lesson="$(basename "$lesson")"

  D_LESSON="output/voa.english/$lesson/"
  mkdir -pv "$D_LESSON"

  export LANG=UTF-8

  lynx \
    -assume-charset=UTF-8 \
    -assume_unrec_charset=UTF-8 \
    -display_charset=UTF-8 \
    -dump "$1" \
  | D_LESSON="$D_LESSON" \
    ruby -n \
      "$(dirname "${BASH_SOURCE[0]:-.}")/${FUNCNAME[0]}.rb"

  (
    cd "$D_LESSON" || exit 1
    echo "# Lesson URL: $1" >> links.txt
    wget -c $(grep -v '^#' links.txt)
  )
}

self.test() {
  self.voa.english.lesson.save "$@"
}

"${@:-:}"
