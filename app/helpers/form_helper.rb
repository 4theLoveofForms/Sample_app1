module FormHelper

  def setup_user(user)
    user.address ||= Address.new
    3.times { user.tasks.build }
    (Interest.all - user.interests).each do |interest|
      user.interest_user_joins.build(interest: interest)
    end
    user
  end
end
