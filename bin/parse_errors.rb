#! /usr/bin/env ruby

require 'nokogiri'

@doc = Nokogiri::XML(File.open('./errors.xml'))

issues = @doc.xpath('/report/incident/systemID')

counter = 0

issues.to_a.each do |issue|
  if issue.text.include? 'iso19139.xml'
    puts issue.text.gsub(/\/Users\/wsg4w\/projects\//,'')
    counter += 1
  end
end

puts "\n Total issues: #{counter}"
