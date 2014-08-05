require '../lib/tip_calculator'
require 'pp'

calc = TipCalculator.new('../data/sales.json', '../data/staff.json')

pp calc.tips_for_date("2014-05-11")