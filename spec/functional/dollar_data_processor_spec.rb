# frozen_string_literal: true

# dollar data test file
require 'spec_helper'

RSpec.describe '#process' do
  describe 'dollar format processed data' do
    let(:dollar_data) { File.read('spec/fixtures/people_by_dollar.txt') }
    subject { DollarDataProcessor.new(dollar_data).process }
    let(:formatted_data) do
      [{ 'city' => 'LA', 'birthdate' => '4/30/1974',
         'last_name' => 'Nolan', 'first_name' => 'Rhiannon' },
       { 'city' => 'NYC', 'birthdate' => '1/5/1962',
         'last_name' => 'Bruen', 'first_name' => 'Rigoberto' }]
    end

    it 'parses dollar file and returns formatted data' do
      expect(subject).to eq formatted_data
    end
  end
end
