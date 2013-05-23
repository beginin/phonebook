class UsersController < ApplicationController
  def index
  	@users=User.allusers
  end
end
