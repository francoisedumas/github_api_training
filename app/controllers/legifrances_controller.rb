class LegifrancesController < ApplicationController
  def connection
    # TOKEN for API call
    url_api = "https://sandbox-api.piste.gouv.fr/dila/legifrance-beta/lf-engine-app/consult/getCnilWithAncienId"
    response = HTTParty.post(url_api, headers: headers_api, body: body_api.to_json)
    @response = response["text"]["texte"]
  end

  private

  # attention: pour activer le cache, lancer "rails dev:cache" dans le terminal
  def headers_api
    @session_token ||= Rails.cache.fetch("Authorization", expires_in: 1.hours) do
      get_token
    end
    {
      "accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer #{@session_token}"
    }
  end

  def body_api
    { "ancienId": "MCN97020008A" }
  end

  def get_token
    url_token = "https://sandbox-oauth.piste.gouv.fr/api/oauth/token"
    oauth_response = HTTParty.post(url_token, headers: headers_token, body: body_token)
    oauth_response.parsed_response["access_token"]
  end

  def body_token
    {
      "grant_type": "client_credentials",
      "client_id": ENV['CLIENT_ID'],
      "client_secret": ENV['CLIENT_SECRET'],
      "scope": "openid"
    }
  end

  def headers_token
    {
      "Content-Type": "application/x-www-form-urlencoded"
    }
  end
end
