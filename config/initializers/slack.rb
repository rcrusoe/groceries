RECIPE_NOTIFIER = Slack::Notifier.new "https://hooks.slack.com/services/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" do
  defaults channel: "#recidex",
           username: "Recidex"
end
