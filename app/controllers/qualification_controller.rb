class QualificationController < ApplicationController
  def index
    @qualifications = Qualification.all
  end
end
