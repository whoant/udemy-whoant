class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def show?
      @user.has_role?(:admin) || @record.course.user == @user
    end

    def edit?
      @record.course.user == @user
    end

    def update?
      # @record.course.user == @user
    end

    def new?
      # @user.has_role?(:teacher)
    end

    def create?
      @user.has_role?(:teacher)
    end

    def destroy?
      @record.course.user == @user
    end

  end
end
