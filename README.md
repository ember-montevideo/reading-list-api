# Reading list API

Simple API to use on
[reading-list](https://github.com/ember-montevideo/reading-list) application.

## Installation

You need Ruby 2.2.2 or higher.

```sh
$ git clone https://github.com/ember-montevideo/reading-list-api
$ cd reading-list-api/
$ bundle install
$ bundle exec rackup -p 3000 -s thin
```

The web server will be available on http://localhost:3000/

You can also use [`foreman`](https://github.com/theforeman/foreman) to load the
server, just run

```sh
$ foreman start --port 3000
```

## API

The following is a description of the methods exposed by the API

### GET /api/v1/books

Response:

```json
{
  "books": [
    {
      "id": "1",
      "title": "Microserfs",
      "publicationDate": "1995",
      "author": "Douglas Coupland",
      "shelves": ["next"]
    },
    {
      "id": "2",
      "title": "Do Androids Dream of Electric Sheep?",
      "publicationDate": "1968",
      "author": "Philip K. Dick",
      "shelves": ["next"]
    }
  ]
}
```

### POST /api/v1/books

Request body:

```json
{
  "book": {
    "id": "123",
    "title": "Microserfs",
    "publicationDate": "1995",
    "author": "Douglas Coupland",
    "shelves": ["next"]
  }
}
```

Note that at this moment the client has to send the desired `id`. This is going
to change in the future.

Response:

```json
{
  "book": {
    "id": "123",
    "title": "Microserfs",
    "publicationDate": "1995",
    "author": "Douglas Coupland",
    "shelves": ["next"]
  }
}
```

### GET /api/v1/books/123

Response:

```json
{
  "book": {
    "id": "123",
    "title": "Microserfs",
    "publicationDate": "1995",
    "author": "Douglas Coupland",
    "shelves": ["next"]
  }
}
```

Note that if the book doesn't exist the server responds an HTTP 404 status code.

### DELETE /api/v1/books/123

Response:

```json
{ }
```

## License

reading-list-api is licensed under the MIT license.

See [LICENSE](./LICENSE) for the full license text.
