module StaticPagesHelper
  def api_key
    if logged_in?
      "Your API key: `#{current_user.api_key}`."
    else
      "You need to login in order to see your API key."
    end
  end
end
