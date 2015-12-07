class User < ActiveRecord::Base
  has_secure_password
  has_many :rs_evaluations, class_name: "ReputationSystem::Evaluation", as: :source

  has_reputation :votes, source: {reputation: :votes,
    of: :self}, aggregated_by: :sum

  def voted_for?(tutorial)
    evaluations.where(target_type: tutorial.class, target_id: tutorial.id).present?
  end

  def logged_with_facebook?
    self.facebook_id.present?
  end

  def update_facebook_info(auth)
    create_pass
    update(
        facebook_id: auth["uid"],
        first_name: auth["info"]["name"].split(' ').first,
        last_name: auth["info"]["name"].split(' ').last,
        password: @temp_pass,
        password_confirmation: @temp_pass
      )
  end

  def profile_picture
    "https://graph.facebook.com/#{self.facebook_id}/picture?width=100&height=100"
  end

  private
  def create_pass
    @temp_pass = (0...8).map { (65 + rand(26)).chr }.join
  end
end
