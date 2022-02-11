class SlacksController < ApplicationController
  def folders
    # Carefull the token to provide is a bot token and not a verification token
    # Go to your app's setting page, then go to Install App and copy the Bot User OAuth Access Token from there
    client = RestClient.get 'https://slack.com/api/conversations.list',
    {
      Authorization:"Bearer #{ENV["SLACK_TOKEN"]}"
    }
    @my_channels = JSON.parse(client).dig("channels").map{ |channel| channel['name'] }
  end
end
