require 'csv'
require 'json'

@headers = []
file = File.open('main.json')
JSON.parse(main.read).each do |h|
  h.keys.each do |key|
    @headers << key
  end
end

uniq_headers = @headers.uniq
file = File.open('file.json')
finalrow = []

JSON.parse(file.read).each do |h|
  final = {}
  @headers.each do |key2|
    final[key2] = h[key2]
  end

  finalrow << final
end

CSV.open('output.csv' , 'w') do |csv|
  csv << uniq_headers
  finalrow.each do |deal|
    csv << deal.values
  end
end
