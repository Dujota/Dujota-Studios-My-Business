module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false

    # TODO: REMOVE THIS TESETER METHOD
    field :greeting, String, null: false

    def greeting
      # object references the user instance
      "Hello your email address is: #{object.email}"
    end
  end
end
