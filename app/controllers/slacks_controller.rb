class SlacksController < ApplicationController
  def folders
    # Carefull the token to provide is a bot token and not a verification token
    # Go to your app's setting page, then go to Install App and copy the Bot User OAuth Access Token from there

    client = RestClient.get "https://slack.com/api/team.info", { Authorization: "Bearer #{ENV['SLACK_TOKEN']}" }
    team_id = JSON.parse(client)["team"]["id"]

    client = RestClient.get "https://slack.com/api/conversations.list", { Authorization: "Bearer #{ENV['SLACK_TOKEN']}" }
    response = JSON.parse(client).dig("channels")
    general_channel_id = response.find { |channel| channel["name"] == "general" }["id"]
    @my_channels = response.map { |channel| channel["name"] }

    client = RestClient.get "https://slack.com/api/users.list", { Authorization: "Bearer #{ENV['SLACK_TOKEN']}" }
    @members = JSON.parse(client).dig("members").map { |member| member["name"] }

    # Add / remove user need a paid plan
    # https://api.slack.com/methods/admin.users.invite
    # https://api.slack.com/methods/admin.users.remove
    # client = RestClient.post "https://slack.com/api/admin.users.invite",
    #           {
    #             channel_id: general_channel_id,
    #             team_id: team_id,
    #             email: "exp@test.com"
    #           },
    #           { Authorization: "Bearer #{ENV['SLACK_ENTERPRISE_TOKEN']}" }

  end
end
