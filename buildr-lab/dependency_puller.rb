#!/usr/bin/env ruby

#<dependency>
#	<groupId>org.springframework</groupId>
#	<artifactId>org.springframework.orm</artifactId>
#	<version>${spring.version}</version>
#</dependency>

require 'nokogiri'

def pull_dependencies_from_file(filename)
  puts "Processing #{filename}"
  doc = Nokogiri::XML(File.read(filename))
  deps = doc.css("dependency")
  deps.each do |d|
    group_id = d.css("groupId").first.text
    artifact_id = d.css("artifactId").first.text
    version = d.css("version").first.text
    puts "#{group_id}:#{artifact_id}:jar:#{version}"
  end
end

if ARGV.length == 0
  puts "Usage: dependency_puller.rb file1 file2 ..."
else
  ARGV.each do |f|
    pull_dependencies_from_file(f)
  end
end

