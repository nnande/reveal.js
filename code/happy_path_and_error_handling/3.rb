# Task -> Update db with CSV data from external filesystem

=begin

Import data from external service
              |
              |
              v
          Parse CSV
              |
              |
              v
    Update database records
              |
              |
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
