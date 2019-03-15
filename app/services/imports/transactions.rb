module Imports
  class Transactions
    BULK_SIZE = 1000

    def run(file_path)
      Transaction.delete_all
      Week.delete_all

      transactions = []
      errors = []

      CSV.foreach(file_path, headers: true).with_index(1) do |row, row_index|
        coffeeshop = coffeeshops[row['coffeeshop']]
        employee = employees[row['employee']]
        coffee = coffees[row['coffee']]
        week = weeks(row['sold_at'])

        errors << "Error parsing of #{row}" and next unless coffeeshop && employee && coffee

        transactions << Transaction.new(
          coffeeshop: coffeeshop, 
          employee: employee, 
          coffee: coffee, 
          price: row['price'],
          week: week,
          sold_at: row['sold_at']
        )

        if row_index % BULK_SIZE == 0
          Transaction.import! transactions
          transactions.clear
        end
      end

      Transaction.import(transactions) if transactions.any?
    end

    private
    
    def coffeeshops
      @coffeeshops ||= Coffeeshop
        .all
        .to_a
        .map{|coffeeshop| [ coffeeshop[:identifier], coffeeshop ]}
        .to_h
    end

    def employees
      @employees ||= Employee
        .all
        .to_a
        .map{|employee| [ employee[:identifier], employee ]}
        .to_h
    end

    def coffees
      @coffees ||= CoffeeshopCoffee
        .all
        .to_a
        .map{|coffeeshop_coffee| [ coffeeshop_coffee[:identifier], coffeeshop_coffee.coffee ]}
        .to_h      
    end

    def weeks(date_time_str)
      @weeks ||= {}

      date_str = date_time_str.split(' ').first
      date = Date.parse(date_str)
      week_start = date.at_beginning_of_week
      week_end = date.at_end_of_week
      week_key = "#{week_start}-#{week_end}"

      week = @weeks[week_key]
      unless week
        week = Week.create!(week_start: week_start, week_end: week_end)
        @weeks[week_key] = week
      end
      week
    end  
  end
end
