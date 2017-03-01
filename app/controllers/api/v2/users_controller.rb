module Api::V2
  class UsersController < Api::ApiController
    expose_decorated(:users) do
      User.includes(:primary_role, :primary_roles, memberships: [:project, :role])
    end

    def index
      render json: users.active, each_serializer: UserSerializer, root: false
    end

    def all
      render json: users, each_serializer: UserSerializer, root: false
    end
  end
end
