require 'csv'

module Exercise
  module Fp
    class << self
      def rating(films)
        ratings = films.map do |film| 
          next nil unless film["country"]

          countries = film["country"].split(pattern=",")
          rating = film["rating_kinopoisk"].to_f
          
          if (rating.positive? and countries.length >= 2)
            rating
          else
            nil
          end
        end
       
        ratings = ratings.compact
        raiting_summary = ratings.reduce(:+)
        raiting_summary / ratings.length
      end

      def chars_count(films, threshold)
        names = films.map do |film|
          rating = film["rating_kinopoisk"].to_f
          rating >= threshold ? film["name"] : nil
        end
        
        names = names.compact
        count = names.reduce(0) { |sum, name| sum + name.count("и") }
      end
    end
  end
end