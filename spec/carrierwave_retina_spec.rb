require 'spec_helper'

class AnonymousUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  version :small do
    process :resize_to_fill => [30, 30]
  end

  version :small_without_processor

  include CarrierWaveRetina::Optimizer

end

class UploaderModel

  extend CarrierWave::Mount

  attr_accessor :avatar
  attr_accessor :id

  mount_uploader :avatar, AnonymousUploader

  def initialize
    self.id = 999
  end

end

describe CarrierWaveRetina::Optimizer do

  include CarrierWave::Test::Matchers

  subject { AnonymousUploader }

  before do
    AnonymousUploader.enable_processing = true
    @uploader = AnonymousUploader.new(UploaderModel.new, :avatar)
    @uploader.store!(File.open("#{File.dirname(__FILE__)}/fixtures/images/avatar.jpeg"))
  end

  after do
    AnonymousUploader.enable_processing = false
    @uploader.remove!
  end

  context 'with processor' do

    its(:versions) { should include :small_retina }

    it { @uploader.small.should have_dimensions(30, 30) }
    it { @uploader.small_retina.should have_dimensions(60, 60) }

    it { File.basename(@uploader.small.current_path, 'jpeg').should include 'small_'}

    it { File.basename(@uploader.small_retina.current_path, 'jpeg').should include '@2x'}
    it { File.basename(@uploader.small_retina.current_path, 'jpeg').should_not include 'retina_'}

  end

  context 'without processor' do

    its(:versions) { should include :small_without_processor }
    its(:versions) { should_not include :small_without_processor_retina }

  end

end