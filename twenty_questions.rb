def get_yes_no
  reply = gets.chomp.downcase
  until ['y','n'].include? reply
    puts 'Please enter y/n'
    reply = gets.chomp.downcase
  end
  reply
end

class BinaryTree

  attr_accessor :value, :no_branch, :yes_branch

  def initialize(value)
    @value = value
  end

  def is_answer
    @no_branch.nil? && @yes_branch.nil?
  end

  def play_game(tree_root)
    puts `clear`
    if self.is_answer
      puts "Well you must have been thinking of #{@value}!"
      puts 'Is that correct? (y/n)'
      reply = get_yes_no
      puts `clear`

      if reply == 'y'
        puts "That's because I'm awesome."
      elsif reply == 'n'
        puts 'Oh. Well, what answer were you thinking of?'
        correct_answer = gets.chomp
        puts "What question should I have asked to distinguish between that and #{@value}?"
        differentiating_question = gets.chomp
        puts "Would #{correct_answer} have been the Yes (y) or No (n) answer to that question?"
        differentiating_boolean = get_yes_no

        false_answer = (differentiating_boolean == 'n' ? correct_answer : @value)
        true_answer = (differentiating_boolean == 'y' ? correct_answer : @value)

        @value = differentiating_question
        @no_branch = BinaryTree.new(false_answer)
        @yes_branch = BinaryTree.new(true_answer)
        puts `clear`
        puts 'I will not make that mistake again, Dave.'
      end
      puts "\n...would you like to play again?"
      reply = get_yes_no
      reply == 'y' ? tree_root.play_game(tree_root) : puts("#{`clear`} Pfff. Quitter.")
    else
      puts @value
      reply = get_yes_no
      reply == 'y' ? @yes_branch.play_game(tree_root) : @no_branch.play_game(tree_root)
    end
  end

  def to_s
    "#{@no_branch} << #{@value} >> #{@yes_branch}"
  end

  def self.generate_tree
    my_tree = BinaryTree.new('Is it an animal?')
    my_tree.no_branch = BinaryTree.new('Pumpkin')
    my_tree.yes_branch = BinaryTree.new('Lion')
    my_tree
  end
end