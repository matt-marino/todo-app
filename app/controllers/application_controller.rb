# typed: false
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Minerva::Authentication
  add_flash_types(:danger)
end
