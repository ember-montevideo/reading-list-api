require "roda"

BOOKS = [
  {
    id: 1,
    title: "Microserfs",
    publicationDate: "1995",
    author: "Douglas Coupland",
    shelves: ["next"]
  },
  {
    id: 2,
    title: "Do Androids Dream of Electric Sheep?",
    publicationDate: "1968",
    author: "Philip K. Dick",
    shelves: ["next"]
  },
  {
    id: 3,
    title: "Ubik",
    publicationDate: "1969",
    author: "Philip K. Dick",
    shelves: ["next", "buy"]
  },
  {
    id: 4,
    title: "Lord of the Flies",
    publicationDate: "1955",
    author: "William Golding",
    shelves: ["next"]
  },
  {
    id: 5,
    title: "I, Claudius",
    publicationDate: "1934",
    author: "Robert Graves",
    shelves: ["history"]
  },
  {
    id: 6,
    title: "To Kill a Mockingbird",
    publicationDate: "1960",
    author: "Harper Lee",
    shelves: ["next"]
  },
  {
    id: 7,
    title: "All the King’s Men",
    publicationDate: "1946",
    author: "Robert Penn Warren",
    shelves: ["next"]
  }
];

class App < Roda
  plugin :all_verbs
  plugin :json
  plugin :halt

  plugin :not_found do
    "Not Found"
  end

  def parse(input)
    data = JSON.parse(input.gets); input.rewind
    book = data["book"]

    {
      id: book["id"],
      title: book["title"],
      publicationDate: book["publicationDate"],
      author: book["author"],
      shelves: book["shelves"]
    }
  end

  route do |r|
    r.on "api/v1" do
      r.on "books" do
        r.is do
          r.get do
            { books: BOOKS }
          end

          r.post do
            BOOKS << parse(request.body)

            { book: BOOKS[-1] }
          end
        end

        r.on :book_id do |book_id|
          book = BOOKS.find { |other| other[:id].to_s == book_id.to_s }

          r.halt(404, 'Book not found') unless book

          r.get do
            { book: book }
          end

          r.put do
            # to do
          end

          r.delete do
            BOOKS.delete_if { |other| other == book }

            {}
          end
        end
      end
    end
  end
end
