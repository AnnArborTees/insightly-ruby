require 'insightly2/dsl'

module Insightly2
  module DSL::Users
    # GET /v2.1/Users/{id}
    # Get a user.
    # @param [String, Fixnum] id A user's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::User, nil].
    def get_user(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::User.parse(request(:get, "Users/#{id}"))
    end

    # GET /v2.1/Users
    # Get a list of users.
    # @return [Array, nil]
    def get_users(query = nil)
      if query.nil?
        url = "Users"
      else
        url = Utils::UrlHelper.build_url(
          path: "Users", params: query
        )
      end
      Resources::User.parse(request(:get, url))
    end
  end
end
