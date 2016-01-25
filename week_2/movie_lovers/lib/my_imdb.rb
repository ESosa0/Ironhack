class MyImdb
  def search(keyword)
    @search = Imdb::Search.new(keyword)
  end
  def find_movies_with_poster
    movies_with_poster = @search.movies[0..20].select { |movie| movie.poster != nil} 
    return movies_with_poster[0..8]
  end
  def check_from_90s(id)
    movie = Imdb::Movie.new(id)
    if movie.year >= 1990 && movie.year <= 1999 
      true
    end
  end
end
