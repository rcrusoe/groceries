class MealPlan < ApplicationRecord
  belongs_to :recipe

  def self.active(current_user)
    where(user_id: current_user["uid"], status: "Upcoming")
  end
end
