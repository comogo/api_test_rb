class AuthMiddleware
  def initialize(app)
    @app = app
    @secret_token = ENV['SECRET_TOKEN']
  end

  def call(env)
    token = env['HTTP_X_STORE_TOKEN']

    if token == @secret_token
      @app.call(env)
    else
      [401, {'Content-Type' => "application/json"}, ["Unauthorized"]]
    end
  end
end
