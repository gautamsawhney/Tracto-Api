class PostPolicy < ApplicationPolicy

  # Autobot: Read Scope

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "" unless user 
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.restaurant_owner? || user.mod?
        scope.all
      else
        scope.none
      end
    end
  end

  # Autobot: Permitted Attributes
  def permitted_attributes
    #add_here
    if user.admin?
      [:body, :title, :user_id, :restaurant_id]
    elsif user.restaurant_owner?
      [:body, :title, :user_id, :restaurant_id]
    elsif user.mod?
      [:body, :title, :user_id, :restaurant_id]
    else
      []
    end
  end



  # Autobot: Permitted Actions
  def destroy?
    #return true if record.user_id == user.id
    user.admin? || user.restaurant_owner? || user.mod?
  end
  def update?
    #return true if record.user_id == user.id
    user.admin? || user.restaurant_owner? || user.mod?
  end
  def show?
    user.admin? || user.restaurant_owner? || user.mod?
  end
  def create?
    #return true if record.user_id == user.id
    user.admin? || user.restaurant_owner? || user.mod?
  end


end
