class BinaryTree

  attr_accessor :value, :left_branch, :right_branch

  def initialize(value)
    @value = value
  end

  def insert(value)
    if value < @value
      # move to the left branch
      if @left_branch
        @left_branch.insert(value)
      else
        @left_branch = BinaryTree.new(value)
      end
    elsif value > @value
      # move to the right branch
      if @right_branch
        @right_branch.insert(value)
      else
        @right_branch = BinaryTree.new(value)
      end
    else
      # stuff to do if it's equal
      puts 'Cannot be equal!'
      nil
    end
  end


  def search(value)

  end

end
