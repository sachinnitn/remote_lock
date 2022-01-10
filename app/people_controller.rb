# frozen_string_literal: true

# base controller for returning processed data
class PeopleController
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def normalize
    all_data = DollarDataProcessor.new(params[:dollar_format]).process +
               PercentDataProcessor.new(params[:percent_format]).process

    processed_data(all_data)
  end

  private

  def processed_data(data)
    data = data.sort_by { |people| people[params[:order].to_s] }

    data = data.map do |line|
      "#{line['first_name']}, #{line['city']}, #{line['birthdate']}"
    end
    data
  end
end
