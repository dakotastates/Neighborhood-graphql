module Mutations
  class CreateUser < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :firstName, String, required: false
    argument :lastName, String, required: false
    argument :email, String, required: false
    argument :bio, String, required: false
    argument :gender, String, required: false
    argument :occupation, String, required: false
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(firstName: nil, lastName: nil, email: nil, bio: nil, occupation: nil, gender: nil, auth_provider: nil)
      User.create!(
        firstName: firstName,
        lastName: lastName,
        bio: bio,
        occupation: occupation,
        gender: gender,
        email: email,
        username: auth_provider&.[](:credentials)&.[](:username),
        password: auth_provider&.[](:credentials)&.[](:password)
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
