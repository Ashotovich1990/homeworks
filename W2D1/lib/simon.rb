class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @game_over = false
    @sequence_length = 1
    @response = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if round_success_message
      self.sequence_length += 1
    else
      self.game_over = true
    end
  end

  def show_sequence
    add_random_color
    self.seq.each do |color|
      puts color
      sleep 2
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    @response = []
    alp = ("a".."z").to_a
    puts "Repeat the sequence: ex 'red, blue, yellow, green'"
    answer = gets.chomp

    color = ""
    answer.chars.each do |ch|
      if alp.include?(ch)
        color << ch
      else
        @response << color
        color = ""
      end
    end
    @response << color
    @response.select! {|word| COLORS.include?(word)}
    puts "Thanks for the answer"
  end

  def add_random_color
    self.seq = []
    self.sequence_length.times do
     self.seq << COLORS.shuffle[0]
    end
  end

  def round_success_message
    self.seq == @response
  end

  def game_over_message
    puts "the game over: the last sequence was"
    self.game_over = true
    p self.seq
    puts "Your response was"
    p @response
  end

  def reset_game
    puts "Do you want to reset the game?: Y/N"
    answer = gets.chomp
    if answer.upcase == "Y"
      self.game_over = false
      self.seq = []
      self.sequence_length = 1
      @response = []
      play
    else
      puts "Goodbye"
    end
  end
end
#@seq.each do |color|
      #puts color
      #sleep 0.75
    #  system("clear")
      #sleep 0.25
