require 'csv'
module Exercise
  module Fp
    class << self
      def rating(array)
        array1 = array.map { |item| item if item['country'].to_s.include? ',' }.compact!
        array1.map! { |item| item if item['rating_kinopoisk'].to_s != '0' && !item['rating_kinopoisk'].nil? }.compact!
        array1.reduce(0) { |count, item| count + item['rating_kinopoisk'].to_f } / array1.size
      end

      def chars_count(array, threshold)
        array1 = array.map { |item| item if item['rating_kinopoisk'].to_f >= threshold }.compact!
        array1.reduce(0) { |sum, item| sum + item['name'].count('и') }
      end
    end
  end
end
