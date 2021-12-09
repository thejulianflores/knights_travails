system "clear"
puts "Welcome!"
sleep(1)
puts "This program will calculate the shortest path for a knight across a chess board."
sleep(1)
answer = nil

while answer != 'y' and answer != 'n'
  print "Would you like to play?(y/n): "
  answer = gets.chomp
  system "clear"
end

while ( answer == 'y' )
  graph = []
  path_cost = []
  previous_vertex = []
  path_found = Array.new(8){Array.new(8, false)}
  queue = []
  possible_moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
  start_input = 'z9'
  target_input = 'z9'

  while !'abcdefgh'.include?(start_input[0]) or !(1..8).to_a.include?(start_input[1].to_i)
    print "What is the starting point? (Example: a1): "
    start_input = gets
    if start_input
      start = [start_input[0].ord - 96, start_input[1].to_i]
    else
      start_input = 'z9'
    end
  end

  sleep(1)
  system "clear"

  while !'abcdefgh'.include?(target_input[0]) or !(1..8).to_a.include?(target_input[1].to_i)
    print "What is the ending point? (Example: h8): "
    target_input = gets
    if target_input
      target = [target_input[0].ord - 96, target_input[1].to_i]
    else
      target_input = 'z9'
    end
  end

  sleep(1)
  system "clear"

  print "Thinking\r"
  sleep(1.0/4.0)
  print "Thinking.\r"
  sleep(1.0/4.0)
  print "Thinking..\r"
  sleep(1.0/4.0)
  print "Thinking...\r"
  sleep(1.0/4.0)

  (1..8).each do |i|
    (1..8).each do |j|
      graph.push([i,j])
    end
  end


  current_cost = 0

  queue.push([[nil,nil], start, current_cost])

  while !queue.empty? #and path_found.flatten.include?(false)
    

    #- Take the first item off the queue
    current_square = queue.shift
  
    #- If there is not yet a path to that vertex
    if( path_found[current_square[1][0] - 1][current_square[1][1] - 1] == false )
      #- Update the arrays
      path_cost.push(current_square[2] + 1)
      previous_vertex.push([current_square[1], current_square[0]])
      path_found[current_square[1][0] - 1][current_square[1][1] - 1] = true
  
      new_blocks = []
      possible_moves.each do |thing|
        new_blocks.push( current_square[1].zip(thing).map{|x,y|x+y})
      end
      #- For each edge out of the vertex
      new_blocks.each do |thing|
        #- If there is no path to the ending vertex yet
        next if !graph.include?(thing)


        if( path_found[thing[0] - 1][thing[1] - 1] == false )
          #- Add that vertex information to the queue
          queue.push( [current_square[1], thing, path_cost[-1]] )
        end
      end
    end
  end



  traversal = [target]
  current = target
  while current != start
    previous_vertex.each do |thing|
      if current == thing[0]
        current = thing[1]
      end
      traversal.push(current)
    end
  end

  puts "The traversal from #{(start[0]+96).chr}#{start[1]} to #{(target[0]+96).chr}#{target[1]} in #{traversal.uniq.reverse().length - 1} moves:"

  traversal.uniq.reverse().each_with_index do |thing, index|
    puts "#{index}:  #{(thing[0]+96).chr}#{thing[1]}"
  end

  answer = nil
  
  while answer != 'y' and answer != 'n'
    print "Would you like to play again?(y/n): "
    answer = gets.chomp
    system "clear"
  end

end

puts "Thank you for playing!"

