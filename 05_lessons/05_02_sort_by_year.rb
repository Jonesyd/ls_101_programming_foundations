books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |each_hash|
  each_hash[:published].to_i
end
books = sorted_books

books.each { |book| p book }

# solution

# books.sort_by do |book|
#   book[:published]
# end
