# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

for i in (1..100)

  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=f46a4089bffa308ba00784825da773cf&language=en-US&page=#{i}"
  movies_pack = URI.open(url).read
  movies = JSON.parse(movies_pack)

  movies["results"].each do |movie|

    if movie["original_language"] == "en"
      new_movie = Movie.new(title: movie["original_title"], overview: movie["overview"], rating: movie["vote_average"], poster_url: movie["poster_path"])
      p new_movie.save ? new_movie[:title] : "fail"
    end

  end

end
