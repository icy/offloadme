#!/usr/bin/env ruby
# encoding: utf-8

# Author  : Ky-Anh Huynh
# License : MIT
# Purpose : Store VOA english lessons locally

BEGIN {
  sections = {
    "New Words" => [],
    "(BUTTON) Pop-out player" => [],
    "For Teachers" => [],
    "References" => [],
  }
  section_current = ""
  section_in = false
}

$line = $_.force_encoding('UTF-8')

if sections.keys.include?($line.strip)
  if tmp = sections.keys.detect{|k| k == $line.strip}
    section_current = tmp
    section_in = true
  else
    section_in = false
  end
elsif $line.match(%r{^[A-Z]})
  section_in = false
else
  sections[section_current] << $line if section_in
end

END {
  require 'yaml'
  links_data = sections.delete("References")
  conversation = sections.delete("(BUTTON) Pop-out player")
  sections["conversation"] = conversation
  sections["links"] = links_data.select{|l|
    l.match(%r{mp[34]}) and not l.match("fullhd")
  }.map{|t|
    t.strip.split(" ").last.gsub("?download=1", "")
  }.sort.uniq
  sections.each do |key, data|
    file_name = File.join(ENV["D_LESSON"], "#{key.downcase.gsub(" ", "_")}.txt")
    File.open(file_name, "w") do |f|
      f.puts data
    end
  end
}
