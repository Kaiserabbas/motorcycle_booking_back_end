class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :create, Reservation
      can :read, :all
    end
  end
end
