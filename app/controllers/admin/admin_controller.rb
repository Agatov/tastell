class Admin::AdminController < ApplicationController
  http_basic_authenticate_with :name => 'molchanie', :password => 'zoloto'
end