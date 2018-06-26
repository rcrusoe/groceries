class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def digest_email(user, liked_recipes)
    @recipient  = user
    @liked_recipes = liked_recipes
    @from =  "Recidex <chefs@recidex.com>"
    mail(
      to: @recipient,
      subject: "New recipes for you to try this week",
      from: @from
    )
  end
end
