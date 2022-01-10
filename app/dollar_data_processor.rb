# frozen_string_literal: true

# processor for dollar format data
class DollarDataProcessor
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    BaseDataProcessor.new(data, 'dollar').process
  end
end
