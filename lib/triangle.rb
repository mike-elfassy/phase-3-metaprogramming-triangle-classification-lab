require 'pry'

class Triangle
  
  attr_reader :sides, :type

  def initialize(side_1, side_2, side_3)
    @sides = [side_1, side_2, side_3]
    # binding.pry
    if self.is_triangle?(self.sides)
      @type = self.determine_type
    else 
      raise TriangleError
    end
  end

  def kind
    @type
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle dimensions"
    end
  end

  private

  def is_triangle?(sides)
    is_triangle = true
    perimeter = sides.sum
    sides.each do |side|
      is_triangle = side > 0 && perimeter - side > side
      break if is_triangle == false
    end
    is_triangle
  end

  def determine_type
    case self.sides.uniq.length
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
    end
  end

end