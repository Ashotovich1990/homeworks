require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
     @player_one = name1
     @player_two = name2
     @cups = Array.new(14) {[]}
     fill_cups
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if !((0...6).to_a + (7...13).to_a).include?(start_pos)
      raise "Invalid starting cup"
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    collect_stones = []
    collect_stones, cups[start_pos] = cups[start_pos], collect_stones
    @move_count = start_pos
    if current_player_name == @player_one #playe_one has the cup 6
      distribute_stones(collect_stones,start_pos,6,13)
    else
      distribute_stones(collect_stones,start_pos,13,6)
    end
    render
    next_turn(current_player_name)
  end

  def next_turn(current_player_name)
  ending_cup_idx = @move_count
    if current_player_name == @playe_one
      return :prompt if ending_cup_idx == 6
    else
      return :prompt if ending_cup_idx == 13
    end

    return :switch if cups[ending_cup_idx].size == 1

    ending_cup_idx
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0...6].all? {|cup| cup.empty?} || cups[7...13].all? {|cup| cup.empty?}
  end

  def winner
    case cups[6].size <=> cups[13].size
     when -1
      return @player_two
     when 0
      return :draw
     else
      return @player_one
    end
  end

  private
  def fill_cups
    @cups[0...6].each {|cup| 4.times {cup << :stone}}
    @cups[7...13].each {|cup| 4.times {cup << :stone}}
  end

  def distribute_stones(collect_stones,start_pos,player_cup,opponent_cup)
    until collect_stones.empty?
      (cups[start_pos+1..-1] + cups[0..start_pos]).each do |cup|


          unless cup.object_id == cups[opponent_cup].object_id || collect_stones.empty?
            cup << collect_stones.pop
            @move_count += 1
            @move_count = 0 if @move_count > 13
          end

      end
      # 1234567
      #321 7654
    end
  end
end

p 1 <=> 2
