module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts,
          [Types::PostType],
          null: false,
          description: "Returns a list of all Blog Posts in the app"

    def posts
      Post.all
    end
  end
end
