# Task -> Update db with CSV data from external filesystem

=begin

Import data from external service  ____
              |                         \
              |                   server timed out
              v                          |
          Parse CSV ___________________  |
              |                         \|
              |                   malformed CSV/unsupported encoding
              v                          |
    Update database records ___________  |
              |                         \|
              |                   validation error
              v                          v
           success                    failure
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




# Refactored Imperative (non functional) way

content = import_file_conetnt_from_s3
return unless success?

csv = csv_parse(context)
return unless success?

csv.each do |row|
  update_database_record
  return unless success?
end

# We can extract the operation-flow logic itself and reuse it...
