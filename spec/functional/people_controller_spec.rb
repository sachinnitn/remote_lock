# frozen_string_literal: true

# base controller test file
require 'spec_helper'

RSpec.describe '#normalize' do
  describe 'dollar and percent formats sorted by first_name' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name
      }
    end
    subject { PeopleController.new(params).normalize }

    it 'parses input files and outputs normalized data' do
      expect(subject).to eq [
        'Elliot, New York City, 5/4/1947',
        'Mckayla, Atlanta, 5/29/1986',
        'Rhiannon, LA, 4/30/1974',
        'Rigoberto, NYC, 1/5/1962'
      ]
    end
  end
end
