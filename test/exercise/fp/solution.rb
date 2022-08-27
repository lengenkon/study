require 'csv'
module Exercise
  module Fp
    class << self
      def film_with_several_countries_and_with_rating_kinopoisk?(film)
        (film['country'].to_s.include? ',') && (film['rating_kinopoisk'].to_s != '0' && !film['rating_kinopoisk'].nil?)
      end

      def rating(array)
        selected_films = array.select { |item| film_with_several_countries_and_with_rating_kinopoisk?(item) }
        selected_films.reduce(0) do |count, item|
          count + item['rating_kinopoisk'].to_f
        end / selected_films.size
      end

      def chars_count(array, threshold)
        films_with_rating_more_thershold = array.select { |item| item if item['rating_kinopoisk'].to_f >= threshold }
        films_with_rating_more_thershold.reduce(0) { |sum, item| sum + item['name'].count('и') }
      end
    end
  end
end
