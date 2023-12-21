class Ability
  include CanCan::Ability

  def initialize(user)
     return unless user.present?
     can :read, :all
     if user.admin?
     can :manage, :all
     end
  end
end
