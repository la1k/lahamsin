require 'csv'

arg = ARGV[0]
if arg.nil?
  puts "Please supply search argument"
  exit 1
end

root = File.expand_path(File.dirname(__FILE__))
if ! File.exists?(File.join(root, "lahamsin.csv"))
  puts "Failed to load lahamsin.csv. Place the file in the same folder as the ruby script"
  exit 1
end

csv_text = File.read(File.join(root, "lahamsin.csv"), :encoding => 'iso-8859-1')
csv = CSV.parse(csv_text, :headers => true, :col_sep => ";")
csv.each do |row|
  if row.to_s.downcase.include? arg.encode("ISO-8859-1").to_s.downcase
    puts "#{row[0]} : #{row[1]} : #{row[2]} : #{row[3]} #{row[4]}".encode("UTF-8")
  end
end
