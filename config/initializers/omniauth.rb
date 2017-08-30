Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openredu, '8EDsR7nhbZyyVgA6wcKXHANolmiUNqC4U3le7kgQ', 'ibrgMrWexeXI3YjZBb00L4IS9uRhCfH4X1rpbJGI'

  OmniAuth.config.logger = Rails.logger
  on_failure do |env|
    [200, {}, [env['omniauth.error'].inspect]]
  end

end