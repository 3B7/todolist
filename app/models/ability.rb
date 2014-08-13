class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new

        if user.role? :member
            can :manage, Todo, :user_id => user.id 
        end
    end
end
