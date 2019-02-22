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
  section_current = $line.strip
  section_in = true
elsif $line.match(%r{^[A-Z]})
  section_in = false
else
  sections[section_current] << $line if section_in
end

END {
  require 'yaml'

  def url_key(url)
    url.gsub(%r{(_((mobile)|(fullhd)|(hq)))?\.mp[34]$}, '')
  end

  links_data = sections.delete("References")
  sections["conversation"] = sections.delete("(BUTTON) Pop-out player")
  links_cnts = {}
  sections["links"] = links_data.select{|l|
    l.match(%r{mp[34](\?download=1)?$})
  }.map{|t|
    t.strip.split(" ").last.gsub("?download=1", "")
  }.sort.uniq.select{|l|
    if l.match(%r{mp[34]$})
      key = url_key(l)
      links_cnts[key] ||= 0
      links_cnts[key] += 1
      true
    else
      false
    end
  }.map{|t|
    key = url_key(t)
    if links_cnts[key] == 1
      t
    else
      t.match("_hq\.mp[34]") ? t : "# #{t}"
    end
  }
  sections.each do |key, data|
    file_name = File.join(ENV["D_LESSON"], "#{key.downcase.gsub(" ", "_")}.txt")
    STDERR.puts ":: Writting new file #{file_name}"
    File.open(file_name, "w") do |f|
      f.puts data
    end
  end
}
