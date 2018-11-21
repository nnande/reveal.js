# Task -> Update db with CSV data from external filesystem

=begin

Import data from external service
              |
              |                   server timed out
              v
          Parse CSV
              |
              |                   malformed CSV/unsupported encoding
              v
    Update database records
              |
              |                   validation error
              v
           success
=end



def import_file_content_from_s3
  AWS::S3.new.buckets['csv_data_feed'].objects['csv.csv'].read
end

def csv_parse(content)
  CSV.parse(content, headers: true)
end

def update_database_record(row)
  Price.find(row[:price_id]).update(amount: row[:amount])
end




begin
  content = import_file_conetnt_from_s3
rescue Timeout::Error => e
  puts 'Could not import file from s3'
  exit
end

begin
  csv = csv_parse(context)
rescue CSV::MalformedCSVError =>
  puts 'Could not parse CSV - malformed'
  exit
end

csv.each do |row|
  next if update_database_record
  puts 'Validation failed for Price with id: #' + row[:id]
  exit
end





# 2x more code (error handling = half of the code...)
# Can we refactor it somehow to be cleaner?
