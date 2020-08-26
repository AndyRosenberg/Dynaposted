class UsersController < Roda
  route do |r|
    r.is do
      r.post do
        user = User.create(user_params(r))
        if !user.new_record?
          session["current_user_id"] = user.id
          flash["message"] = "User has been created!"
          r.redirect("/")
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
      r.is do
        r.get do
          # show
        end

        r.put do
          current_user_id = session["current_user_id"]
          unless current_user_id && id == current_user_id.to_i
            flash["message"] = "Unauthorized update this user."
            r.redirect("/")
          end

          user = User.find(current_user_id)
          new_attrs = user_params(r)

          if new_attrs["password"].empty?
            new_attrs.delete("password")
          else
            user.password_has_changed = true
          end

          if user.update(new_attrs)
            flash["message"] = "User has been updated!"
            r.redirect("/")
          else
            flash.now["message"] = "Something went wrong. Please try again."
            @current_user_json = user.to_json
            view('users/edit')
          end
        end
      end

      r.get "edit" do
        current_user_id = session["current_user_id"]
        unless current_user_id && id == current_user_id.to_i
          flash["message"] = "Unauthorized to view this page."
          r.redirect("/")
        end

        @current_user_json = User.find(current_user_id).to_json
        view('users/edit')
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
