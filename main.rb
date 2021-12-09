class Board 

    attr_accessor :graph
  
    def initialize
      @@graph = []
  
      (1..8).each do |i|
        (1..8).each do |j|
          @@graph.push([i,j])
        end
      end
  
    end
  
  end
  
  class Knight < Board
  
    def initialize
      @possible_moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
      @path_cost = []
      @previous_vertex = []
      @path_found = Array.new(8){Array.new(8, false)}
      @start = getStartPoint
      @target = getEndPoint
      @current_cost = 0
      @queue = []
    end
  
    def getStartPoint
      start_input = 'z9'
      while !'abcdefgh'.include?(start_input[0]) or !(1..8).to_a.include?(start_input[1].to_i)
        print "What is the starting point? (Example: a1): "
        start_input = gets
        if start_input
          start = [start_input[0].ord - 96, start_input[1].to_i]
        else
          start_input = 'z9'
        end
      end
      start
    end
  
    def getEndPoint
      target_input = 'z9'
      while !'abcdefgh'.include?(target_input[0]) or !(1..8).to_a.include?(target_input[1].to_i)
        print "What is the ending point? (Example: h8): "
        target_input = gets
        if target_input
          target = [target_input[0].ord - 96, target_input[1].to_i]
        else
          target_input = 'z9'
        end
      end
      target
    end
  
    def getPaths
      @queue.push([[nil,nil], @start, @current_cost])
  
      while !@queue.empty? #and path_found.flatten.include?(false)
        
        #- Take the first item off the queue
        current_square = @queue.shift
      
        #- If there is not yet a path to that vertex
        if( @path_found[current_square[1][0] - 1][current_square[1][1] - 1] == false )
          #- Update the arrays
          updatePath(current_square)
      
          new_blocks = getNewMoves(current_square)
          
          #- For each edge out of the vertex
          new_blocks.each do |thing|
            #- If there is no path to the ending vertex yet
            next if !@@graph.include?(thing)
  
            if( @path_found[thing[0] - 1][thing[1] - 1] == false )
              #- Add that vertex information to the queue
              @queue.push( [current_square[1], thing, @path_cost[-1]] )
            end
          end
        end
      end
    end
  
    def updatePath(current_move)
      @path_cost.push(current_move[2] + 1)
      @previous_vertex.push([current_move[1], current_move[0]])
      @path_found[current_move[1][0] - 1][current_move[1][1] - 1] = true
    end
  
    def getNewMoves(current_move)
      new_blocks = []
      @possible_moves.each do |thing|
        new_blocks.push( current_move[1].zip(thing).map{|x,y|x+y})
      end
      new_blocks
    end
  
    def getTraversal
      traversal = [@target]
      current = @target
      while current != @start
        @previous_vertex.each do |thing|
          if current == thing[0]
            current = thing[1]
          end
          traversal.push(current)
        end
      end
      traversal.uniq.reverse()
    end
  
    def showTraversal
      traversal = getTraversal
      puts "The traversal from #{(@start[0]+96).chr}#{@start[1]} to #{(@target[0]+96).chr}#{@target[1]} in #{traversal.length - 1} moves:"
  
      traversal.each_with_index do |thing, index|
        puts "#{index}:  #{(thing[0]+96).chr}#{thing[1]}"
      end
    end
  
  end
  
  def beginGame
    system "clear"
    puts "Welcome!"
    sleep(1)
    puts "This program will calculate the shortest path for a knight across a chess board."
    sleep(1)
  end
  
  def play?(text = "Would you like to play?(y/n): ") 
    answer = nil
    while answer != 'y' and answer != 'n'
      print text
      answer = gets.chomp
      system "clear"
    end
    case answer
    when 'y'
      return true
    else
      return false
    end
  end
  
  
  beginGame
  willPlay = play?
  while willPlay
    gameBoard = Board.new
    knight = Knight.new
    knight.getPaths
    knight.showTraversal
    willPlay = play?("Would you like to play again?(y/n): ")
  end
  
  puts "Thank you for playing!"
  