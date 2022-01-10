# frozen_string_literal: true

# percent data test file
require 'spec_helper'

RSpec.describe '#process' do
  describe 'percent format processed data' do
    let(:percent_data) { File.read('spec/fixtures/people_by_percent.txt') }
    subject { PercentDataProcessor.new(percent_data).process }
    let(:formatted_data) do
      [{ 'birthdate' => '5/29/1986', 'city' => 'Atlanta',
         'first_name' => 'Mckayla' },
       { 'birthdate' => '5/4/1947', 'city' => 'New York City',
         'first_name' => 'Elliot' }]
    end

    it 'parses percent file and returns formatted data' do
      expect(subject).to eq formatted_data
    end
  end
end
