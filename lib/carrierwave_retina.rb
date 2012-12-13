require "carrierwave_retina/version"
require "carrierwave_retina/optimizer"

module CarrierWaveRetina

  if defined?(Rails)
    class Engine < Rails::Engine
    end
  end

end
