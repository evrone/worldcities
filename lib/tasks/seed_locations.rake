require 'open-uri'
require 'tempfile'
require 'zlib'
namespace :db do
  namespace :seed do
    task locations: :environment do
      def copy_csv_to_pg(filename)
        # this requires PG gem 0.17+
        dbconn = ActiveRecord::Base.connection_pool.checkout
        raw_connection  = dbconn.raw_connection
        copy_sql = 'copy locations(id, country_id, region_id, name, map_name, lat, lon) from STDIN with CSV'
        result = raw_connection.copy_data(copy_sql) do
          File.open(filename, 'r').each do |line|
            raw_connection.put_copy_data line
          end
        end
        ActiveRecord::Base.connection_pool.checkin(dbconn)
        result
      end

      def download_csv_from_s3
        puts 'Downloading gzipped locations file from S3...'
        # replace with real locations.csv.gz url
        gz_file = open('http://s3.amazonaws.com/locations.csv.gz')
        puts 'Uncompressing locations file...'
        csv_file = Tempfile.new('fivesearch_locations')
        Zlib::GzipReader.open(gz_file.path) do |gz|
          File.open(csv_file.path, 'w') do |csv|
            csv.write(gz.read)
          end
        end
        csv_file.path
      end

      puts 'You are about to download and insert 3+ million location records into your DB.'
      puts 'This might take up to 10 minutes so be patient.'
      csv_file_path = download_csv_from_s3
      puts 'Loading data into Postgresql DB...'
      copy_csv_to_pg(csv_file_path)
      puts 'Done'
    end
  end
end
