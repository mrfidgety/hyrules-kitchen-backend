module Api
  module V1
    class ApiController < ApplicationController
      include Api::RelatedResourceInclusion
    end
  end
end
