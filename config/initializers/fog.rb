# if Rails.env.test? 
#   CarrierWave.configure do |config|
#     config.storage = :file
#     config.enable_processing = false
#   end
# else
#   CarrierWave.configure do |config|
#     config.storage = :fog
#     config.fog_credentials = {
#       :provider               => 'AWS',                         # required
#       :aws_access_key_id      => 'AKIAIPHPRT75NDJ7U6LA',# required
#       :aws_secret_access_key  => 'YQAL0xK1nh5Swbc6jtHbd2v/a5P6g+BLk89ek4yX',# required
#       #:region                 => 'us-west-2'
#       #:host                   => 's3.example.com',             # optional, defaults to nil
#       #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
#     }
#     config.fog_directory  = 'desafiopruebalatam'                         # required
#     config.fog_public     = false                                        # optional, defaults to true
#     config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
#     config.fog_authenticated_url_expiration = 60000 # 1000 minutes 
#   end
# end