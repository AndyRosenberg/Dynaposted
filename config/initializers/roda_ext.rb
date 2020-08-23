class Roda
  def self.render_plugins
    plugin :render, escape: true
    plugin :sessions, secret: ENV["SESSION_SECRET"]
    plugin :route_csrf
    plugin :public
    plugin :flash
  end

  def api_only(r)
    r.redirect "/" unless r.env["HTTP_ACCEPT"] == "application/json"
  end

  def render_json(json)
    response.headers['Content-Type'] = 'application/json'
    response.write(json)
  end

  def render_unprocessable
    response.status = 422
    render_json({}.to_json)
  end
end