require 'csv'
require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :import do
  task employees: :environment do
    file_path = Rails.root.join('support/employees.csv')
    print_memory_usage do
      print_time_spent do
        Imports::Employees.new.run(file_path)
      end
    end
  end

  task transactions: :environment do
    file_path = Rails.root.join('support/transactions.csv')
    print_memory_usage do
      print_time_spent do
        Imports::Transactions.new.run(file_path)  
      end
    end
  end
end
