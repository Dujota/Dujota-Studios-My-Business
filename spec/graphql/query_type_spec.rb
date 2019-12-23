require "rails_helper"

RSpec.describe Types::QueryType do
  describe "posts" do
    # Create and save at least two posts through our factory
    let!(:posts) { create_pair(:post) }

    # Setup the grapqhl query that will be executed for each context
    let(:query) do
      # %() converts whatever is inside into a string of same format
      %(query{
        posts {
          title
          body
          imageUrl
        }
      })
    end

    # Explicitly set the subject to our App's GraphQL Schema and excute it as json (exactly how we see it in the console)
    subject(:result) do
      DujotaStudiosSchema.execute(query).as_json
    end

    it "retuns a list of all posts" do
      expect(result.dig).to match_array(
        posts.map { |post| { "title": post.title, "body": post.body, "imageUrl": post.imageUrl } }
      )
    end
  end
end
