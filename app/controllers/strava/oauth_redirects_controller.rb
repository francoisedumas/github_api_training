class Strava::OauthRedirectsController < ApplicationController
  def complete_connection
    client = Strava::OAuth::Client.new(
      client_id: ENV['STRAVA_CLIENT_ID'].to_s,
      client_secret: ENV['STRAVA_SECRET_CLIENT_ID'].to_s
    )

    response = client.oauth_token(code: params[:code])

    p response # => Strava::Models::Token

    # p response.access_token # access token
    # p response.refresh_token # refresh token
    # p response.expires_at # timestamp when the access token expires

    # response.athlete # => Strava::Models::Athlete

    redirect_to dashboard_path
  end
end
