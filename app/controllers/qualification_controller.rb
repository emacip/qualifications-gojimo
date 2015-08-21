class QualificationController < ApplicationController
  def index
    @qualifications = Qualification.all
  end

  def subjects
    @qualification = Qualification.find params[:id]
    @subjects = @qualification.subjects
  end

end
