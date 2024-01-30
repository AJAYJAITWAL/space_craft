require "rspec"
require_relative "space_craft"

RSpec.describe SpaceCraft do
  describe "#initialize" do
    it "sets initial position and direction" do
      initial_position = [0, 0, 0]
      initial_direction = "N"
      space_craft = SpaceCraft.new(initial_position, initial_direction)
      expect(space_craft.position).to eq(initial_position)
      expect(space_craft.direction).to eq(initial_direction)
    end
  end

  describe "#process_commands" do
    context "with valid commands" do
      it "updates position and direction correctly" do
        initial_position = [0, 0, 0]
        initial_direction = "N"
        commands = ["f", "r", "u", "b", "l"]
        space_craft = SpaceCraft.new(initial_position, initial_direction)

        space_craft.process_commands(commands)

        expect(space_craft.position).to eq([0, 1, -1])
        expect(space_craft.direction).to eq("N")
      end
    end

    context "with invalid commands" do
      it "ignores invalid commands" do
        initial_position = [0, 0, 0]
        initial_direction = "N"
        commands = ["f", "x", "invalid", "b", "l"]
        space_craft = SpaceCraft.new(initial_position, initial_direction)

        space_craft.process_commands(commands)

        expect(space_craft.position).to eq([0, 0, 0])
        expect(space_craft.direction).to eq("W")
      end
    end
  end

  describe "#move_forward" do
    it "moves forward correctly when facing North" do
      initial_position = [0, 0, 0]
      initial_direction = "N"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.move_forward

      expect(space_craft.position).to eq([0, 1, 0])
    end

    it "moves forward correctly when facing South" do
      initial_position = [0, 0, 0]
      initial_direction = "S"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.move_forward

      expect(space_craft.position).to eq([0, -1, 0])
    end
  end

  describe "#move_backward" do
    it "moves backward correctly when facing North" do
      initial_position = [0, 0, 0]
      initial_direction = "N"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.move_backward

      expect(space_craft.position).to eq([0, -1, 0])
    end

    it "moves backward correctly when facing South" do
      initial_position = [0, 0, 0]
      initial_direction = "S"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.move_backward

      expect(space_craft.position).to eq([0, 1, 0])
    end
  end

  describe "#turn_left" do
    it "turns left correctly when facing North" do
      initial_position = [0, 0, 0]
      initial_direction = "N"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.turn_left

      expect(space_craft.direction).to eq("W")
    end

    it "turns left correctly when facing East" do
      initial_position = [0, 0, 0]
      initial_direction = "E"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.turn_left

      expect(space_craft.direction).to eq("N")
    end
  end

  describe "#turn_right" do
    it "turns right correctly when facing North" do
      initial_position = [0, 0, 0]
      initial_direction = "N"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.turn_right

      expect(space_craft.direction).to eq("E")
    end

    it "turns right correctly when facing West" do
      initial_position = [0, 0, 0]
      initial_direction = "W"
      space_craft = SpaceCraft.new(initial_position, initial_direction)

      space_craft.turn_right

      expect(space_craft.direction).to eq("N")
    end
  end
end
