# frozen_string_literal: true

# base data processor
class BaseDataProcessor
  attr_reader :data, :format, :date_indexes, :data_splitter

  def initialize(data, format)
    @data = data
    @format = format
  end

  def process
    assign_date_indexes
    assign_data_splitter
    lines = data.lines
    attrs = lines.shift.strip.split(data_splitter)

    processed_result(lines, attrs)
  end

  private

  def processed_result(lines, attrs)
    processed_data = []
    lines.each do |line|
      row = {}
      line.strip.split(data_splitter).each_with_index do |value, i|
        value = processed_birth_date(value) if attrs[i] == 'birthdate'
        row[attrs[i]] = value
      end
      processed_data.push(row)
    end
    processed_data
  end

  def processed_birth_date(date)
    date = date.split('-')
    "#{date[date_indexes[:month]].to_i}/#{date[date_indexes[:day]].to_i}" \
      "/#{date[date_indexes[:year]].to_i}"
  end

  def assign_date_indexes
    @date_indexes = {}
    @date_indexes[:month] = 1
    if dollar_format?
      @date_indexes[:day] = 0
      @date_indexes[:year] = 2
    else
      @date_indexes[:day] = 2
      @date_indexes[:year] = 0
    end
  end

  def assign_data_splitter
    @data_splitter = dollar_format? ? ' $ ' : ' % '
  end

  def dollar_format?
    format == 'dollar'
  end
end
