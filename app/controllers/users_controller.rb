class UsersController < ApplicationController
    # Get requests to /users/:id
    def show
        @user = User.find(params[:id])
    end
end