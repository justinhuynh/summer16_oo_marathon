class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date, :cages, :employees
  def initialize (name,season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    10.times do
      @cages << Cage.new
    end
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date <= season_closing_date &&
    date >= season_opening_date
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end

    raise ZooAtCapacity
  end

  def visit
    output = ""
    @employees.each do |employee|
      output += employee.greet + "\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        output += cage.animal.speak + "\n"
      end
    end
    output
  end

end

class ZooAtCapacity < StandardError
end
