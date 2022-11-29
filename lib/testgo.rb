module TestGo
  def self.http_request_test
  
    url = "http://localhost:3000/api/user/sign_up"
    conn = Faraday.new(:url => url) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    payload = {
      email: "pch313_3@gmail.com",
      password: '123123',
      nickname: 'changchang'
    }

    # conn.post , conn.get
    response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = "application/json"
      req.body = payload.to_json
    end

    parsed_json = ActiveSupport::JSON.decode(response.body)

  end
end

