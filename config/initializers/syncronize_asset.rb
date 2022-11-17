Rails.application.config.after_initialize do
  Asset::Synchronize::run('VALE3.SA')
end