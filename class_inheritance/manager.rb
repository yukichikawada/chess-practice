require "byebug"
require_relative 'employee.rb'

class Manager < Employee

  def initialize(name, salary, title, boss, employees)
    super(name, salary, title, boss)
    @employees = employees
  end

  def bonus(multiplier)
    sub_total = subordinates_salary
    @bonus = (sub_total) * multiplier
  end


  def subordinates_salary
    sub_total = 0
    @employees.each do |subordinate|
      if subordinate.is_a? Manager
        sub_total += subordinate.salary
        sub_total += subordinate.subordinates_salary
      else
        sub_total += subordinate.salary
      end
    end

    sub_total
  end

end
