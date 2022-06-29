require 'csv'
module Exercise
  module Fp
    class << self
      def rating(array)
        array1 = array.map { |item| item if item[6].to_s.include? ',' }.delete_if(&:nil?)
        array1.map! { |item| item if item[1].to_s != '0' && !item[1].nil? }.delete_if(&:nil?)
        array1.reduce(0) { |count, item| count + item[1].to_f } / array1.size
      end

      def chars_count(array, threshold)
        array1 = array.map { |item| item if item[1].to_f >= threshold }.delete_if(&:nil?)
        array1.reduce(0) { |count, item| count + item[0].count('и') }
      end
    end
  end
end
