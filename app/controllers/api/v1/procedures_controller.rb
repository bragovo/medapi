class Api::V1::ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
    if params[:q].present?
      @procedures = @procedures
      .where("LOWER(title) LIKE LOWER('%#{params[:q]}%')")
      .sort_by { |procedure| procedure.title.downcase.index(params[:q].downcase) }
    end
  end
end
