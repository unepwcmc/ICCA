class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Country
    can :read, Site

    can :edit, User, :id => user.id
    can :update, User, :id => user.id
    can :new, User
    can :create, User
    can :forgot_password, User
    can :reset_password, User

    can :read, Form if user.id.present?
    can :create, Form if user.id.present?
    can :update, Form, :user_id => user.id

    can :read, StaticContent

    can :areas, :all
    can :iccaCountryDetails, :all

    if user.role? :admin
      can :manage, :all
    end
  end

end
