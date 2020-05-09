module FormHelper

  def setup_user(user)
    user.address ||= Address.new
    3.times { user.tasks.build }
    user
  end
end
