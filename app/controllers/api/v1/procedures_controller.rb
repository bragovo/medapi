class Api::V1::ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
    if params[:q].present?
      @procedures = @procedures
        .where("POSITION(LOWER('#{params[:q]}') IN LOWER(title)) > 0")
        .order("POSITION(LOWER('#{params[:q]}') IN LOWER(title))")
    end
  end
end
