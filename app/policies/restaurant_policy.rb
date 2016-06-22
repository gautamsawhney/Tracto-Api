class RestaurantPolicy < ApplicationPolicy

  # Autobot: Read Scope

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "" unless user 
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.restaurant_owner?
        scope.where(user: user)
      else
        scope.all
      end
    end
  end

  # Autobot: Permitted Attributes



  # Autobot: Permitted Actions
def destroy?
                #return true if record.user_id == user.id
                user.admin? || user.restaurant_owner?
              end
def update?
                #return true if record.user_id == user.id
                user.admin? || user.restaurant_owner?
              end
 def show?
                  user.admin? || user.restaurant_owner?
                end
def create?
                #return true if record.user_id == user.id
                user.admin? || user.restaurant_owner?
              end


end
