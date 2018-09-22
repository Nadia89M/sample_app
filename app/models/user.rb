class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :comments

  class Ability
    include CanCan::Ability

    def initialize(user)
      can :read, :all
      if user.present?
        can :manage, Comment, user_id: user.id
        if user.admin?
          can :manage, :all
        end
      end
    end
  end

end
