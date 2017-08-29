class Rack::Attack

  throttle('req/ip', :limit => 180, :period => 1.minute) do |req|
    req.ip
  end

  throttle('logins/ip', :limit => 5, :period => 20.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.ip
    end
  end

  throttle('logins/email', :limit => 5, :period => 20.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.params['email'].presence
    end
  end
end
