  <h1>Movie Posters</h1>
  <% movies_with_poster = @search.movies[0..20].select! { |movie| movie.poster != nil} %>
  <% movies_with_poster[0..8].each do |movie|%>
    <img src = "<%= movie.poster%>">
  <%end%>