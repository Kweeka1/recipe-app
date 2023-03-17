module ApplicationHelper
  def sum(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.food.price
    end
    sum
  end

  def sum_length(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.price
    end
    sum
  end
end
