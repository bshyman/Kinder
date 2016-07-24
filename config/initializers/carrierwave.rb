CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWSACCESSKEYID'],
    :aws_secret_access_key  => ENV['AWSSECRETKEY'],
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'kinderprofilepics'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end

