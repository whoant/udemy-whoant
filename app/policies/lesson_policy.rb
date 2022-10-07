class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def edit?
      @record.course.user == @user
    end

    def create?
      @record.course.user == @user
    end

    def destroy?
      @record.course.user == @user
    end

  end
end
