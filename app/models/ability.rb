class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Country
    can :read, Site
    can :edit, User, :id => user.id
    can :new, User
    can :create, User
    can :areas, :all
    can :iccaCountryDetails, :all
    if user.role? :admin
      can :manage, :all
    end
  end
  
end