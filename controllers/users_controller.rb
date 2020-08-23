class UsersController < Roda
  route do |r|
    r.is do
      r.post do
        user = User.create(user_params(r))
        if !user.new_record?
          session["current_user_id"] = user.id
          flash["message"] = "User has been created!"
          r.redirect("/den")
        else
          flash.now["message"] = "Something went wrong. Please try again."
          view('users/new')
        end
      end
    end

    r.get "new" do
      view('users/new')
    end

    r.on Integer do |id|
      r.get do
        # show
      end

      r.get "edit" do
        # edit
      end

      r.on "", method: ['put', 'patch'] do
        # update
      end

      r.on "", method: :delete do
        # destroy
      end
    end
  end

  private
  def user_params(r)
    r.params.slice("email", "name", "password", "time_zone")
  end
end
