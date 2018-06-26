namespace :emails do
  desc "send a weekly email with recommendations"
  task send_digest_email: :environment do
    liked_recipes = Recipe.joins(:likes).where(likes: {user_id: "google-oauth2|111539100317559359673"})
    user = "robinsongreig@gmail.com"
    ApplicationMailer.digest_email(user, liked_recipes).deliver
  end
end
