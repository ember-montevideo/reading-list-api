require "spec_helper"

describe "GET /api/v1/books" do
  it "returns all books" do
    get "/api/v1/books"

    assert last_response.ok?
  end
end
