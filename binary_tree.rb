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
    if value < @value
      return @left_branch.search(value) if @left_branch
    elsif value > @value
      return @right_branch.search(value) if @right_branch
    else
      return self
    end
    # Only hit this if you get to the end of the branch without finiding
    return nil
  end

  def to_s
    "#{@left_branch} << #{@value} >> #{@right_branch}"
  end

end

my_tree = BinaryTree.new('k')
my_tree.insert('r')
my_tree.insert('d')
my_tree.insert('b')
my_tree.insert('p')
my_tree.insert('x')
my_tree.insert('v')
my_tree.insert('f')
















