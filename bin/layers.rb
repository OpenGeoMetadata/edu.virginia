#! /usr/bin/env ruby

require 'json'
require 'nokogiri'
require 'pp'

layers_hash = {}


Dir.glob('./**/iso19139.xml').each do |xml|
  doc = Nokogiri::XML(File.open(xml))
  id = doc.xpath("//gmd:fileIdentifier").text.strip
  xml[0..1] = ''
  layers_hash.merge!("#{id}": "#{xml.gsub(/\.xml/, '')}")
end

layers = JSON.parse(layers_hash.to_json)

pp layers
