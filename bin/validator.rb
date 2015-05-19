require 'nokogiri'
file_counter = 0
error_counter = 0
Dir.glob("./**/iso19139.xml").each do |xml|
  file_counter += 1
  begin
    doc = Nokogiri::XML(File.open(xml)) { |config| config.strict }
  rescue Nokogiri::XML::SyntaxError => e
    error_counter += 1
    puts "#{xml} didn't pass"
    puts e
  end
end

puts "Total files: #{file_counter}"
puts "Error files: #{error_counter}"
puts "Ratio: #{error_counter.to_f/file_counter}"
