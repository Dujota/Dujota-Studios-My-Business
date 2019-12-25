module Mutations
  class SignInMutation < Mutations::BaseMutation
    graphql_name "SignIn"
    # always need arguments for a mutation and defined here at the top
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true

    def resolve(email:, password:)
    end
  end
end
