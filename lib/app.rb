require "roda"

BOOKS = [
  {
    "id": 1,
    "OCLC": 35022004,
    "title": "Microserfs",
    "publicationDate": "1995",
    "author": "Douglas Coupland",
    "shelves": ["next"]
  },
  {
    "id": 2,
    "OCLC": 34818133,
    "title": "Do Androids Dream of Electric Sheep?",
    "publicationDate": "1968",
    "author": "Philip K. Dick",
    "shelves": ["next"]
  },
  {
    "id": 3,
    "OCLC": 67871286,
    "title": "Ubik",
    "publicationDate": "1969",
    "author": "Philip K. Dick",
    "shelves": ["next", "buy"]
  },
  {
    "id": 4,
    "OCLC": 47677622,
    "title": "Lord of the Flies",
    "publicationDate": "1955",
    "author": "William Golding",
    "shelves": ["next"]
  },
  {
    "id": 5,
    "OCLC": 19811474,
    "title": "I, Claudius",
    "publicationDate": "1934",
    "author": "Robert Graves",
    "shelves": ["history"]
  },
  {
    "id": 6,
    "LCCN": 60007847,
    "title": "To Kill a Mockingbird",
    "publicationDate": "1960",
    "author": "Harper Lee",
    "shelves": ["next"]
  },
  {
    "id": 7,
    "OCLC": 7956273,
    "title": "All the King’s Men",
    "publicationDate": "1946",
    "author": "Robert Penn Warren",
    "shelves": ["next"]
  }
];

class App < Roda
  plugin :all_verbs
  plugin :json
  plugin :not_found do
    "Not Found"
  end

  def parse(input)
    data = input.gets; input.rewind

    JSON.parse(data)
  end

  route do |r|
    r.on "api/v1" do
      r.on "books" do
        r.is do
          r.get do
            { books: BOOKS }
          end

          r.post do
            BOOKS << parse(request.body)["book"]

            BOOKS[-1]
          end
        end
      end
    end
  end
end
