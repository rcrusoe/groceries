RECIPE_NOTIFIER = Slack::Notifier.new ENV["SLACK_HOOK"] do
  defaults channel: "#recidex",
           username: "Recidex"
end
