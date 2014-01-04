class PrijavaController < ApplicationController
  #protect_from_forgery with: :null_session
  protect_from_forgery with: :exception

  def prijavime

  end

  def newsession
    user=User.find_by(username: params[:username].downcase, password: params[:password])
    if user
      # Sign the user in and redirect to the user's show page.
      session[:user_id] = user.id
      session[:level] = user.privilegelvl
      session[:name] = user.name
      redirect_to(zahtevki_path)
    else
      # Create an error message and re-render the signin form.
      flash[:error] = 'Napačno uporabniško ime ali geslo' # Not quite right!
      render 'prijavime'

    end

  end

  def destroy_session

  end

  def odjava
  end
end
