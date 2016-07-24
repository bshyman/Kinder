CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJFV2YNLFWDEKV2PQ',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'kinderprofilepics'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
