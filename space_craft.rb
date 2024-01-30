class SpaceCraft
  attr_accessor :direction, :position

  def  initialize(init_position, init_direction)
    @direction = init_direction
    @position = init_position
  end
   
  def process_commands(commands)
    commands.each do |cmd|
      process(cmd.downcase)
    end 
  end

  def process(cmd)
    case  cmd
    when "f"
      self.move_forward()
    when "b"
      self.move_backward()
    when "l"
      self.turn_left()
    when "r"
      self.turn_right()
    end
  end

  def move_forward
    case @direction
    when "N", "S" then @position[1] += (@direction == "N" ? 1 : -1)
    when "E", "W" then @position[2] += (@direction == "E" ? 1 : -1)
    end
  end

  def move_backward
    case @direction
    when "N", "S" then @position[1] -= (@direction == "N" ? 1 : -1)
    when "E", "W" then @position[2] -= (@direction == "E" ? 1 : -1)
    end
  end

  def turn_left
    @direction = case @direction
                 when "N" then "W"
                 when "W" then "S"
                 when "S" then "E"
                 when "E" then "N"
                 end
  end

  def turn_right
    @direction = case @direction
                 when "N" then "E"
                 when "E" then "S"
                 when "S" then "W"
                 when "W" then "N"
                 end
  end
end

initial_position = [0, 0, 0]
initial_direction = "N"

commands = ["f", "r", "u", "b", "l"]

spacescraft = SpaceCraft.new(initial_position, initial_direction)
spacescraft.process_commands(commands)

p spacescraft.position
p spacescraft.direction
