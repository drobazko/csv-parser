module Imports
  class Employees
    def run(file_path)
      coffeeshops = Coffeeshop
        .all
        .to_a
        .map{|coffeeshop| [ coffeeshop[:identifier], coffeeshop ]}
        .to_h

      CSV.foreach(file_path, headers: true) do |row|
        coffeeshop = coffeeshops[row['coffeeshop']]
        Employee.create(coffeeshop: coffeeshop, identifier: row['employee id'], name: row['name'])
      end
    end
  end
end
