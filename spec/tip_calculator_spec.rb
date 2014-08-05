require 'rspec'
require_relative '../lib/tip_calculator'

describe TipCalculator do
  it 'can return servers and their tips for a given date' do
    sales_data = './spec/fixtures/test_sales_data.json'
    staff_data = './spec/fixtures/test_staff_data.json'

    expected = {
      "Ila Nikolaus" => "$8.00",
      "Cierra Johnson" => "$6.00"
    }

    tip_calculator = TipCalculator.new(sales_data, staff_data)

    expect(tip_calculator.tips_for_date('2014-05-11')).to eq expected
  end
end
