# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Movies サンプルデータ
movies_data = [
  { id: 1, name: 'インターステラー', year: '2014', description: '宇宙を舞台にしたSF映画',
    image_url: 'https://example.com/interstellar.jpg', is_showing: true },
  { id: 2, name: 'タイタニック', year: '1997', description: '豪華客船の悲劇を描いた作品', image_url: 'https://example.com/titanic.jpg',
    is_showing: false },
  { id: 3, name: 'インセプション', year: '2010', description: '夢の中に侵入する映画', image_url: 'https://example.com/inception.jpg', is_showing: true }
]

movies_data.each do |data|
  Movie.find_or_create_by!(id: data[:id]) do |movie|
    movie.name = data[:name]
    movie.year = data[:year]
    movie.description = data[:description]
    movie.image_url = data[:image_url]
    movie.is_showing = data[:is_showing]
  end
end

# Sheets マスターデータ
sheets_data = [
  { id: 1, column: 1, row: 'a' },
  { id: 2, column: 2, row: 'a' },
  { id: 3, column: 3, row: 'a' },
  { id: 4, column: 4, row: 'a' },
  { id: 5, column: 5, row: 'a' },
  { id: 6, column: 1, row: 'b' },
  { id: 7, column: 2, row: 'b' },
  { id: 8, column: 3, row: 'b' },
  { id: 9, column: 4, row: 'b' },
  { id: 10, column: 5, row: 'b' },
  { id: 11, column: 1, row: 'c' },
  { id: 12, column: 2, row: 'c' },
  { id: 13, column: 3, row: 'c' },
  { id: 14, column: 4, row: 'c' },
  { id: 15, column: 5, row: 'c' }
]

sheets_data.each do |data|
  Sheet.find_or_create_by!(id: data[:id]) do |sheet|
    sheet.column = data[:column]
    sheet.row = data[:row]
  end
end

# Schedules サンプルデータ
schedules_data = [
  # インターステラー (movie_id: 1)
  { id: 1, movie_id: 1, start_time: '10:00', end_time: '12:30' },
  { id: 2, movie_id: 1, start_time: '14:00', end_time: '16:30' },
  { id: 3, movie_id: 1, start_time: '18:00', end_time: '20:30' },

  # タイタニック (movie_id: 2)
  { id: 4, movie_id: 2, start_time: '11:00', end_time: '14:00' },
  { id: 5, movie_id: 2, start_time: '15:00', end_time: '18:00' },

  # インセプション (movie_id: 3)
  { id: 6, movie_id: 3, start_time: '10:30', end_time: '12:45' },
  { id: 7, movie_id: 3, start_time: '13:30', end_time: '15:45' },
  { id: 8, movie_id: 3, start_time: '16:30', end_time: '18:45' },
  { id: 9, movie_id: 3, start_time: '19:30', end_time: '21:45' }
]

schedules_data.each do |data|
  Schedule.find_or_create_by!(id: data[:id]) do |schedule|
    schedule.movie_id = data[:movie_id]
    schedule.start_time = data[:start_time]
    schedule.end_time = data[:end_time]
  end
end

puts 'Seed data created successfully!'
puts "Movies: #{Movie.count}"
puts "Sheets: #{Sheet.count}"
puts "Schedules: #{Schedule.count}"
