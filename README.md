## CarrierWave Retina [![Build Status](https://secure.travis-ci.org/jhnvz/carrierwave_retina.png?branch=master)](http://travis-ci.org/jhnvz/carrierwave_retina)

Automatically generates retina versions of your uploaded images

This project has been merged in https://github.com/jhnvz/retina_rails
------------

It will not be maintained anymore

Installation
------------

1. Add `gem 'carrierwave_retina'` to your Gemfile.
1. Run `bundle install`.
1. Add `//= require retina` to your Javascript manifest file (usually found at `app/assets/javascripts/application.js`).
1. Add `include CarrierWaveRetina::Optimizer` to the bottom of your uploader

```ruby
class ExampleUploader < CarrierWave::Uploader::Base

  version :small do
    process :resize_to_fill => [30, 30]
  end

  include CarrierWaveRetina::Optimizer

end
```

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Johan van Zonneveld. See LICENSE for details.