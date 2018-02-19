class Employee
  attr_reader :name, :salary, :title, :boss, :bonus

  def initialize(name, salary, title, boss)
    @name, @salary, @title, @boss = name, salary, title, boss
  end

  def bonus(multiplier)
    @bonus = salary * multiplier
  end

end
