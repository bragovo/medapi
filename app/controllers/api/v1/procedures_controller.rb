class Api::V1::ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end
end
