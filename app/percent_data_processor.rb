# frozen_string_literal: true

# processor for percent format data
class PercentDataProcessor
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    BaseDataProcessor.new(data, 'percent').process
  end
end
