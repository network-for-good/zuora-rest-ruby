module Zuora
  class HttpClient
    include HTTParty

    def self.bearer_token
      @bearer_token ||= get_bearer_token
    end

    def self.replace_bearer_token
      @bearer_token = get_bearer_token
    end

    def self.get_bearer_token
      attempts ||= 0
      response = Zuora::OauthToken.create(client_id: Zuora.client_id, client_secret: Zuora.client_secret, grant_type: 'client_credentials')
      response["access_token"]
    rescue Exception => e
      sleep (attempts += 1)
      retry if attempts <= 2
    end

    def self.set_authorization_header
      headers "Authorization" => "Bearer #{ bearer_token }"
    end

    def self.set_minor_version
      return unless Zuora.minor_version.present?

      headers StringDisableCapitalize.new("Zuora-version") => Zuora.minor_version
    end

    format  :json
    headers "Accept" => "application/json"
    headers "Content-Type" => "application/json"
  end
end

class StringDisableCapitalize < String
  def capitalize
    self
  end

  def to_s
    self
  end

  alias_method :to_str, :to_s
end