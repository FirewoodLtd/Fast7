# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    if user.present?  # additional permissions for logged in users (they can read their own posts)
      
      case user.role.name.downcase
        when 'firewood_admin'
          can :manage, :all
        when 'administrator'
          can :manage, User, customer_id: user.customer_id, role_id: 2..5
          can :manage, Project, customer_id: user.customer_id
          can :manage, Review, customer_id: user.customer_id
          can :manage, Project, customer_id: user.customer_id
          can :manage, ReviewMeasure, customer_id: user.customer_id
          can :manage, Document, customer_id: user.customer_id
          can :manage, Interview, customer_id: user.customer_id
          can :manage, Observation, customer_id: user.customer_id
          can :manage, Finding, customer_id: user.customer_id
          can :manage, ActionItem, customer_id: user.customer_id
          can :manage, ObservationLink, customer_id: user.customer_id
          can :manage, ::Template
        when 'reviewer'
          can :edit, User, id: user.id
          can :manage, Review, customer_id: user.customer_id
          can :manage, ReviewEvidence, customer_id: user.customer_id
          can :show, Project, customer_id: user.customer_id
          can :manage, ReviewMeasure, customer_id: user.customer_id
          can :manage, Document, customer_id: user.customer_id
          can :manage, Interview, customer_id: user.customer_id
          can :manage, Observation, customer_id: user.customer_id
          can :manage, Finding, customer_id: user.customer_id
          can :manage, ActionItem, customer_id: user.customer_id
          can :manage, ObservationLink, customer_id: user.customer_id
        when 'viewer'
          can :edit, User, id: user.id
          can :show, Review, customer_id: user.customer_id
          can :show, Project, customer_id: user.customer_id
          can :show, ReviewMeasure, customer_id: user.customer_id
          can :show, Document, customer_id: user.customer_id
          can :show, Interview, customer_id: user.customer_id
          can :show, Observation, customer_id: user.customer_id
          can :show, Finding, customer_id: user.customer_id
          can :show, ActionItem, customer_id: user.customer_id
        when 'action_owner'
          can :manage, ActionItem, user_id: user.id
         # can :read, :all, customer_id: user.customer_id
      end

      #can [:read, :update], User, id: user.id
      #can :read, User, customer_id: user.customer_id


    end
     
     
  end
end
