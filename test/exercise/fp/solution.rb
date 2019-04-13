require 'csv'

module Exercise
  module Fp
    class << self
      def rating(films)
        count = 0
        ratings = films.map do |film| 
          countries = film["country"]&.split(pattern=",")
          countryCount = countries.nil? ? 0 : countries.length
          rating = film["rating_kinopoisk"].to_f
          
          if (rating.positive? and countryCount >= 2) 
            count += 1
            rating
          else
            0
          end
        end
       
        raitingSummary = ratings.reduce(:+)
        raitingSummary / count
      end

      def chars_count(films, threshold)
        names = films.map do |film|
          rating = film["rating_kinopoisk"].to_f
          rating >= threshold ? film["name"] : ""
        end
        
        count = names.reduce(0) { |sum, name| sum + name.count("и") }
        puts(count)
      end
    end
  end
end