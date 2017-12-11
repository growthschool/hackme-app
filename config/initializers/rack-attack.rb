class Rack::Attack
  throttle('req/ip', limit: 180, period: 1.minutes, &:ip)

  ### Prevent Brute-Force Login Attacks ###
  # The most common brute-force login attack is a brute-force password
  # attack where an attacker simply tries a larg number of emails and
  # password to see if any credentials match.
  #
  # Another common method of attack is to use a swarm of computers with
  # different IPs to try brute-forcing a password for a specific account.
  #
  # Throttle POST request to /login by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:login/ip:#{req.ip}"
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == '/users/sign_in' && req.post?
  end

  # Throttle POST requests to /login by email param
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:logins/email:#{req.email}"
  #
  # Note: This creates a problem where a malicious user could intentionally
  # throttle logins for another user and force their login requests to be
  # denied, but that's not very common and shouldn't happen to you. (Knock
  # on wood!)
  throttle('logins/email', limit: 5, peirod: 20.seconds) do |req|
    req.params['email'].presence if req.path == '/users/sing_in' && req.post?
  end
end
